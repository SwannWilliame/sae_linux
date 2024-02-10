DROP DATABASE IF EXISTS sae_database;
CREATE DATABASE IF NOT EXISTS sae_database CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';

USE sae_database;

DROP TABLE IF EXISTS galaxie;
CREATE TABLE IF NOT EXISTS galaxie(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';

DROP TABLE IF EXISTS constellation;
CREATE TABLE IF NOT EXISTS constellation(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';


DROP TABLE IF EXISTS type_compression;
CREATE TABLE IF NOT EXISTS type_compression(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';


DROP TABLE IF EXISTS unite_res;
CREATE TABLE IF NOT EXISTS unite_res(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';


DROP TABLE IF EXISTS categorie;
CREATE TABLE IF NOT EXISTS categorie(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';


DROP TABLE IF EXISTS image;
CREATE TABLE IF NOT EXISTS image(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    description_image LONGTEXT,
    res_x INT NOT NULL,
    res_y INT NOT NULL,
    date_creation DATETIME(0),
    largeur INT,
    longueur INT,
    echantillon_par_pixel INT,
    image_data LONGBLOB NOT NULL,
    categorie_id BIGINT UNSIGNED NOT NULL,
    unite_res_id BIGINT UNSIGNED NOT NULL,
    type_compression_id BIGINT UNSIGNED,
    constellation_id BIGINT UNSIGNED,
    galaxie_id  BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(id)
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';

ALTER TABLE image ADD CONSTRAINT fk_image_categorie_id FOREIGN KEY(categorie_id) REFERENCES categorie (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_unite_res_id FOREIGN KEY(unite_res_id) REFERENCES unite_res (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_type_compression_id FOREIGN KEY(type_compression_id) REFERENCES type_compression (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_constellation_id FOREIGN KEY(constellation_id) REFERENCES constellation (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_galaxie_id FOREIGN KEY(galaxie_id) REFERENCES galaxie (id) ON DELETE CASCADE ON UPDATE CASCADE;