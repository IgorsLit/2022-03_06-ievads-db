-- ------------------------------------------
-- MySQL Shell 
-- ------------------------------------------

\connect user@localhost:3306
SELECT NOW();
SELECT VERSION();
SELECT DATABASE();

SELECT NOW;
SHOW ERRORS;

SELECT 1/0;
SELECT (1/0);
SELECT (1/0) AS Rezultāts;
SELECT length("Hello World!!!") ;
SELECT length(_utf8 "Hello World!!!");
SHOW WARNINGS;
SELECT inst("Hello World!!!", "World!!!");
SELECT instr("Hello World!!!", "World!!!");

-- simbolu numuracija no 1, H1. e2. l3. l4. o5. space6. un W ir 7.
SELECT strcmp('abc', 'abc') ;
SELECT strcmp('abc', 'abcd') ;
SELECT LOWER('MySQL');
SELECT UPPER('MySQL');
SELECT LPAD('MySQL', 8, '.');
SELECT LPAD('MySQL', 15, '.');
SELECT RPAD('MySQL', 8, '.');
SELECT RPAD('MySQL', 15, '.');
SELECT TRIM('       MySQL    ') AS str;
SELECT TRIM(LEADING 'Q' FROM 'QQQMySQLQQQ');
SELECT TRIM('Q' FROM 'QQQMySQLQQQ');
SELECT FIND_IN_SET('b', 'a,b,c,d');-- SET ir kopa ar unikaliem elementiem

SELECT NOW(), DATE_FORMAT(NOW(), '%W the %D of %M');

SELECT ABS(-34);
SELECT ROUND(135.375, 2), TRUNCATE(135.375, 2);

USE sakila;
DESCRIBE payment;

CREATE SCHEMA `8lesFunctions`;
USE `8lesFunctions`;
CREATE TABLE payment_copy AS SELECT * FROM sakila.payment LIMIT 10;

ALTER TABLE payment_copy MODIFY COLUMN amount DECIMAL(5, 2) NULL;
SELECT * FROM payment_copy LIMIT 5;

UPDATE payment_copy SET amount = NULL WHERE payment_id = 3;
SELECT * FROM payment_copy LIMIT 5;

SELECT payment_id, amount * 2, ifnull(amount * 2, 0) FROM payment_copy LIMIT 5;
