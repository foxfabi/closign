<?php
// src/app/migrate.php - Schlankes Native-PHP Migrationstool für SQLite

$dbFile = __DIR__ . '/data/closings.db';
$migrationsDir = __DIR__ . '/data/migrations';

if (!file_exists($dbFile)) {
  die("Datenbank nicht gefunden unter: $dbFile\n");
}

try {
  $db = new PDO('sqlite:' . $dbFile);
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // 1. Migrationstabelle erstellen (falls nicht vorhanden)
  $db->exec("
        CREATE TABLE IF NOT EXISTS schema_migrations (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            migration VARCHAR(255) NOT NULL UNIQUE,
            executed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
    ");

  // 2. Bereits ausgeführte Migrationen abrufen
  $executed = $db->query("SELECT migration FROM schema_migrations")->fetchAll(PDO::FETCH_COLUMN);

  // 3. Alle .sql Datein aus /migrations lesen
  if (!is_dir($migrationsDir)) {
    mkdir($migrationsDir, 0755, true);
  }

  $files = glob($migrationsDir . '/*.sql');
  sort($files); // Garantiert chronologische Reihenfolge (z.B. 001_..., 002_...)

  $count = 0;
  foreach ($files as $file) {
    $filename = basename($file);

    if (!in_array($filename, $executed)) {
      echo "Führe Migration aus: $filename ... ";

      $sql = file_get_contents($file);

      $db->beginTransaction();
      $db->exec($sql);

      $stmt = $db->prepare("INSERT INTO schema_migrations (migration) VALUES (:migration)");
      $stmt->execute([':migration' => $filename]);
      $db->commit();

      echo "DONE\n";
      $count++;
    }
  }

  if ($count === 0) {
    echo "Keine neuen Migrationen vorhanden. Datenbank ist auf dem neuesten Stand.\n";
  } else {
    echo "Erfolgreich $count Migration(en) ausgeführt.\n";
  }
} catch (Exception $e) {
  if (isset($db) && $db->inTransaction()) {
    $db->rollBack();
  }
  echo "Fehler bei der Migration: " . $e->getMessage() . "\n";
}
