CREATE SCHEMA IF NOT EXISTS database_shema;

CREATE SCHEMA IF NOT EXISTS programming_schema;

FROM
    information_schema.schemata;

FROM
    information_schema.schemata
WHERE
    catalog_name = 'glossary';

CREATE SEQUENCE IF NOT EXISTS id_sql_sequence START 1;

CREATE SEQUENCE IF NOT EXISTS id_python_sequence START 1;

CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 1;

,
FROM
    pg_catalog.pg_sequence;

CREATE TABLE
    IF NOT EXISTS database_shema.sql (
        id INTEGER DEFAULT nextval ('id_sql_sequence'),
        word VARCHAR,
        description STRING
    );

CREATE TABLE
    IF NOT EXISTS database_shema.duckdb (
        id INTEGER DEFAULT nextval ('id_duckdb_sequence'),
        word VARCHAR,
        description STRING
    );

CREATE TABLE
    IF NOT EXISTS programming_schema.python (
        id INTEGER DEFAULT nextval ('id_python_sequence'),
        word VARCHAR,
        description STRING
    );