USE sae_database;
INSERT INTO galaxie (id, nom) VALUES
(1, 'Voie lactee'),
(2, 'Cosmic Rose'),
(3, 'Galaxie du Moulinet');
INSERT INTO constellation (id, nom) VALUES
(1, 'Carène'),
(2, 'Andromède'),
(3, 'Gemaux'),
(4, 'Grande Ours'),
(5, 'Ursa Major'),
(6, 'Céphée'),
(7, 'Cygnus'),
(8, 'Orion'),
(9, 'Sagittaire'),
(10, 'Serpent');
INSERT INTO unite_res (id, nom) VALUES
(1, 'pouces'),
(2, 'Centimètre');
INSERT INTO type_compression VALUES
(1, 'Compression JPEG'),
(2, 'Non compressé');
INSERT INTO categorie VALUES
(1, 'Solar'),
(2, 'Others');