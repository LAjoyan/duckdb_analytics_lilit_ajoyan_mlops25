SELECT DISTINCT
    salary_currency
FROM
    salary
ORDER BY
    salary_currency;

SELECT
    COUNT(DISTINCT salary_currency) AS salary_count
FROM
    salary;

SELECT
    ROW_NUMBER() OVER () AS id,
    *
FROM
    salary;