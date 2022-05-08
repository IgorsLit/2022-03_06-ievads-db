mysql> USE employees

Database changed
mysql> SHOW TABLES;
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set (0.006 sec)

mysql> SELECT DISTINCT gender AS dzimums FROM employees;
+---------+
| dzimums |
+---------+
| M       |
| F       |
+---------+
2 rows in set (6.821 sec)

mysql> descriptin
    -> employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'descriptin
employees' at line 1
mysql> DESCRIBE employees;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int(11)       | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
6 rows in set (0.068 sec)

mysql> SELECT DISTINCT hire_date AS dat, gender AS dzimums FROM employees WHERE YEAR(dat) > 1995 ORDER BY hire_date, dzimums;
ERROR 1054 (42S22): Unknown column 'dat' in 'where clause'
mysql> SELECT DISTINCT hire_date AS dat, gender AS dzimums FROM employees WHERE YEAR(hire_date) > 1995 ORDER BY hire_date, dzimums;
+------------+---------+
| dat        | dzimums |
+------------+---------+
| 1996-01-01 | M       |
| 1996-01-01 | F       |
| 1996-01-02 | M       |
| 1996-01-02 | F       |
| 1996-01-03 | M       |
| 1996-01-03 | F       |
| 1996-01-04 | M       |
| 1996-01-04 | F       |
| 1996-01-05 | M       |
| 1996-01-05 | F       |




| 1999-11-25 | F       |
| 1999-11-26 | M       |
| 1999-11-27 | M       |
| 1999-11-29 | M       |
| 1999-11-30 | M       |
| 1999-11-30 | F       |
| 1999-12-01 | F       |
| 1999-12-02 | M       |
| 1999-12-03 | M       |
| 1999-12-04 | M       |
| 1999-12-04 | F       |
| 1999-12-06 | M       |
| 1999-12-10 | F       |
| 1999-12-11 | F       |
| 1999-12-12 | F       |
| 1999-12-15 | F       |
| 1999-12-16 | M       |
| 1999-12-16 | F       |
| 1999-12-18 | F       |
| 1999-12-19 | M       |
| 1999-12-20 | M       |
| 1999-12-23 | M       |
| 1999-12-24 | F       |
| 1999-12-26 | M       |
| 1999-12-28 | F       |
| 1999-12-30 | M       |
| 1999-12-30 | F       |
| 1999-12-31 | M       |
| 1999-12-31 | F       |
| 2000-01-01 | M       |
| 2000-01-02 | F       |
| 2000-01-03 | M       |
| 2000-01-04 | F       |
| 2000-01-06 | F       |
| 2000-01-08 | M       |
| 2000-01-11 | F       |
| 2000-01-12 | M       |
| 2000-01-13 | F       |
| 2000-01-22 | F       |
| 2000-01-23 | M       |
| 2000-01-28 | M       |
+------------+---------+
2776 rows in set (4.902 sec)

mysql> SELECT DISTINCT hire_date AS dat, gender AS dzimums FROM employees WHERE YEAR(hire_date) > 1995 ORDER BY hire_date, dzimums LIMIT 5;
+------------+---------+
| dat        | dzimums |
+------------+---------+
| 1996-01-01 | M       |
| 1996-01-01 | F       |
| 1996-01-02 | M       |
| 1996-01-02 | F       |
| 1996-01-03 | M       |
+------------+---------+
5 rows in set (4.856 sec)

mysql> SELECT CONCAT(e.first_name,' ',e.last_name) AS 'vard uzvards', e.gender AS dzimums FROM employees AS e 
    -> WHERE YEAR(e.birht_date) = 1959 LIMIT 10;
ERROR 1054 (42S22): Unknown column 'e.birht_date' in 'where clause'
mysql> DESCRIBE employees;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int(11)       | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
6 rows in set (0.023 sec)

