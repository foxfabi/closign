# Closign (Contextual Sign-offs)

> Smart, context-aware sign-offs and closings for emails and messages.

**Closign** is a lightweight REST API (PHP + SQLite) paired with a Manifest V3 Chrome Extension to instantly insert contextual greetings, sign-offs, and farewells into any text area or email client.

---

## Features

* **Multi-Language Support:** Sign-offs available in German (`de`), English (`en`), Italian (`it`), and French (`fr`).
* **Context & Mood Filtering:** Filter by category (*general, conflict, intimacy, subculture, environment, humor*) and mood (*neutral, annoyed, sensual, ironic, location_based, welcoming*).
* **Chrome Extension (Manifest V3):**
* **Quick Shortcut:** `Alt + C` opens the picker directly inside active text fields.
* **Instant Search:** Full-text client-side search across phrases, categories, moods, and tags.
* **Keyboard Navigation:** Arrow keys (`Up` / `Down`) and `Enter` for hands-on-keyboard efficiency.
* **Context Menu:** Native right-click menu to insert sign-offs by mood directly.


* **Zero External Dependencies:** Native PHP + SQLite backend, easy to host anywhere (Docker, Apache/Nginx, Hostpoint, shared hosting).
* **Lightweight Migration System:** Built-in PHP migration script (`migrate.php`) for schema and seed versioning.

---

## Project Structure

```text
closign/
├── src/app/
│   ├── data/            # SQLite database storage (closings.db)
│   ├── migrations/      # SQL migration scripts (001_..., 002_...)
│   ├── index.php        # Core REST API endpoint
│   └── migrate.php      # Native PHP SQLite migration runner
├── src/extension/   # Chrome Extension (Manifest V3)
│   ├── manifest.json
│   ├── config.js        # Environment configuration (API URL)
│   ├── popup.html / .js # UI Picker with instant search & keyboard navigation
│   └── background.js    # Service worker & right-click context menu
└── docker-compose.yml   # Local PHP 8.3 + Nginx stack

```

---

## Quickstart (Local Development with Docker)

### 1. Start Docker Stack

```bash
git clone [https://github.com/foxfabi/closign.git](https://github.com/foxfabi/closign.git)
cd closign
docker-compose up -d

```

### 2. Run Database Migrations

Run the native migration runner to set up the SQLite database and seed initial data:

```bash
docker exec -it closign-php php /var/www/html/migrate.php

```

### 3. Test API Endpoint

```bash
# Get random German sign-offs
curl "http://localhost:8080/index.php?lang=de&limit=5"

# Filter by mood
curl "http://localhost:8080/index.php?lang=de&mood=ironic"

# Get French or Italian sign-offs
curl "http://localhost:8080/index.php?lang=fr&mood=sensual"
curl "http://localhost:8080/index.php?lang=it&mood=welcoming"

```

---

## Chrome Extension Setup

1. Open Google Chrome and navigate to `chrome://extensions/`.
2. Enable **Developer mode** (top right toggle).
3. Click **Load unpacked** (top left) and select the `extension/` directory from this repo.
4. **Configure API URL:** Copy or edit `extension/config.example.js` to point to your local or production API:
```javascript
export const CONFIG = {
  API_URL: 'http://localhost:8080/index.php' // or your custom IP / production URL
};

```


5. Press **`Alt + C`** in any text input field or right-click to insert a sign-off!

---

## License

[MIT](./LICENSE)