DROP DATABASE IF EXISTS sae_database;
CREATE DATABASE sae_database;

\c sae_database;

DROP TABLE IF EXISTS galaxie;
CREATE TABLE IF NOT EXISTS galaxie(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) ;


DROP TABLE IF EXISTS systeme_solaire;
CREATE TABLE IF NOT EXISTS systeme_solaire(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    galaxie_id BIGINT CHECK (galaxie_id > 0),
    PRIMARY KEY(id)
) ;


DROP TABLE IF EXISTS type_compression;
CREATE TABLE IF NOT EXISTS type_compression(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) ;


DROP TABLE IF EXISTS unite_res;
CREATE TABLE IF NOT EXISTS unite_res(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) ;


DROP TABLE IF EXISTS categorie;
CREATE TABLE IF NOT EXISTS categorie(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) ;


DROP TABLE IF EXISTS image;
CREATE TABLE IF NOT EXISTS image(
    id SERIAL,
    nom VARCHAR(255) NOT NULL,
    description_image TEXT,
    res_x INT NOT NULL,
    res_y INT NOT NULL,
    date_creation TIMESTAMP(0),
    largeur INT,
    longueur INT,
    echantillon_par_pixel INT,
    image_data BYTEA NOT NULL,
    categorie_id BIGINT CHECK (categorie_id > 0) NOT NULL,
    unite_res_id BIGINT CHECK (unite_res_id > 0) NOT NULL,
    type_compression_id BIGINT CHECK (type_compression_id > 0),
    systeme_solaire_id BIGINT CHECK (systeme_solaire_id > 0),
    galaxie_id  BIGINT CHECK (galaxie_id > 0),
    PRIMARY KEY(id)
) ;


ALTER TABLE systeme_solaire ADD CONSTRAINT fk_systeme_solaire_galaxie_id FOREIGN KEY(galaxie_id) REFERENCES galaxie (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE image ADD CONSTRAINT fk_image_categorie_id FOREIGN KEY(categorie_id) REFERENCES categorie (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_unite_res_id FOREIGN KEY(unite_res_id) REFERENCES unite_res (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_type_compression_id FOREIGN KEY(type_compression_id) REFERENCES type_compression (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_systeme_solaire_id FOREIGN KEY(systeme_solaire_id) REFERENCES systeme_solaire (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE image ADD CONSTRAINT fk_image_galaxie_id FOREIGN KEY(galaxie_id) REFERENCES galaxie (id) ON DELETE CASCADE ON UPDATE CASCADE;