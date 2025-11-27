SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    fa.film_id
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id;

SELECT
    a.first_name,
    a.last_name,
    f.title,
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
    LEFT JOIN film f ON f.film_id = fa.film_id;

SELECT
    f.title,
    c.name AS category
FROM
    film_category fc
    INNER JOIN category c on fc.category_id = c.category_id
    INNER JOIN film f ON f.film_id = fc.film_id;

SELECT
    COUNT(*)
FROM
    category;

SELECT
    COUNT(*)
FROM
    film;

SELECT
    COUNT(*)
FROM
    film f
    INNER JOIN category c ON category_id;

SELECT
    f.title,
    c.name as category
FROM
    film f
    INNER JOIN category c ON category_id;