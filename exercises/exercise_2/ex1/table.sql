LOAD SQLITE;

CALL SQLITE_attach ('sqlite-sakila.db');

--a) Describe all tables.
DESC;

--b) Select all data on all tables.
FROM actor;
FROM address;
FROM category;
FROM city;
FROM country;
FROM customer;
FROM customer_list;
FROM film;
FROM film_actor;
FROM film_category;
FROM film_list;
FROM film_text;--empty
FROM inventory;
FROM language;
FROM payment;
FROM rental;
FROM sales_by_film_category;
FROM sales_by_store;
FROM staff;
FROM staff_list;
FROM store;

--c) Find out how many rows there are in each table.

--The questions here might come from a business stakeholder which is not familiar with the table structure. Hence it's your job to find out which table(s) to look at.

 --d) Calculate descriptive statistics on film length.
 SELECT 
 MIN(length) AS min_len,
 ROUND(AVG(length))AS avg_len,
 MEDIAN(length)AS mean_len,
 MAX(length)AS max_len
 FROM film;


--e) What are the peak rental times?

--f) What is the distribution of film ratings?

--g) Who are the top 10 customers by number of rentals?

-- h) Retrieve a list of all customers and what films they have rented.

-- i) Make a more extensive EDA of your choice on the Sakila database.