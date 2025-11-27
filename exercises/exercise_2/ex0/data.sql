CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.term AS (
        SELECT
            *
        FROM
            read_csv_auto ('sql_terms.csv')
    )
SELECT
    UPPER(TRIM(REPLACE (sql_word, 'orderBY', 'ORDER BY'))) AS sql_word
FROM
    staging.term;

SELECT
    TRIM(REGEXP_REPLACE (description, ' +', ' ', 'g')) AS description
FROM
    staging.term
SELECT
    UPPER(
        substring(trim(regexp_replace (example, ' +', ' ')), 1, 1)
    ) || lower(
        substring(trim(regexp_replace (example, ' +', ' ', 'g')), 2)
    ) AS example,
FROM
    staging.term CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE
    IF NOT EXISTS refined.term AS
SELECT
    UPPER(TRIM(REPLACE (sql_word, 'orderBY', 'ORDER BY'))) AS sql_word,
    TRIM(REGEXP_REPLACE (description, ' +', ' ', 'g')) AS description,
    UPPER(
        substring(trim(regexp_replace (example, ' +', ' ')), 1, 1)
    ) || lower(
        substring(trim(regexp_replace (example, ' +', ' ', 'g')), 2)
    ) AS example
FROM
    staging.term;