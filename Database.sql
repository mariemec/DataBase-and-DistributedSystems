/*
CREATE SCHEMA
*/
CREATE SCHEMA IF NOT EXISTS APP1;
SET search_path = APP1;

/*
TABLE DROP
*/
DROP TABLE IF EXISTS  campus CASCADE;
DROP TABLE IF EXISTS  categorie CASCADE;
DROP TABLE IF EXISTS  departement CASCADE;
DROP TABLE IF EXISTS  faculte CASCADE;
DROP TABLE IF EXISTS  local CASCADE;
DROP TABLE IF EXISTS  logs CASCADE;
DROP TABLE IF EXISTS  membre CASCADE;
DROP TABLE IF EXISTS  pavillon CASCADE;
DROP TABLE IF EXISTS  privilege CASCADE;
DROP TABLE IF EXISTS  reservation CASCADE;
DROP TABLE IF EXISTS  ressource CASCADE;
DROP TABLE IF EXISTS  ressource_local CASCADE;
DROP TABLE IF EXISTS  statut CASCADE;
DROP TABLE IF EXISTS  statut_membre CASCADE;

/*
CREATE TABLE
*/
CREATE TABLE IF NOT EXISTS campus
(
  id_campus SERIAL NOT NULL,
  nom_campus VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_campus)
);

CREATE TABLE IF NOT EXISTS pavillon
(
  id_pavillon VARCHAR(3) NOT NULL,
  nom_pavillon VARCHAR(50) NOT NULL,
  id_campus INT NOT NULL,
  PRIMARY KEY (id_pavillon),
  FOREIGN KEY (id_campus) REFERENCES campus(id_campus)
);

CREATE TABLE IF NOT EXISTS categorie
(
  id_categorie INT NOT NULL,
  nom_categorie VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_categorie)
);

CREATE TABLE IF NOT EXISTS ressource
(
  id_ressource INT NOT NULL,
  nom_ressource VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_ressource)
);

CREATE TABLE IF NOT EXISTS faculte
(
  id_faculte VARCHAR(3) NOT NULL,
  nom_faculte VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_faculte)
);

CREATE TABLE IF NOT EXISTS departement
(
  id_departement SERIAL NOT NULL,
  nom_departement VARCHAR(50) NOT NULL,
  id_faculte VARCHAR(3),
  PRIMARY KEY (id_departement),
  FOREIGN KEY (id_faculte) REFERENCES faculte(id_faculte)
);

CREATE TABLE IF NOT EXISTS membre
(
  cip VARCHAR(8) NOT NULL,
  prenom_membre VARCHAR(30) NOT NULL,
  nom_membre VARCHAR(30) NOT NULL,
  courriel_membre VARCHAR(30) NOT NULL,
  id_departement INT,
  PRIMARY KEY (cip),
  FOREIGN KEY (id_departement) REFERENCES departement(id_departement)
);

CREATE TABLE IF NOT EXISTS logs
(
  id_logs SERIAL NOT NULL,
  description_logs VARCHAR NOT NULL,
  "current_timestamp" TIMESTAMP NOT NULL,
  cip VARCHAR(8) NOT NULL,
  PRIMARY KEY (id_logs),
  FOREIGN KEY (cip) REFERENCES membre(cip)
);

CREATE TABLE IF NOT EXISTS privilege
(
  id_privilege SERIAL NOT NULL,
  nom_privilege VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_privilege)
);

CREATE TABLE IF NOT EXISTS local
(
  id_local SERIAL NOT NULL,
  no_local INT NOT NULL,
  capacite_local INT NOT NULL,
  notes_local VARCHAR NOT NULL,
  cubicule VARCHAR(8),
  id_pavillon VARCHAR(3) NOT NULL,
  id_categorie INT NOT NULL,
  --UNIQUE(no_local, id_pavillon),
  PRIMARY KEY (id_local),
  FOREIGN KEY (id_pavillon) REFERENCES pavillon(id_pavillon),
  FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);

CREATE TABLE IF NOT EXISTS reservation
(
  id_reservation SERIAL NOT NULL,
  debut_reservation TIMESTAMP NOT NULL,
  fin_reservation TIMESTAMP NOT NULL,
  cip VARCHAR(8) NOT NULL,
  id_local INT NOT NULL,
  PRIMARY KEY (id_reservation),
  FOREIGN KEY (cip) REFERENCES membre(cip),
  FOREIGN KEY (id_local) REFERENCES local(id_local)
);

CREATE TABLE IF NOT EXISTS statut
(
  id_statut SERIAL NOT NULL,
  nom_statut VARCHAR(30) NOT NULL,
  id_privilege INT,
  PRIMARY KEY (id_statut),
  FOREIGN KEY (id_privilege) REFERENCES privilege(id_privilege)
);

CREATE TABLE IF NOT EXISTS statut_membre
(
  id_statut INT NOT NULL,
  cip VARCHAR(8) NOT NULL,
  PRIMARY KEY (id_statut, cip),
  FOREIGN KEY (id_statut) REFERENCES statut(id_statut),
  FOREIGN KEY (cip) REFERENCES membre(cip)
);

CREATE TABLE IF NOT EXISTS ressource_local
(
  id_local INT NOT NULL,
  id_ressource INT NOT NULL,
  PRIMARY KEY (id_local, id_ressource),
  FOREIGN KEY (id_local) REFERENCES local(id_local),
  FOREIGN KEY (id_ressource) REFERENCES ressource(id_ressource)
);