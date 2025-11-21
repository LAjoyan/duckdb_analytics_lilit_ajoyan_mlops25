SELECT
    REPLACE (sql_upper, 'ORDERBY', 'ORDER BY') AS updated_sql
FROM
    refined.new;

UPDATE refined."new"
SET
    sql_upper = REPLACE (sql_upper, 'ORDERBY', 'ORDER BY');