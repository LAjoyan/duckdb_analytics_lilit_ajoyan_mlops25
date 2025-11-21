CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE
    IF NOT EXISTS refined.new AS (
        SELECT
            UPPER(TRIM(sql_word)) AS sql_upper,
            regexp_replace (trim(description), ' +', ' ', 'g') AS descriptionn
        FROM
            staging.set
    );