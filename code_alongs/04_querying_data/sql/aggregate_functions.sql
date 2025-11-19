SELECT 
MIN(salary_in_usd) AS min_usd,
MAX(salary_in_usd) AS max_usd,
ROUND(AVG(salary_in_usd)) AS average_usd,
MEDIAN(salary_in_usd) AS median_usd 


FROM salary;