CREATE TABLE title_episode (
    tconst VARCHAR(12),
    parentTconst VARCHAR(12),
    seasonNumber INTEGER,
    episodeNumber INTEGER,
    PRIMARY KEY (tconst)
);

COPY title_episode
FROM
    PROGRAM 'zcat /import/title.episode.tsv.gz' WITH (
        FORMAT csv,
        DELIMITER E'\t',
        HEADER,
        NULL '\N',
        QUOTE E'\001'
    );