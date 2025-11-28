LOAD SQLITE;

CALL SQLITE_attach ('sqlite-sakila.db');

--a) Describe all tables.
DESC;

--b) Select all data on all tables.
FROM
    actor;

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

FROM
    customer_list;

FROM
    film;

FROM
    film_actor;

FROM
    film_category;

FROM
    film_list;

FROM
    film_text;

--empty
FROM
    inventory;

FROM
    language;

FROM
    payment;

FROM
    rental;

FROM
    sales_by_film_category;

FROM
    sales_by_store;

FROM
    staff;

FROM
    staff_list;

FROM
    store;

--c) Find out how many rows there are in each table.
--The questions here might come from a business stakeholder which is not familiar with the table structure. Hence it's your job to find out which table(s) to look at.
--d) Calculate descriptive statistics on film length.
SELECT
    MIN(length) AS min_len,
    ROUND(AVG(length)) AS avg_len,
    MEDIAN (length) AS mean_len,
    MAX(length) AS max_len
FROM
    film;

--e) What are the peak rental times?
SELECT
    MONTHNAME (rental_date) AS month,
    COUNT(*) AS rentals
FROM
    rental
GROUP BY
    month
ORDER BY
    rentals DESC;

SELECT
    DAYNAME (rental_date) AS day,
    COUNT(*) AS rentals
FROM
    rental
GROUP BY
    day
ORDER BY
    rentals DESC;

SELECT
    EXTRACT(
        HOUR
        FROM
            rental_date
    ) AS hour,
    COUNT(*) AS rentals
FROM
    rental
GROUP BY
    hour
ORDER BY
    rentals DESC;

--f) What is the distribution of film ratings?
SELECT
    COUNT(*) AS total_films,
    ratings
FROM
    film
GROUP BY
    ratings;

--g) Who are the top 10 customers by number of rentals?
SELECT 
    customer_id,
    SUM(amount):: INT AS total_paid
FROM
    payment 
GROUP BY customer_id
ORDER BY total_paid DESC;

-- h) Retrieve a list of all customers and what films they have rented.

SELECT 
cl.customer_id,
cl.name
f.film_id,
f.title
FROM film f 
JOIN customer_list cl ON ;


-- i) Make a more extensive EDA of your choice on the Sakila database.
--Retrieve a list of all films and the customers who rented them, including the rental date.
SELECT 
f.title,
CONCAT(c.first_name) || ' ' || c.last_name AS customer_full_name,
r.rental_date
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id;


--List all customers and the total amount they have spent on rentals.

SELECT 
  c.first_name || ' ' || c.last_name AS customer_full_name,
  SUM(p.amount)::INT AS total_amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_amount DESC;



--Find all customers who have rented the same film more than once.'''
SELECT 
  c.first_name || ' ' || c.last_name AS customer_full_name,
  f.title,
  COUNT(*) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY  c.first_name, c.last_name, f.title
HAVING COUNT(*) > 1
ORDER BY rental_count desc;


--Find all customers who rented the same film exactly 3 times. List the customer’s full name, the film title, and the number of times they rented it.
SELECT 
  c.first_name || ' ' || c.last_name AS customer_full_name,
  f.title,
  COUNT(*) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY c.customer_id, f.film_id, c.first_name, c.last_name, f.title
HAVING COUNT(*) = 3
ORDER BY customer_full_name;