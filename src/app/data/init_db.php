<?php
// init_db.php - Initializes SQLite DB and creates table

$dbDir = __DIR__ . '/data';
$dbFile = $dbDir . '/closings.db ';

if (!is_dir($dbDir)) {
    mkdir($dbDir, 0755, true);
}

try {

  $db = new PDO('sqlite:/var/www/html/data/closings.db');
  $sql = file_get_contents('/var/www/html/data/sql/seed.sql');
  $db->exec($sql);
  echo 'Database successfully seeded!';
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}