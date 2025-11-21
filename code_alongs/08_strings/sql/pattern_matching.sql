SELECT
    example,
    lower(trim(example)) AS cleanesd_example
FROM
    staging.set;

SELECT
    example,
    lower(trim(example)) AS cleanesd_example
FROM
    staging.set
WHERE
    cleanesd_example LIKE 'select%';

SELECT
    example,
    trim(example) AS cleanesd_example
FROM
    staging.set
WHERE
    cleanesd_example ILIKE 'select%';

SELECT
    example,
    trim(example) AS cleanesd_example
FROM
    staging.set
WHERE
    cleanesd_example LIKE 'S_LECT%';

-- filter rows starting with c 
SELECT
    lower(trim(description)) AS cleaned_desc
FROM
    staging.set
WHERE
    regexp_matches (cleaned_desc, '^c');

-- filter rows starting with c AND s    ^
SELECT
    trim(description) AS cleaned_desc
FROM
    staging.set
WHERE
    regexp_matches (cleaned_desc, '^[SC]');

--filter rows ending with f AND e  $
SELECT
    lower(trim(description)) AS cleaned_desc
FROM
    staging.set
WHERE
    regexp_matches (cleaned_desc, '[fe]$');

SELECT
    lower(description) AS cleaned_desc
FROM
    staging.set
WHERE
    regexp_matches (cleaned_desc, 'select\b');

--begins from a to f
-- with , a and f
SELECT
    lower(trim(description)) AS cleaned_desc
FROM
    staging.set
WHERE
    regexp_matches (cleaned_desc, '^[a-f]');

--ends from 
SELECT
    lower(trim(description)) AS cleaned_desc
FROM
    staging.set
WHERE
    regexp_matches (cleaned_desc, '[e,s]$');

--not begin from   a to f
SELECT
    lower(trim(description)) AS cleaned_desc
FROM
    staging.set
WHERE
    regexp_matches (cleaned_desc, '^[^a-f]');

SELECT
    description,
    regexp_replace (description, ' +', ' ', 'g') AS clen_des
FROM
    staging.set;

--trailing and leading  too
SELECT
    description,
    regexp_replace (trim(description), ' +', ' ', 'g') AS clen_des
FROM
    staging.set;