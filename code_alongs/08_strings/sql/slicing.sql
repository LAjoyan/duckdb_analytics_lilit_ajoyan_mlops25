SELECT
     UPPER(TRIM(sql_word)) AS trimmed,
     trimmed[:5] AS first
FROM staging.set;

    SELECT 
         sql_word,
    sql_word[0],
    sql_word[1],
    sql_word[-1]
    FROM staging.set;
    
    SELECT
        sql_word,
    sql_word[:3],
    sql_word[2:5],
    
     FROM staging.set;

