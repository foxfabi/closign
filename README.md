# Closign (Contextual Sign-offs)

> Smart, context-aware sign-offs and closings for emails and messages.

Closign is a lightweight REST API (PHP + SQLite) paired with a Manifest V3 Chrome Extension to instantly insert contextual greetings, sign-offs, and farewells into any text area.

## Features
- **Context-Aware Closings:** Filter by language (`de`, `ìt`, `fr`, `en`), category, and mood (`neutral`, `annoyed`, `sensual`, `ironic`, `location_based`).
- **Chrome Extension:** Full-text instant search, keyboard navigation (`Alt+C` shortcut), and native right-click context menu insertion.
- **Ultra Lightweight:** Zero-dependency PHP + SQLite backend, easy to host on any classic webhost (e.g., Apache/PHP) or via Docker.

## Quickstart (Docker Dev Stack)

```bash
git clone [https://github.com/foxfabi/closign.git](https://github.com/foxfabi/closign.git)
cd closign
docker-compose up -d
```

## Initialize & seed database:
```bash
docker exec -it closign-php php -r "
  \$db = new PDO('sqlite:/var/www/html/data/closings.db');
  \$sql = file_get_contents('/var/www/html/data/sql/seed.sql');
  \$db->exec(\$sql);
"
```
## Access API:

```bash
curl "http://localhost:8080/index.php?lang=de&mood=ironic"
```