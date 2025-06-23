CREATE TABLE title_principals (
    tconst VARCHAR(12),
    ordering INTEGER,
    nconst VARCHAR(12),
    category VARCHAR(50),
    job VARCHAR(500),
    characters VARCHAR(500),
    PRIMARY KEY (tconst, ordering)
);

COPY title_principals
FROM
    PROGRAM 'zcat /import/title.principals.tsv.gz' WITH (
        FORMAT csv,
        DELIMITER E'\t',
        HEADER,
        NULL '\N',
        QUOTE E'\001'
    );