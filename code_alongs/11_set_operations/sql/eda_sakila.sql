FROM
    actor;

FROM
    film;

FROM
    address;

FROM
    category;

FROM
    city;

FROM
    country;

FROM
    customer;

SELECT
    COUNT(*) AS number_movies,
    COUNT(DISTINCT title) AS unique_titles
FROM
    film;

SELECT
    (DINSTINT rating) AS unique_raiting
from
    main.film;

DESC
FROM
    film_actor;

SELECT
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'D%' AND
    c.last_name LIKE 'T%';