mysql> SELECT CONCAT(e.first_name,' ',e.last_name) AS 'vard uzvards', e.gender AS dzimums FROM employees AS e  WHERE YEAR(e.birTH_date) = 1959 LIMIT 10;
+----------------------+---------+
| vard uzvards         | dzimums |
+----------------------+---------+
| Parto Bamford        | M       |
| Guoxiang Nooteboom   | M       |
| Karsten Joslin       | M       |
| Adamantios Portugali | M       |
| Alejandro Brender    | M       |
| Weiyi Meriste        | F       |
| Uri Lenart           | F       |
| Udi Jansch           | M       |
| Danel Mondadori      | F       |
| Vishv Zockler        | M       |
+----------------------+---------+
10 rows in set (0.013 sec)

mysql> SHOW ERRORS
    -> ;
Empty set (0.001 sec)

mysql> EXIT;
Welcome to the MySQL monitor.  Commands end with ; or \g.

Copyright (c) 2000, 2018, Oracle, MySQL Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql [(none)]> USE employees;
Database changed
mysql> DESCRIBE employess;
ERROR 1146 (42S02): Table 'employees.employess' doesn't exist

mysql> DESCRIBE employees;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int(11)       | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
6 rows in set (0.038 sec)

mysql> SELECT * FROM employees LIMIT 5;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |
+--------+------------+------------+-----------+--------+------------+
5 rows in set (0.030 sec)

mysql> SELECT gender FROM employees LIMIT 10;
+--------+
| gender |
+--------+
| M      |
| F      |
| M      |
| M      |
| M      |
| F      |
| F      |
| M      |
| F      |
| F      |
+--------+
10 rows in set (0.009 sec)

mysql> SELECT DISTINCT gender FROM employees LIMIT 10;
+--------+
| gender |
+--------+
| M      |
| F      |
+--------+
2 rows in set (5.921 sec)

mysql> SELECT DISTINCT gender FROM employees;
+--------+
| gender |
+--------+
| M      |
| F      |
+--------+
2 rows in set (4.590 sec)

mysql> SELECT first_name, last_name FROM employees
    -> WHERE birth_day = '1963-12-28' LIMIT 5;
ERROR 1054 (42S22): Unknown column 'birth_day' in 'where clause'
mysql> SELECT first_name, last_name FROM employees WHERE birth_date = '1963-12-28' LIMIT 5;
+------------+---------------+
| first_name | last_name     |
+------------+---------------+
| Berry      | Farrel        |
| Ramalingam | Schwartzbauer |
| Mantis     | Otillio       |
| Leni       | Nishimukai    |
| Arif       | Meriste       |
+------------+---------------+
5 rows in set (0.310 sec)

mysql> SELECT first_name, last_name, birth_date FROM employees WHERE first_name = 'Apostol' LIMIT 5;
+------------+-------------+------------+
| first_name | last_name   | birth_date |
+------------+-------------+------------+
| Apostol    | Pintelas    | 1964-02-02 |
| Apostol    | Bahr        | 1952-09-06 |
| Apostol    | Rabehasaina | 1961-09-17 |
| Apostol    | Lunt        | 1962-04-30 |
| Apostol    | Goodrum     | 1953-12-05 |
+------------+-------------+------------+
5 rows in set (0.101 sec)

mysql> SELECT first_name, last_name, birth_date FROM employees WHERE first_name = 'Apostol' AND birth_date = '1956-04-09';
+------------+------------+------------+
| first_name | last_name  | birth_date |
+------------+------------+------------+
| Apostol    | Marchesini | 1956-04-09 |
+------------+------------+------------+
1 row in set (4.340 sec)

mysql> SELECT first_name, last_name, birth_date FROM employees WHERE first_name LIKE '%post%' LIMIT 10;
+------------+---------------+------------+
| first_name | last_name     | birth_date |
+------------+---------------+------------+
| Apostol    | Pintelas      | 1964-02-02 |
| Apostol    | Bahr          | 1952-09-06 |
| Apostol    | Rabehasaina   | 1961-09-17 |
| Apostol    | Lunt          | 1962-04-30 |
| Apostol    | Goodrum       | 1953-12-05 |
| Apostol    | Peot          | 1962-01-21 |
| Apostol    | Radhakrishnan | 1962-03-25 |
| Apostol    | Collette      | 1954-06-04 |
| Apostol    | Shihab        | 1961-06-02 |
| Apostol    | Birch         | 1960-02-03 |
+------------+---------------+------------+
10 rows in set (0.202 sec)

