DESC food;

FROM
    food;

SELECT DISTINCT
    id
FROM
    food
ORDER BY
    id;

SELECT
    COUNT(DISTINCT id)
FROM
    food;

SELECT
    *
FROM
    food
WHERE
    week_id BETWEEN '2004-04' AND '2004-06'