-- Création de la table
CREATE TABLE title_crew (
    tconst VARCHAR(20) PRIMARY KEY,
    directors TEXT,
    writers TEXT
);
-- Import
COPY title_crew
FROM PROGRAM 'zcat /import/title.crew.tsv.gz'
WITH (
    FORMAT csv,
    DELIMITER E'\t',
    HEADER,
    NULL '\N',
    QUOTE E'\001'
);

--Test 
SELECT COUNT(*) FROM title_crew;
--
SELECT COUNT(*) AS avec_realisateurs 
FROM title_crew 
WHERE directors IS NOT NULL;

--
SELECT tconst, directors
FROM title_crew
WHERE directors LIKE '%,%'
LIMIT 10;