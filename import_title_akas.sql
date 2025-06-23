-- Création de la table
CREATE TABLE title_akas (
    titleId VARCHAR(20),
    ordering INTEGER,
    title TEXT,
    region VARCHAR(10),
    language VARCHAR(20),
    types TEXT,
    attributes TEXT,
    isOriginalTitle BOOLEAN
);
-- Import
COPY title_akas 
FROM PROGRAM 'zcat /import/title.akas.tsv.gz'
WITH (
    FORMAT csv,
    DELIMITER E'\t',
    HEADER,
    NULL '\N',
    QUOTE E'\001'
);

--Test
SELECT COUNT(*) FROM title_akas;
--Test
SELECT COUNT(*) AS originaux 
FROM title_akas
WHERE isOriginalTitle = true;
--Test
SELECT region, COUNT(*) AS nb_titres 
FROM title_akas 
GROUP BY region 
ORDER BY nb_titres DESC 
LIMIT 10;
