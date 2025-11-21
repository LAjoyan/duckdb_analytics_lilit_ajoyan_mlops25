CREATE TABLE
    IF NOT EXISTS course (content VARCHAR, week INT, content_type VARCHAR);

INSERT INTO
    course (content, week, content_type)
VALUES
    ('00_intro', 46, 'lecture'),
    ('02_setup_duckdb', 46, 'lecture'),
    ('03_sql_introduction', 46, 'lecture'),
    ('04_querying_data', 46, 'lecture'),
    ('exercise_0', 46, 'exercise'),
    ('05_filtering', 47, 'lecture'),
    ('06_crud_operations', 47, 'lecture'),
    ('07_grouping_data', 47, 'lecture'),
    ('08_strings', 47, 'lecture'),
    ('exercise_1', 47, 'exercise'),
    ('09_temporal_data', 48, 'lecture'),
    ('10_enforce_constraints', 48, 'lecture'),
    ('11_set_operations', 48, 'lecture'),
    ('12_joins', 48, 'lecture'),
    ('exercise_2', 48, 'exercise'),
    ('13_subquery', 49, 'lecture'),
    ('14_views', 49, 'lecture'),
    ('15_cte', 49, 'lecture'),
    ('16_window_functions', 49, 'lecture'),
    ('exercise_3', 49, 'exercise'),
    ('17_python_connect_duckdb', 50, 'lecture'),
    ('18_pandas_duckdb', 50, 'lecture'),
    ('19_dlt', 50, 'lecture'),
    ('20_evidence_dashboard', 50, 'lecture'),
    ('21_macros', 51, 'lecture'),
    ('22_sql_injection', 51, 'lecture'),
    ('tenta', 51, 'exam');

INSERT INTO
    course (content, week, content_type)
VALUES
    ('01_course_structure', 46, 'lecture');

--a) Select all the exercises in this course
FROM
    course
WHERE
    content_type = 'exercise';

--b) Select all the lectures in this course
FROM
    course
WHERE
    content_type = 'lecture';

--c) Select all records for week 48
FROM
    course
WHERE
    week = 48;

--d) Select all records for week 47-49
FROM
    course
WHERE
    week BETWEEN 47 AND 49;

--e) How many lectures are in the table?
SELECT
    COUNT(*) content_type
FROM
    course
WHERE
    content_type = 'lecture';

--f) How many other content are there?
SELECT
    COUNT(*) content_type
FROM
    course
WHERE
    content_type != 'lecture';

--g) Which are the unique content types in this table?
SELECT DISTINCT
    content_type
FROM
    course;

--h) Delete the row with content 02_setup_duckdb and add it again.
SELECT
    *
FROM
    course
WHERE
    content = '02_setup_duckdb';

DELETE FROM course
WHERE
    content = '02_setup_duckdb';

INSERT INTO
    course (content, week, content_type)
VALUES
    ('02_setup_duckdb', 46, 'lecture');

--i) You see that 02_setup_duckdb comes in the end of your table, even though the week is 46. Now make a query where you sort the weeks in ascending order.
FROM
    course
ORDER BY
    week,
    content;

--j) Now you can choose what you want to explore in this table.