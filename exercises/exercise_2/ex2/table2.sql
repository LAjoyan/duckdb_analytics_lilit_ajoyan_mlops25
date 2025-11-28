LOAD sqlite;

CALL SQLite_attach ('sqlite-sakila.db');

--a) Retrieve a list of all customers and actors which last name starts with G.
SELECT
    'customer' AS TYPE,
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.last_name LIKE 'G%'
UNION
SELECT
    'actor' AS TYPE,
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.last_name LIKE 'G%'
    --b) How many customers and actors starts have the the letters 'ann' in there first names?
SELECT
    'customer' AS TYPE,
    COUNT(*) AS total
FROM
    customer c
WHERE
    c.first_name LIKE 'ANN%'
UNION
SELECT
    'actor' AS TYPE,
    COUNT(*) AS total
FROM
    actor a
WHERE
    a.first_name LIKE 'ANN%'
    --OR ANOTHER ALTERNATIVE
SELECT
    'customer' AS TYPE,
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'ANN%'
UNION
SELECT
    'actor' AS TYPE,
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'ANN%'
    --c) In which cities and countries do the customers live in?
SELECT
    cu.first_name || ' ' || cu.last_name AS customer_full_name,
    c.city,
    cty.country
FROM
    customer cu
    JOIN address a ON cu.address_id = a.address_id
    JOIN city c ON a.city_id = c.city_id
    JOIN country cty ON c.country_id = cty.country_id
ORDER BY
    country;

--OR
SELECT DISTINCT
    c.city,
    cty.country
FROM
    customer cu
    JOIN address a ON cu.address_id = a.address_id
    JOIN city c ON a.city_id = c.city_id
    JOIN country cty ON c.country_id = cty.country_id
ORDER BY
    cty.country;

--d) In which cities and countries do the customers with initials JD live in?
SELECT
    cu.first_name || ' ' || cu.last_name AS customer_full_name,
    c.city,
    cty.country
FROM
    customer cu
    JOIN address a ON cu.address_id = a.address_id
    JOIN city c ON a.city_id = c.city_id
    JOIN country cty ON c.country_id = cty.country_id
WHERE
    cu.first_name LIKE 'J%'
    AND cu.last_name LIKE 'D%'
ORDER BY
    country;

--OR
SELECT DISTINCT
    c.city,
    cty.country
FROM
    customer cu
    JOIN address a ON cu.address_id = a.address_id
    JOIN city c ON a.city_id = c.city_id
    JOIN country cty ON c.country_id = cty.country_id
WHERE
    cu.first_name LIKE 'J%'
    AND cu.last_name LIKE 'D%'
ORDER BY
    cty.country;

--e) Retrieve a list of all customers and what films they have rented.
SELECT
    c.first_name || ' ' || c.last_name AS customer_full_name,
    f.title
FROM
    customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
GROUP BY
    c.first_name,
    c.last_name,
    f.title,
    c.customer_id,
    f.film_id
ORDER BY
    f.title;

--f) What else cool information can you find out with this database using what you know about SQL.
SELECT
    c.name,
    COUNT(f.film_id) AS total_films
FROM
    category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
GROUP BY
    c.name
ORDER BY
    total_films desc;

--categories and films 
SELECT
    c.name,
    f.title
FROM
    category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
ORDER BY
    c.name,
    f.title;