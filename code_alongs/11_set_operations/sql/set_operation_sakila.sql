--find overlapping names 
SELECT
    c.first_name,
    c.last_name
FROM
    customer c
INTERSECT
SELECT
    a.first_name,
    a.last_name
FROM
    actor a;

SELECT
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'J%'
    AND c.last_name LIKE 'D%'
INTERSECT
SELECT
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'J%'
    AND a.last_name LIKE 'D%';

SELECT
    'Customer' AS TYPE,
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'J%'
    AND c.last_name LIKE 'D%'
UNION
SELECT
    'Actor' AS TYPE,
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'J%'
    AND a.last_name LIKE 'D%'
ORDER BY
    TYPE,
    first_name;

    