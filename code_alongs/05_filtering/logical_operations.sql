SELECT
    job_title,
    experience_level,
  
  ROUND((9.44*salary_in_usd)) AS salary_sek,
  ROUND((9.44*salary_in_usd)/12) AS salary_sek_month
  FROM
    salaries
  WHERE experience_level = 'senior level' 
  ORDER BY salary_sek_month ;


SELECT
    job_title,
    experience_level,
    ROUND((9.44*salary_in_usd)/12) AS salary_sek_month
FROM
    salaries;
WHERE salary_sek_month BETWEEN 200_000 AND 300_000
ORDER BY salary_in_usd ;

SELECT
COUNT (*) 
FROM salaries
WHERE NOT
experience_level = 'entry level' or experience_level = 'expert level';