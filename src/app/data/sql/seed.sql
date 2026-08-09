-- 1. Old table cleanup
DROP TABLE IF EXISTS closings;

-- 2. Schema with BOTH 'category' AND 'mood'
CREATE TABLE closings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phrase TEXT NOT NULL,
    language VARCHAR(5) NOT NULL DEFAULT 'de',
    category VARCHAR(50) NOT NULL,              -- e.g. neutral, subculture, location_based, romantic
    mood VARCHAR(50) NOT NULL,                  -- e.g. annoyed, sensual, dry, welcoming, ironic
    relationship_level INTEGER NOT NULL DEFAULT 3, -- 1 (informal/distant) to 5 (intimate/close)
    tags TEXT,                                  -- CSV: "biker,scene,bad-one"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_cat_mood_lang ON closings(category, mood, language);

-- ============================================================================
-- GERMAN (DE) CLOSINGS
-- ============================================================================

-- Category: general | Mood: neutral
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Ohne Grüsse', 'de', 'general', 'neutral', 1, 'direct,none'),
('Einfacher Gruss', 'de', 'general', 'neutral', 3, 'simple,classic'),
('Beste Grüsse', 'de', 'general', 'neutral', 3, 'standard,formal'),
('Kurzer Gruss', 'de', 'general', 'neutral', 3, 'casual,short'),
('Gruss in die Runde', 'de', 'general', 'neutral', 3, 'group,team'),
('Soweit von mir', 'de', 'general', 'neutral', 2, 'informal,brief'),
('In diesem Sinne', 'de', 'general', 'neutral', 3, 'classic');

-- Category: conflict | Mood: annoyed
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Genervten Gruss', 'de', 'conflict', 'annoyed', 2, 'dry,annoyed'),
('Mit der Bitte um Nicht-Rückmeldung', 'de', 'conflict', 'annoyed', 2, 'passive-aggressive,office'),
('Bis hoffentlich gar nicht', 'de', 'conflict', 'annoyed', 1, 'harsh,direct'),
('Gruss aus der Warteschleife', 'de', 'conflict', 'annoyed', 2, 'waiting,dry'),
('Mit erschöpften Grüssen', 'de', 'conflict', 'annoyed', 2, 'tired,work'),
('Trotzdem beste Grüsse', 'de', 'conflict', 'annoyed', 3, 'passive-aggressive'),
('Ende der Durchsage', 'de', 'conflict', 'annoyed', 2, 'radio,final');

-- Category: intimacy | Mood: sensual
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Lustwoller Gruss', 'de', 'intimacy', 'sensual', 5, 'intimate,sensual'),
('Verlangende Grüsse', 'de', 'intimacy', 'sensual', 5, 'intimate,desire'),
('Mit einem Prickeln', 'de', 'intimacy', 'sensual', 5, 'playful,sensual'),
('In Sehnsucht', 'de', 'intimacy', 'sensual', 5, 'deep,intimate'),
('Verführerische Grüsse', 'de', 'intimacy', 'sensual', 5, 'seductive'),
('Bis meine Haut deine berührt', 'de', 'intimacy', 'sensual', 5, 'poetic,intimate');

-- Category: hospitality | Mood: welcoming
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Für ein Gruss komm vorbei', 'de', 'hospitality', 'welcoming', 4, 'invite,personal'),
('Gruss zurück, wenn du magst', 'de', 'hospitality', 'welcoming', 3, 'casual,open'),
('Lass von dir hören', 'de', 'hospitality', 'welcoming', 4, 'friendly,contact'),
('Kaffee steht bereit', 'de', 'hospitality', 'welcoming', 4, 'invite,coffee');

-- Category: environment | Mood: location_based
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Grüsse aus den Bergen', 'de', 'environment', 'location_based', 3, 'mountains,alpine'),
('Grüsse vom Gipfel', 'de', 'environment', 'location_based', 3, 'summit,hiking'),
('Sonnige Grüsse aus dem Süden', 'de', 'environment', 'location_based', 3, 'sun,vacation'),
('Verregnete Grüsse vom Schreibtisch', 'de', 'environment', 'location_based', 2, 'work,weather'),
('Grüsse aus der Hütte', 'de', 'environment', 'location_based', 3, 'cabin,mountains');

-- Category: humor | Mood: ironic
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Mit koffeinhaltigen Grüssen', 'de', 'humor', 'ironic', 3, 'coffee,humor'),
('Gruss aus dem Chaos', 'de', 'humor', 'ironic', 2, 'chaos,office'),
('Mit digitalem Kopfnicken', 'de', 'humor', 'ironic', 3, 'tech,nod'),
('Überlebende Grüsse', 'de', 'humor', 'ironic', 2, 'survival,humor'),
('High Five aus der Ferne', 'de', 'humor', 'ironic', 3, 'casual,digital');


-- ============================================================================
-- ENGLISH (EN) CLOSINGS
-- ============================================================================

-- Category: general | Mood: neutral
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Best regards', 'en', 'general', 'neutral', 3, 'standard,office'),
('Kind regards', 'en', 'general', 'neutral', 3, 'polite,standard'),
('Cheers', 'en', 'general', 'neutral', 4, 'casual,friendly'),
('Best', 'en', 'general', 'neutral', 3, 'short,modern');

-- Category: conflict | Mood: annoyed
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('No regards', 'en', 'conflict', 'annoyed', 1, 'cold,dry'),
('As per my last email', 'en', 'conflict', 'annoyed', 2, 'passive-aggressive,office'),
('Over and out', 'en', 'conflict', 'annoyed', 2, 'radio,final');

-- Category: humor | Mood: ironic
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Caffeinated regards', 'en', 'humor', 'ironic', 3, 'coffee,humor'),
('Greetings from the chaos', 'en', 'humor', 'ironic', 2, 'work,humor'),
('A digital nod', 'en', 'humor', 'ironic', 3, 'tech,remote');