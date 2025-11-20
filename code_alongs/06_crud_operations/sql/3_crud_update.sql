FROM
    database_shema.duckdb
WHERE
    id IN (3, 5, 7);

UPDATE database_shema.duckdb
SET
    learnt = TRUE
WHERE
    id IN (3, 5, 7);