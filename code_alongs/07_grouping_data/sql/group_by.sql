SELECT
    food,
    SUM(search) AS total_seraches
FROM
    clean
GROUP BY
    food
ORDER BY
    food
    ;


SELECT
    year,
    SUM(search) AS total_seraches
FROM
    clean
GROUP BY
    year
ORDER BY
    year
    DESC
    ;

    SELECT
    year,
    SUM(search) AS total_seraches
FROM
    clean
GROUP BY
    year
    HAVING total_seraches > 300_000
ORDER BY
    year DESC;

    SELECT
    year,
    food,
    SUM(search) AS total_seraches
FROM
    clean
GROUP BY
    year 
    HAVING total_seraches > 300_000
ORDER BY
    year
    food ;

        SELECT
    year,
    food,
    SUM(search) AS total_seraches
FROM
    clean
GROUP BY
    year,food 
    HAVING food IN ('sushi','pizza')
ORDER BY
   total_seraches DESC ;