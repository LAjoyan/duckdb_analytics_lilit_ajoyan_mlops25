SELECT COUNT (*) 
FROM salaries;
SELECT COUNT (*) 
FROM salaries 
WHERE salary_in_usd < 50_000;

SELECT DISTINCT experience_level FROM salaries;
FROM salaries WHERE experience_level = 'EN';
FROM salaries WHERE experience_level IN('EN' , 'EX');

SELECT 
MAX(salary_in_usd) AS max_usd_en
FROM salaries

WHERE experience_level = 'EX';