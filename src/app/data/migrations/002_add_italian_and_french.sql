
-- ============================================================================
-- ITALIAN (IT) CLOSINGS
-- ============================================================================

-- Category: general | Mood: neutral
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Cordiali saluti', 'it', 'general', 'neutral', 3, 'standard,formal'),
('Un caro saluto', 'it', 'general', 'neutral', 4, 'warm,casual'),
('Saluti', 'it', 'general', 'neutral', 2, 'short,direct'),
('A presto', 'it', 'general', 'neutral', 3, 'friendly,standard'),
('Buona giornata', 'it', 'general', 'neutral', 3, 'day,polite');

-- Category: conflict | Mood: annoyed
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Senza saluti', 'it', 'conflict', 'annoyed', 1, 'cold,direct'),
('Come da mia precedente email', 'it', 'conflict', 'annoyed', 2, 'passive-aggressive,office'),
('Distinti saluti (e basta)', 'it', 'conflict', 'annoyed', 2, 'dry,sarcastic'),
('Fine delle comunicazioni', 'it', 'conflict', 'annoyed', 1, 'final,direct');

-- Category: intimacy | Mood: sensual
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Con un brivido', 'it', 'intimacy', 'sensual', 5, 'playful,sensual'),
('Con inteso desiderio', 'it', 'intimacy', 'sensual', 5, 'intimate,desire'),
('Fino a quando le nostre pelli si toccheranno', 'it', 'intimacy', 'sensual', 5, 'poetic,intimate'),
('Abbracci caldi', 'it', 'intimacy', 'sensual', 4, 'warm,close');

-- Category: subculture | Mood: identity
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Saluti sportivi', 'it', 'subculture', 'casual', 3, 'sports,active'),
('Un pugno chiuso', 'it', 'subculture', 'identity', 4, 'solidarity,scene'),
('Sempre avanti', 'it', 'subculture', 'identity', 4, 'scene,solidarity');

-- Category: hospitality | Mood: welcoming
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Passa a trovarmi per un saluto', 'it', 'hospitality', 'welcoming', 4, 'invite,personal'),
('Caffè pronto', 'it', 'hospitality', 'welcoming', 4, 'invite,coffee'),
('Fatti sentire', 'it', 'hospitality', 'welcoming', 3, 'casual,open');

-- Category: environment | Mood: location_based
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Saluti dalle montagne', 'it', 'environment', 'location_based', 3, 'mountains,alpine'),
('Un saluto dalla vetta', 'it', 'environment', 'location_based', 3, 'summit,hiking'),
('Saluti soleggiati dal sud', 'it', 'environment', 'location_based', 3, 'sun,vacation');

-- Category: humor | Mood: ironic
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Saluti caffeinati', 'it', 'humor', 'ironic', 3, 'coffee,humor'),
('Saluti dal caos', 'it', 'humor', 'ironic', 2, 'chaos,office'),
('Un cenno digitale', 'it', 'humor', 'ironic', 3, 'tech,remote');


-- ============================================================================
-- FRENCH (FR) CLOSINGS
-- ============================================================================

-- Category: general | Mood: neutral
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Cordialement', 'fr', 'general', 'neutral', 3, 'standard,formal'),
('Bien cordialement', 'fr', 'general', 'neutral', 3, 'polite,formal'),
('Meilleures salutations', 'fr', 'general', 'neutral', 3, 'standard,swiss-french'),
('Chaleureusement', 'fr', 'general', 'neutral', 4, 'warm,friendly'),
('À bientôt', 'fr', 'general', 'neutral', 3, 'casual,standard');

-- Category: conflict | Mood: annoyed
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Sans salutations', 'fr', 'conflict', 'annoyed', 1, 'cold,direct'),
('Comme indiqué dans mon précédent e-mail', 'fr', 'conflict', 'annoyed', 2, 'passive-aggressive,office'),
('Sincères salutations (malgré tout)', 'fr', 'conflict', 'annoyed', 2, 'dry,passive-aggressive'),
('Fin de la transmission', 'fr', 'conflict', 'annoyed', 1, 'radio,final');

-- Category: intimacy | Mood: sensual
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Avec frisson', 'fr', 'intimacy', 'sensual', 5, 'playful,sensual'),
('Dans l’attente de te toucher', 'fr', 'intimacy', 'sensual', 5, 'intimate,deep'),
('Désir ardent', 'fr', 'intimacy', 'sensual', 5, 'intimate,desire'),
('Tendres pensées', 'fr', 'intimacy', 'sensual', 4, 'warm,sweet');

-- Category: subculture | Mood: identity
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Salutations sportives', 'fr', 'subculture', 'casual', 3, 'sports,active'),
('Le poing levé', 'fr', 'subculture', 'identity', 4, 'solidarity,scene'),
('Amicalement militant', 'fr', 'subculture', 'identity', 4, 'scene,political');

-- Category: hospitality | Mood: welcoming
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Passe dire bonjour', 'fr', 'hospitality', 'welcoming', 4, 'invite,personal'),
('Le café est prêt', 'fr', 'hospitality', 'welcoming', 4, 'invite,coffee'),
('Au plaisir de te lire', 'fr', 'hospitality', 'welcoming', 3, 'casual,open');

-- Category: environment | Mood: location_based
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Salutations des montagnes', 'fr', 'environment', 'location_based', 3, 'mountains,alpine'),
('Depuis le sommet', 'fr', 'environment', 'location_based', 3, 'summit,hiking'),
('Salutations ensoleillées du sud', 'fr', 'environment', 'location_based', 3, 'sun,vacation');

-- Category: humor | Mood: ironic
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Salutations caféinées', 'fr', 'humor', 'ironic', 3, 'coffee,humor'),
('Depuis le chaos', 'fr', 'humor', 'ironic', 2, 'chaos,office'),
('Un signe de tête numérique', 'fr', 'humor', 'ironic', 3, 'tech,remote');


-- ============================================================================
-- ADDITIONAL GERMAN (DE) CLOSINGS
-- ============================================================================

-- Category: general | Mood: neutral
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Liebe Grüsse', 'de', 'general', 'neutral', 4, 'warm,classic'),
('Herzliche Grüsse', 'de', 'general', 'neutral', 3, 'standard,polite'),
('Schönen Feierabend', 'de', 'general', 'neutral', 3, 'evening,office');

-- Category: conflict | Mood: annoyed
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Mit der mir noch verbleibenden Freundlichkeit', 'de', 'conflict', 'annoyed', 2, 'ironic,office'),
('Gesendet aus dem Augenrollen', 'de', 'conflict', 'annoyed', 2, 'humor,office');

-- Category: humor | Mood: ironic
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Aus dem Off', 'de', 'humor', 'ironic', 3, 'stage,casual'),
('Möge der Code / die Mail mit dir sein', 'de', 'humor', 'ironic', 3, 'geek,nerd');


-- ============================================================================
-- ADDITIONAL ENGLISH (EN) CLOSINGS
-- ============================================================================

-- Category: general | Mood: neutral
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Warmly', 'en', 'general', 'neutral', 4, 'warm,friendly'),
('Have a great weekend', 'en', 'general', 'neutral', 3, 'weekend,office');

-- Category: conflict | Mood: annoyed
INSERT INTO closings (phrase, language, category, mood, relationship_level, tags) VALUES 
('Regards.', 'en', 'conflict', 'annoyed', 2, 'dry,cold,dot'),
('Sent from my eye roll', 'en', 'conflict', 'annoyed', 2, 'sarcastic,office');