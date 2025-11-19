DESC;

DESC salary;

FROM
    salary;

FROM
    salary
LIMIT
    5 DESC;

FROM
    salary
OFFSET
    5;

SELECT
    work_year,
    job_title,
    salary_in_usd,
    company_location
FROM
    salary;

SELECT                                                 
    * EXCLUDE 
    
    (job_title,
    salary_in_usd,
    company_location)
FROM
    salary;

SELECT DISTINCt employment_type FROM salary;