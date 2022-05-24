USE sakila;
SELECT count(ac.actor_id) over() tcnt,
     ac.*
FROM actor ac;

SELECT @@global.secure_file_priv;

-- @@global.secure_file_priv = ???;

SELECT count(ac.actor_id) over() tcnt,
     ac.*
INTO OUTFILE 'C:\\Folder\\sakila_actors.export.csv'
FROM actor ac;

SELECT count(ac.actor_id) over() tcnt,
     ac.*
INTO OUTFILE 'C:\\Folder\\sakila_actors.export2.csv'
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM actor ac;


-- Data import
USE sakila;
SELECT ac.*
FROM actor ac;
-- imported into txt in MySQL WorkBench 

CREATE SCHEMA `DBImportExport`;
USE `DBImportExport`;

CREATE TABLE actor_copy AS 
SELECT ac.*
FROM sakila.actor AS ac
WHERE 1=2; 

SHOW GLOBAL VARIABLES LIKE 'local_infile';

set global local_infile=true;

-- in consol command is     mysql --local-infile=1

SELECT * FROM actor_copy;

LOAD DATA INFILE 'C:\\Folder\\sakila_actors.export3.txt' INTO TABLE actor_copy;

SELECT * FROM actor_copy;

