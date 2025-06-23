-- Création de la table
CREATE TABLE name_basics (
  nconst VARCHAR(12) PRIMARY KEY,
  primary_name VARCHAR(255),
  birth_year INTEGER,
  death_year INTEGER,
  primary_profession VARCHAR(255),
  known_for_titles VARCHAR(255)
);

-- Import
COPY name_basics FROM PROGRAM 'zcat /import/name.basics.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- TEST
SELECT COUNT(*) AS total_personnes FROM name_basics;

-- TEST
SELECT primary_name, known_for_titles
FROM name_basics
WHERE known_for_titles LIKE '%,%'
LIMIT 5;
