-- Création de la table 
CREATE TABLE title_ratings (
  tconst VARCHAR(12) PRIMARY KEY,
  average_rating NUMERIC(3,1),
  num_votes INTEGER
);

-- Import
COPY title_ratings FROM PROGRAM 'zcat /import/title.ratings.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- TEST
SELECT COUNT(*) AS total_titres_notes FROM title_ratings;

-- TEST
SELECT * FROM title_ratings
WHERE num_votes >= 1000
ORDER BY average_rating DESC
LIMIT 5;
