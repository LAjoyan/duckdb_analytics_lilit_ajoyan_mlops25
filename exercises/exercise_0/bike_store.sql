--a) Create a database file called bike_join.duckdb and ingest the data from the csv file into your database.
CREATE TABLE
    IF NOT EXISTS bike AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_joined_table.csv')
    );

-- b) The column order_id is the unique identifier of an order. How many unique orders are in the data?
SELECT
    count(DISTINCT order_id) AS unique_orders
FROM
    bike;

--c) A unique order can involve multiple products. The column product_id is the unique identifier of a product. How many unique products are in the data?
--shows the row numner 
SELECT
    COUNT(DISTINCT product_id)
FROM
    bike;

--shows the unique ids
SELECT DISTINCT
    product_id
FROM
    bike;

--d) For the product with product_name Surly Straggler - 2016, how many customers have ordered it? How much is the total sales value coming from these orders?
SELECT
    COUNT(DISTINCT customer_id) AS customers_who_ordered,
    SUM(list_price) AS total_price
FROM
    bike
WHERE
    product_name = 'Surly Straggler - 2016';

--e) How many customers are coming from these cities: San Angelo, Orchard Park and Merrick?
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM
    bike
WHERE
    customer_city IN ('San Angelo', 'Orchard Park', 'Merrick');

--f) Create a new column manager_name using the information below:
--manager_id	manager_name
--1	Amy Andersson
--2	Bill Berg
--5	Cathy Larsson
--7	Davis Lam
ALTER TABLE bike
ADD COLUMN manager_name VARCHAR(50);

UPDATE bike
SET
    manager_name = CASE manager_id
        WHEN 1 THEN 'Amy Andersson'
        WHEN 2 THEN 'Bill Berg'
        WHEN 5 THEN 'Cathy Larsson'
        WHEN 7 THEN 'Davis Lam'
    END;