mysql> SELECT first_name, last_name, birth_date FROM employees WHERE first_name LIKE '%POST%' LIMIT 10;
+------------+---------------+------------+
| first_name | last_name     | birth_date |
+------------+---------------+------------+
| Apostol    | Pintelas      | 1964-02-02 |
| Apostol    | Bahr          | 1952-09-06 |
| Apostol    | Rabehasaina   | 1961-09-17 |
| Apostol    | Lunt          | 1962-04-30 |
| Apostol    | Goodrum       | 1953-12-05 |
| Apostol    | Peot          | 1962-01-21 |
| Apostol    | Radhakrishnan | 1962-03-25 |
| Apostol    | Collette      | 1954-06-04 |
| Apostol    | Shihab        | 1961-06-02 |
| Apostol    | Birch         | 1960-02-03 |
+------------+---------------+------------+
10 rows in set (0.201 sec)

mysql> SELECT first_name, last_name, birth_date
    -> FROM employees 
    -> WHERE first_name LIKE '%posto%'
    -> ORDER BY birth_date, last_name
    -> LIMIT 10;
+------------+-------------+------------+
| first_name | last_name   | birth_date |
+------------+-------------+------------+
| Apostol    | Reistad     | 1952-02-06 |
| Apostol    | Bouloucos   | 1952-03-29 |
| Apostol    | Shokrollahi | 1952-04-18 |
| Apostol    | Bresenham   | 1952-04-23 |
| Apostol    | Douceur     | 1952-05-11 |
| Apostol    | Peir        | 1952-06-22 |
| Apostol    | Ressouche   | 1952-07-12 |
| Apostol    | Kriebel     | 1952-08-07 |
| Apostol    | Herber      | 1952-08-12 |
| Apostol    | Cannane     | 1952-08-27 |
+------------+-------------+------------+
10 rows in set (5.237 sec)

mysql> SELECT first_name, last_name, birth_date FROM employees  WHERE first_name LIKE '%posto%' ORDER BY birth_date DESC, last_name ASC LIMIT 10;
+------------+-------------+------------+
| first_name | last_name   | birth_date |
+------------+-------------+------------+
| Apostol    | Gruenwald   | 1965-01-12 |
| Apostol    | Gubsky      | 1964-12-13 |
| Apostol    | Spinelli    | 1964-12-13 |
| Apostol    | Constantine | 1964-12-04 |
| Apostol    | Lieberherr  | 1964-11-29 |
| Apostol    | Sullins     | 1964-09-28 |
| Apostol    | Leonhardt   | 1964-09-21 |
| Apostol    | Copas       | 1964-09-20 |
| Apostol    | Ozeri       | 1964-09-16 |
| Apostol    | Quadeer     | 1964-08-13 |
+------------+-------------+------------+
10 rows in set (5.221 sec)

mysql> SELECT first_name, last_name, birth_date FROM employees  WHERE first_name LIKE '%posto%' ORDER BY birth_date_ DESC, last_name ASC LIMIT 10;
ERROR 1054 (42S22): Unknown column 'birth_date_' in 'order clause'
mysql> SHOW ERRORS;
+-------+------+------------------------------------------------+
| Level | Code | Message                                        |
+-------+------+------------------------------------------------+
| Error | 1054 | Unknown column 'birth_date_' in 'order clause' |
+-------+------+------------------------------------------------+
1 row in set (0.001 sec)

mysql> SHOW ERRORSs;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERRORSs' at line 1
mysql> SHOW WARNINGS;
+-------+------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Level | Code | Message                                                                                                                                                     |
+-------+------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Error | 1064 | You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERRORSs' at line 1 |
+-------+------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.001 sec)

mysql> SIGNAL SQLSTATE '42000'
    -> ;
ERROR 1644 (42000): Unhandled user-defined exception condition
mysql> SIGNAL SQLSTATE '1064';
ERROR 1407 (42000): Bad SQLSTATE: '1064'
mysql> SIGNAL SQLSTATE '42S22';
ERROR 1644 (42S22): Unhandled user-defined exception condition
mysql> EXIT;
