SELECT DISTINCT
    COUNT(*)
FROM
    salaries
WHERE
    company_size in ('M', 'S');

SELECT DISTINCT
    COUNT(*)
FROM
    salaries
WHERE
    company_size NOT in ('M', 'S');

SELECT
    COUNT(*) AS total_jobs,
    COUNT(*) FILTER (remote_ratio = 100) AS remote_jobs,
    ROUND(remote_jobs / total_jobs * 100) AS per_remote_jobs
FROM
    salaries;