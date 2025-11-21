SELECT
    id AS food,
    week_id AS week,
    value AS search,
    SUBSTRING(week_id, 1, 4) AS year,
    SUBSTRING(week, 6) AS week_n
FROM
    food;

CREATE TABLE
    IF NOT EXISTS clean AS (
        SELECT
            id AS food,
            week_id AS week,
            value AS search,
            SUBSTRING(week_id, 1, 4) AS year,
            SUBSTRING(week, 6) AS week_n
        FROM
            food
    );