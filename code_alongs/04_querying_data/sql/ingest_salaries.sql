CREATE TABLE
    IF NOT EXISTS salary AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/salaries.csv')
    );