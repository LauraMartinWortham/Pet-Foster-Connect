BEGIN;

DROP TABLE IF EXISTS "media","animal", "association", "espece", "famille", "tag", "utilisateur", "animal_tag", "demande";
DROP TYPE IF EXISTS sexe, statut, statut_demande;

CREATE TYPE sexe AS ENUM ('Mâle', 'Femelle', 'Inconnu');

CREATE TYPE statut AS ENUM ('En refuge', 'Accueilli', 'Adopté');

CREATE TYPE statut_demande AS ENUM ('En attente', 'Validée', 'Refusée');

CREATE TABLE "utilisateur" (
  "id"               int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "email"            TEXT UNIQUE NOT NULL,
  "mot_de_passe"     TEXT NOT NULL
);

CREATE TABLE "association" (
  "id"               int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "nom"              TEXT NOT NULL,
  "responsable"      TEXT NOT NULL,
  "rue"              TEXT NOT NULL,
  "commune"          TEXT NOT NULL,
  "code_postal"      TEXT NOT NULL,
  "pays"             TEXT NOT NULL,
  "siret"            TEXT NOT NULL,
  "telephone"        TEXT NOT NULL,
  "site"             TEXT,
  "description"      TEXT,
  "utilisateur_id"   INT UNIQUE NOT NULL REFERENCES "utilisateur"("id")
);

CREATE TABLE "famille" (
  "id"               int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "prenom"           TEXT,
  "nom"              TEXT NOT NULL,
  "telephone"        TEXT NOT NULL,
  "rue"              TEXT NOT NULL,
  "commune"          TEXT NOT NULL,
  "code_postal"      TEXT NOT NULL,
  "pays"             TEXT NOT NULL,
  "hebergement"      TEXT NOT NULL,
  "terrain"          TEXT,
  "utilisateur_id"   int UNIQUE NOT NULL REFERENCES "utilisateur"("id")
);

CREATE TABLE "espece" (
  "id"               int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "nom"              TEXT NOT NULL
);

CREATE TABLE "animal" (
  "id"               int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "nom"              TEXT NOT NULL,
  "race"             TEXT,
  "couleur"          TEXT NOT NULL,
  "age"              INT  NOT NULL,
  "sexe"             sexe NOT NULL,
  "description"      TEXT NOT NULL,
  "statut"           statut NOT NULL,
  "association_id"   INT NOT NULL REFERENCES "association"("id"),
  "famille_id"       INT REFERENCES "famille"("id"),
  "espece_id"        INT NOT NULL REFERENCES "espece"("id")
);

CREATE TABLE "media" (
  "id"              int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "url"             TEXT NOT NULL,
  "ordre"           INT,
  "animal_id"       INT REFERENCES "animal"("id"),
  "association_id"  INT REFERENCES "association"("id")
);

CREATE TABLE "tag" (
  "id"              int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "nom"             TEXT NOT NULL,
  "description"     TEXT NOT NULL
);

CREATE TABLE "animal_tag" (
  "id"              int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "animal_id"       INT NOT NULL REFERENCES "animal"("id"),
  "tag_id"          INT NOT NULL REFERENCES "tag"("id")
);

CREATE TABLE "demande" (
  "id"              int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "famille_id"      INT NOT NULL REFERENCES "famille"("id"),
  "animal_id"       INT NOT NULL REFERENCES "animal"("id"),
  "statut_demande"  statut_demande NOT NULL,
  "date_debut"      DATE NOT NULL,
  "date_fin"        DATE NOT NULL

);

COMMIT;