MySQL Shell 8.0.28

Copyright (c) 2016, 2022, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \connect root@localhost:3306
Creating a session to 'root@localhost:3306'
Please provide the password for 'root@localhost:3306': ********
Save password for 'root@localhost:3306'? [Y]es/[N]o/Ne[v]er (default No): n
Fetching schema names for autocompletion... Press ^C to stop.
Your MySQL connection id is 11
Server version: 8.0.28 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  SQL > SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2022-05-17 19:11:10 |
+---------------------+
1 row in set (0.0019 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 8.0.28    |
+-----------+
1 row in set (0.0007 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| NULL       |
+------------+
1 row in set (0.0002 sec)
 MySQL  localhost:3306 ssl  SQL > \option --persist history.autoSave=1
 MySQL  localhost:3306 ssl  SQL > SELECT NOW;
ERROR: 1054 (42S22): Unknown column 'NOW' in 'field list'
 MySQL  localhost:3306 ssl  SQL > SHOW ERRORS;
+-------+------+--------------------------------------+
| Level | Code | Message                              |
+-------+------+--------------------------------------+
| Error | 1054 | Unknown column 'NOW' in 'field list' |
+-------+------+--------------------------------------+
1 row in set (0.0016 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT 1/0;
+------+
| 1/0  |
+------+
| NULL |
+------+
1 row in set (0.0034 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT (1/0);
+-------+
| (1/0) |
+-------+
|  NULL |
+-------+
1 row in set (0.0004 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT (1/0) AS Rezultāts;
+-----------+
| Rezultāts |
+-----------+
|      NULL |
+-----------+
1 row in set (0.0008 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT length("Hello World!!!")
                               -> ;
+--------------------------+
| length("Hello World!!!") |
+--------------------------+
|                       14 |
+--------------------------+
1 row in set (0.0056 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT length(_utf8 "Hello World!!!");
+--------------------------------+
| length(_utf8 "Hello World!!!") |
+--------------------------------+
|                             14 |
+--------------------------------+
1 row in set, 1 warning (0.0019 sec)
Warning (code 3719): 'utf8' is currently an alias for the character set UTF8MB3, but will be an alias for UTF8MB4 in a future release. Please consider using UTF8MB4 in order to be unambiguous.
 MySQL  localhost:3306 ssl  SQL > SHOW WARNINGS;
+---------+------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Level   | Code | Message                                                                                                                                                                     |
+---------+------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Warning | 3719 | 'utf8' is currently an alias for the character set UTF8MB3, but will be an alias for UTF8MB4 in a future release. Please consider using UTF8MB4 in order to be unambiguous. |
+---------+------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.0002 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT inst("Hello World!!!", "World!!!");
ERROR: 1046 (3D000): No database selected
 MySQL  localhost:3306 ssl  SQL > SELECT instr("Hello World!!!", "World!!!");
+-------------------------------------+
| instr("Hello World!!!", "World!!!") |
+-------------------------------------+
|                                   7 |
+-------------------------------------+
1 row in set (0.0046 sec)
 MySQL  localhost:3306 ssl  SQL > -- simbolu numuracija no 1, H1. e2. l3. l4. o5. space6. un W ir 7.
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT strcmp('abc', 'abc')
                               -> ;
+----------------------+
| strcmp('abc', 'abc') |
+----------------------+
|                    0 |
+----------------------+
1 row in set (0.0020 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT strcmp('abc', 'abcd') ;
+-----------------------+
| strcmp('abc', 'abcd') |
+-----------------------+
|                    -1 |
+-----------------------+
1 row in set (0.0003 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT LOWER('MySQL');
+----------------+
| LOWER('MySQL') |
+----------------+
| mysql          |
+----------------+
1 row in set (0.0036 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT UPPER('MySQL');
+----------------+
| UPPER('MySQL') |
+----------------+
| MYSQL          |
+----------------+
1 row in set (0.0005 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT LPAD('MySQL', 8, '.');
+-----------------------+
| LPAD('MySQL', 8, '.') |
+-----------------------+
| ...MySQL              |
+-----------------------+
1 row in set (0.0031 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT LPAD('MySQL', 15, '.');
+------------------------+
| LPAD('MySQL', 15, '.') |
+------------------------+
| ..........MySQL        |
+------------------------+
1 row in set (0.0002 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT RPAD('MySQL', 8, '.');
+-----------------------+
| RPAD('MySQL', 8, '.') |
+-----------------------+
| MySQL...              |
+-----------------------+
1 row in set (0.0017 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT RPAD('MySQL', 15, '.');
+------------------------+
| RPAD('MySQL', 15, '.') |
+------------------------+
| MySQL..........        |
+------------------------+
1 row in set (0.0003 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT TRIM('       MySQL    ') AS str;
+-------+
| str   |
+-------+
| MySQL |
+-------+
1 row in set (0.0003 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT TRIM(LEADING 'Q' FROM 'QQQMySQLQQQ');
+--------------------------------------+
| TRIM(LEADING 'Q' FROM 'QQQMySQLQQQ') |
+--------------------------------------+
| MySQLQQQ                             |
+--------------------------------------+
1 row in set (0.0014 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT TRIM('Q' FROM 'QQQMySQLQQQ');
+------------------------------+
| TRIM('Q' FROM 'QQQMySQLQQQ') |
+------------------------------+
| MySQL                        |
+------------------------------+
1 row in set (0.0008 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT FIND_IN_SET('b', 'a,b,c,d');   -- SET ir kopa ar unikaliem elementiem
+-----------------------------+
| FIND_IN_SET('b', 'a,b,c,d') |
+-----------------------------+
|                           2 |
+-----------------------------+
1 row in set (0.0037 sec)
Query OK, 0 rows affected (0.0002 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT NOW(), DATE_FORMAT(NOW(), '%W the %D of %M');
+---------------------+---------------------------------------+
| NOW()               | DATE_FORMAT(NOW(), '%W the %D of %M') |
+---------------------+---------------------------------------+
| 2022-05-17 20:04:16 | Tuesday the 17th of May               |
+---------------------+---------------------------------------+
1 row in set (0.0083 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT ABS(-34);
+----------+
| ABS(-34) |
+----------+
|       34 |
+----------+
1 row in set (0.0055 sec)
 MySQL  localhost:3306 ssl  SQL > SELECT ROUND(135.375, 2), TRUNCATE(135.375, 2);
+-------------------+----------------------+
| ROUND(135.375, 2) | TRUNCATE(135.375, 2) |
+-------------------+----------------------+
|            135.38 |               135.37 |
+-------------------+----------------------+
1 row in set (0.0086 sec)
 MySQL  localhost:3306 ssl  SQL > \USE sakila;
Unknown command: '\USE sakila;'
 MySQL  localhost:3306 ssl  SQL > USE sakila;
Default schema set to `sakila`.
Fetching table and column names from `sakila` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  sakila  SQL > DESCRIBE payment;
+--------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| Field        | Type              | Null | Key | Default           | Extra                                         |
+--------------+-------------------+------+-----+-------------------+-----------------------------------------------+
| payment_id   | smallint unsigned | NO   | PRI | NULL              | auto_increment                                |
| customer_id  | smallint unsigned | NO   | MUL | NULL              |                                               |
| staff_id     | tinyint unsigned  | NO   | MUL | NULL              |                                               |
| rental_id    | int               | YES  | MUL | NULL              |                                               |
| amount       | decimal(5,2)      | NO   |     | NULL              |                                               |
| payment_date | datetime          | NO   |     | NULL              |                                               |
| last_update  | timestamp         | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+--------------+-------------------+------+-----+-------------------+-----------------------------------------------+
7 rows in set (0.0027 sec)
 MySQL  localhost:3306 ssl  sakila  SQL > CREATE SCHEMA 8lesFunctions;
Query OK, 1 row affected (0.0583 sec)
 MySQL  localhost:3306 ssl  sakila  SQL > USE 8lesFunctions;
Default schema set to `8lesFunctions`.
Fetching table and column names from `8lesfunctions` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  8lesfunctions  SQL > CREATE TABLE payment_copy AS SELECT * FROM sakila.payment LIMIT 10;
Query OK, 10 rows affected (0.1428 sec)

Records: 10  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  8lesfunctions  SQL > ALTER TABLE payment_copy MODIFY COLUMN amount DECIMAL(5, 2) NULL;
Query OK, 0 rows affected (0.1173 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  8lesfunctions  SQL > SELECT * FROM payment_copy LIMIT 5;
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
| payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
|          1 |           1 |        1 |        76 |   2.99 | 2005-05-25 11:30:37 | 2006-02-15 22:12:30 |
|          2 |           1 |        1 |       573 |   0.99 | 2005-05-28 10:35:23 | 2006-02-15 22:12:30 |
|          3 |           1 |        1 |      1185 |   5.99 | 2005-06-15 00:54:12 | 2006-02-15 22:12:30 |
|          4 |           1 |        2 |      1422 |   0.99 | 2005-06-15 18:02:53 | 2006-02-15 22:12:30 |
|          5 |           1 |        2 |      1476 |   9.99 | 2005-06-15 21:08:46 | 2006-02-15 22:12:30 |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
5 rows in set (0.0016 sec)
 MySQL  localhost:3306 ssl  8lesfunctions  SQL > UPDATE payment_copy SET amount = NULL WHERE payment_id = 3;
Query OK, 1 row affected (0.0123 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  8lesfunctions  SQL > SELECT * FROM payment_copy LIMIT 5;
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
| payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
|          1 |           1 |        1 |        76 |   2.99 | 2005-05-25 11:30:37 | 2006-02-15 22:12:30 |
|          2 |           1 |        1 |       573 |   0.99 | 2005-05-28 10:35:23 | 2006-02-15 22:12:30 |
|          3 |           1 |        1 |      1185 |   NULL | 2005-06-15 00:54:12 | 2022-05-17 20:29:08 |
|          4 |           1 |        2 |      1422 |   0.99 | 2005-06-15 18:02:53 | 2006-02-15 22:12:30 |
|          5 |           1 |        2 |      1476 |   9.99 | 2005-06-15 21:08:46 | 2006-02-15 22:12:30 |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
5 rows in set (0.0013 sec)
 MySQL  localhost:3306 ssl  8lesfunctions  SQL > SELECT payment_id, amount * 2, ifnull(amount * 2, 0) FROM payment_copy LIMIT 5;
+------------+------------+-----------------------+
| payment_id | amount * 2 | ifnull(amount * 2, 0) |
+------------+------------+-----------------------+
|          1 |       5.98 |                  5.98 |
|          2 |       1.98 |                  1.98 |
|          3 |       NULL |                  0.00 |
|          4 |       1.98 |                  1.98 |
|          5 |      19.98 |                 19.98 |
+------------+------------+-----------------------+
5 rows in set (0.0980 sec)
 MySQL  localhost:3306 ssl  8lesfunctions  SQL > \history save
Command history file saved with 42 entries.
 MySQL  localhost:3306 ssl  8lesfunctions  SQL >