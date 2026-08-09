<?php
// index.php - Contextual Closings API (CTX-API)
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, OPTIONS');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// 1. Connect to SQLite Database
try {
    $db = new PDO('sqlite:' . __DIR__ . '/data/closings.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed']);
    exit();
}
// Parameters
$lang     = filter_input(INPUT_GET, 'lang', FILTER_SANITIZE_SPECIAL_CHARS) ?: 'de';
$category = filter_input(INPUT_GET, 'category', FILTER_SANITIZE_SPECIAL_CHARS);
$mood     = filter_input(INPUT_GET, 'mood', FILTER_SANITIZE_SPECIAL_CHARS);
$limit    = filter_input(INPUT_GET, 'limit', FILTER_VALIDATE_INT) ?: 5;

// Query Builder
$query = "SELECT id, phrase, language, category, mood, relationship_level, tags FROM closings WHERE language = :lang";
$params = [':lang' => $lang];

if ($category) {
    $query .= " AND category = :category";
    $params[':category'] = $category;
}

if ($mood) {
    $query .= " AND mood = :mood";
    $params[':mood'] = $mood;
}

$query .= " ORDER BY RANDOM() LIMIT :limit";

$stmt = $db->prepare($query);
foreach ($params as $key => $val) {
    $stmt->bindValue($key, $val);
}
$stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
$stmt->execute();

$results = $stmt->fetchAll();
echo json_encode([
    'status' => 'success',
    'query' => [
        'lang' => $lang,
        'category' => $category,
        'mood' => $mood,
        'limit' => $limit
    ],
    'count' => count($results),
    'data' => array_map(function ($row) {
        $row['tags'] = $row['tags'] ? explode(',', $row['tags']) : [];
        return $row;
    }, $results)
], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);