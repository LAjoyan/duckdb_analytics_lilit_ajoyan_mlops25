-- remove leading and trailing spaces

SELECT
    TRIM(sql_word) AS trimmed
FROM
    staging.set;

    SELECT 
TRIM(sql_word, ' '  ) AS trimmed,
trimmed[1] AS first_letter,
trimmed[-1] AS last_letter 
 FROM staging.set ;


SELECT
    UPPER(TRIM(sql_word, ' ')) AS trimmed
FROM
    staging.set;

SELECT description ,
REPLACE(description, '  ' , ' ') AS clean_desc
FROM staging.set

-- CONCAT 
SELECT
    CONCAT(UPPER(TRIM(sql_word, ' ')),  ' COMMAND') AS trimmed
FROM
    staging.set;
-- ||       --> BOTH WORK THE SAME 

SELECT
    UPPER(TRIM(sql_word, ' '))||  ' COMMAND') AS trimmed
FROM
    staging.set;

    SELECT
     UPPER(TRIM(sql_word)) AS trimmed,
     SUBSTRING(trimmed, 1,5) AS first_five
    FROM staging.set;

    SELECT
     UPPER(TRIM(sql_word)) AS trimmed,
     REVERsE(trimmed)
    FROM staging.set;

--finds if there is 'select' in the description column 
SELECT
description,
INSTR(description, 'select') AS select_found
    FROM staging.set;

--it will give boolean column if found or not
SELECT
description,
INSTR(description, 'select') AS select_found,
select_found != 0 AS tf
    FROM staging.set;

    