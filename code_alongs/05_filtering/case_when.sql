SELECT
    CASE
        WHEN experience_level = 'EN' THEN 'entry level'
        WHEN experience_level = 'EX' THEN 'expert level'
        WHEN experience_level = 'MI' THEN 'mid level'
        WHEN experience_level = 'SE' THEN 'senior level'
    END AS experience_level,
    * exclude experience_level
FROM
    salaries;

UPDATE salaries
SET
    experience_level = CASE
        WHEN experience_level = 'EN' THEN 'entry level'
        WHEN experience_level = 'EX' THEN 'expert level'
        WHEN experience_level = 'MI' THEN 'mid level'
        WHEN experience_level = 'SE' THEN 'senior level'
    END;