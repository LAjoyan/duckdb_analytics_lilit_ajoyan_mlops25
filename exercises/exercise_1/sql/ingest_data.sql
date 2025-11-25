CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.sal AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/salaries.csv')
    );

--a) Transform employment type column based on this table
SELECT
    CASE = employment_type
        WHEN 'CT' THEN 'Contract'
        WHEN 'FL' THEN 'Freelance'
        WHEN 'PT' THEN 'Part time'
        WHEN 'FT' THEN 'Full time'
    END
FROM
    staging.sal;

UPDATE staging.sal
SET
    employment_type = CASE employment_type
        WHEN 'CT' THEN 'Contract'
        WHEN 'FL' THEN 'Freelance'
        WHEN 'PT' THEN 'Part time'
        WHEN 'FT' THEN 'Full time'
    END;

--b) Do similar for company size, but you have to figure out what the abbreviations could stand for.
SELECT
    CASE company_size
        WHEN 'S' THEN 'Small'
        WHEN 'M' THEN 'Medium'
        WHEN 'L' THEN 'Large'
    END
FROM
    staging.sal;

UPDATE staging.sal
SET
    company_size = CASE company_size
        WHEN 'S' THEN 'Small'
        WHEN 'M' THEN 'Medium'
        WHEN 'L' THEN 'Large'
    END;

--c) Make a salary column with Swedish currency for yearly salary.

SELECT
Round(9.54*salary_in_usd) AS salary_in_sek
FROM staging.sal;

-- d) Make a salary column with Swedish currency for monthly salary.

SELECT
Round(9.54*salary_in_usd/12) AS salary_sek_month
FROM staging.sal;

 --e) Make a salary_level column with the following categories: low, medium, high, insanely_high. Decide your thresholds for each category. Make it base on the monthly salary in SEK.



SELECT

MIN(Round(9.54*salary_in_usd/12) )AS salary_sek_month_min
MEDIAN(Round(9.54*salary_in_usd/12)) AS salary_sek_month_mean
MAX(Round(9.54*salary_in_usd/12)) AS salary_sek_month_max
FROM staging.sal
--- THE ANSWER
SELECT
Round(9.54*salary_in_usd/12) AS salary_sek_month,
CASE 
WHEN salary_sek_month < 25_000 THEN 'Low'
WHEN salary_sek_month < 80_000 THEN 'Medium'
WHEN salary_sek_month < 350_000  THEN 'High'
ELSE  'Insanely high'
END AS salary_level
FROM staging.sal
ORDER BY  salary_sek_month;

--UPDATE 
UPDATE staging.sal
 SET  salary_level =
CASE 
WHEN salary_monthly_sek < 25_000 THEN 'Low'
WHEN salary_monthly_sek < 80_000 THEN 'Medium'
WHEN salary_monthly_sek < 350_000  THEN 'High'
ELSE  'Insanely high'
END ;


--extra
SELECT 
CASE experience_level
WHEN 'EN' THEN 'Entry level'
WHEN 'EX' THEN 'Expert level'
WHEN 'SE' THEN 'Senior level'
WHEN 'MI' THEN 'Mid level'
END 
FROM staging.sal;


--f) Choose the following columns to include in your table: experience_level, employment_type, job_title, salary_annual_sek, salary_monthly_sek, remote_ratio, company_size, salary_level

CREATE SCHEMA IF NOT EXISTS refined;
CREATE TABLE IF NOT EXISTS refined.sal AS (
    SELECT
    experience_level , employment_type, job_title , salary_annual_sek, salary_monthly_sek , remote_ratio, company_size , salary_level
FROM staging.sal);