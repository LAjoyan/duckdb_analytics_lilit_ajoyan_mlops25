--a) Create a database file called hemnet.duckdb and ingest the data from the csv file into your database.
CREATE TABLE
    IF NOT EXISTS home As (
        SELECT
            *
        FROM
            read_csv_auto ('hemnet_data_clean.csv')
    );

-- b) Make a wildcard selection to checkout the data (use the asterisk symbol)
SELECT
    *
FROM
    home;

--c) Find out how many rows there are in the table
SELECT
    COUNT(*)
FROM
    home;

--d) Describe the table that you have ingested to see the columns and data types.
DESC home;

-- e) Find out the 5 most expensive homes sold.
FROM
    home
ORDER BY
    final_price DESC
LIMIT
    5;

-- f) Find out the 5 cheapest homes sold.
FROM
    home
ORDER BY
    final_price
LIMIT
    5;

-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold.
SELECT
    MIN(final_price) AS min_fin_price,
    AVG(final_price) AS avg_fin_price,
    MEDIAN (final_price) AS med_fin_price,
    MAX(final_price) AS max_fin_price
FROM
    home;

--h) Find out statistics on minimum, mean, median and maximum prices of price per area.
SELECT
    MIN(price_per_area) AS min_price_area,
    ROUND(AVG(price_per_area)) AS avg_price_area,
    MEDIAN (price_per_area) AS med_price_area,
    MAX(price_per_area) AS max_price_area
FROM
    home;

--i) How many unique communes are represented in the dataset.
SELECT DISTINCT
    commune
FROM
    home
ORDER BY
    commune;

--j) How many percentage of homes cost more than 10 million?
FROM home 
WHERE final_price > 10_000_000
ORDER BY final_price DESC;
--k) Feel free to explore anything else you find interesting in this dataset.
FROM home 
WHERE commune LIKE 'Ursvik%';