mysql [(none)]> SHOW SCHEMAS;
+-----------------------------+
| Database                    |
+-----------------------------+
| datatypes                   |
| creation                    |
| corpdb                      |
| education_db                |
| employees                   |
| information_schema          |
| mysql                       |
| performance_schema          |
| sakila                      |
+-----------------------------+
9 rows in set (0.167 sec)

mysql [(none)]> source /home/user/dir1/source_file.sql
Query OK, 1 row affected (0.016 sec)

Database changed
Query OK, 0 rows affected (0.382 sec)

Query OK, 0 rows affected (0.143 sec)
Records: 0  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0.162 sec)

Query OK, 0 rows affected (0.151 sec)
Records: 0  Duplicates: 0  Warnings: 0

Query OK, 8 rows affected (0.113 sec)
Records: 8  Duplicates: 0  Warnings: 0

Query OK, 9 rows affected (0.070 sec)
Records: 9  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0.028 sec)
Records: 2  Duplicates: 0  Warnings: 0

Query OK, 3 rows affected (0.020 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SHOW SCHEMAS;
+-----------------------------+
| Database                    |
+-----------------------------+
| datatypes                   |
| creation                    |
| maintain                    |
| corpdb                      |
| education_db                |
| employees                   |
| information_schema          |
| mysql                       |
| performance_schema          |
| sakila                      |
+-----------------------------+
10 rows in set (0.041 sec)

mysql> CREATE SCHEMA db1;
Query OK, 1 row affected (0.006 sec)

mysql> CREATE TABLE test_db1 SELECT * FROM maintain.students6;
Query OK, 11 rows affected (0.242 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM test_db1 LIMIT 3;
+----+-----------+----------+-----------+
| id | firstname | lastname | groups_id |
+----+-----------+----------+-----------+
|  1 | Andrejs   | Abolins  |         1 |
|  2 | Peteris   | Ozols    |         1 |
|  3 | Liene     | Smita    |         1 |
+----+-----------+----------+-----------+
3 rows in set (0.023 sec)

mysql> SHOW SCHEMAS;
+-----------------------------+
| Database                    |
+-----------------------------+
| datatypes                   |
| creation                    |
| maintain                    |
| corpdb                      |
| db1                         |
| education_db                |
| employees                   |
| information_schema          |
| mysql                       |
| performance_schema          |
| sakila                      |
+-----------------------------+
11 rows in set (0.005 sec)

mysql> DROP SCHEMA IF EXISTS db1;
Query OK, 0 rows affected (0.164 sec)

mysql> SHOW SCHEMAS;
+-----------------------------+
| Database                    |
+-----------------------------+
| datatypes                   |
| creation                    |
| maintain                    |
| corpdb                      |
| education_db                |
| employees                   |
| information_schema          |
| mysql                       |
| performance_schema          |
| sakila                      |
+-----------------------------+
10 rows in set (0.004 sec)

mysql> USE employees;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

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
8 rows in set (0.008 sec)

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
6 rows in set (0.083 sec)

mysql> USE maintain

Database changed
mysql> CREATE TABLE employees_copy
    -> SELECT emp.emp_no, emp.birth_date AS emp_birth_date, emp.first_name AS emp_name
    -> FROM employees.employees AS emp LIMIT 20;
Query OK, 20 rows affected (0.203 sec)
Records: 20  Duplicates: 0  Warnings: 0

mysql> DESCRIBE employees_copy;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| emp_no         | int(11)     | NO   |     | NULL    |       |
| emp_birth_date | date        | NO   |     | NULL    |       |
| emp_name       | varchar(14) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
3 rows in set (0.016 sec)

mysql> CREATE TEMPORARY TABLE employees_temp
    -> SELECT emp.emp_no, emp.birth_data AS emp_birth_date, emp.first_name AS emp_name
    -> FROM employees.employees AS emp LIMIT 20;
ERROR 1054 (42S22): Unknown column 'emp.birth_data' in 'field list'
mysql> CREATE TEMPORARY TABLE employees_temp SELECT emp.emp_no, emp.birth_date AS emp_birth_date, emp.first_name AS emp_name FROM employees.employees AS emp LIMIT 20;
Query OK, 20 rows affected (0.138 sec)
Records: 20  Duplicates: 0  Warnings: 0

mysql> SHOW TABLES;
+---------------------------------------+
| Tables_in_maintain                    |
+---------------------------------------+
| edu_groups6                           |
| employees_copy                        |
| students6                             |
| test_db1                              |
+---------------------------------------+
4 rows in set (0.014 sec)

mysql> SELECT * FROM employees_temp LIMIT 5;
+--------+----------------+-----------+
| emp_no | emp_birth_date | emp_name  |
+--------+----------------+-----------+
|  10001 | 1953-09-02     | Georgi    |
|  10002 | 1964-06-02     | Bezalel   |
|  10003 | 1959-12-03     | Parto     |
|  10004 | 1954-05-01     | Chirstian |
|  10005 | 1955-01-21     | Kyoichi   |
+--------+----------------+-----------+
5 rows in set (0.010 sec)

mysql> SELECT * FROM employees_copy LIMIT 5;
+--------+----------------+-----------+
| emp_no | emp_birth_date | emp_name  |
+--------+----------------+-----------+
|  10001 | 1953-09-02     | Georgi    |
|  10002 | 1964-06-02     | Bezalel   |
|  10003 | 1959-12-03     | Parto     |
|  10004 | 1954-05-01     | Chirstian |
|  10005 | 1955-01-21     | Kyoichi   |
+--------+----------------+-----------+
5 rows in set (0.010 sec)

mysql> SELECT DATABASE();
+-----------------------------+
| DATABASE()                  |
+-----------------------------+
| maintain                    |
+-----------------------------+
1 row in set (0.010 sec)

mysql> QUIT;
Welcome to the mysql monitor.  Commands end with ; or \g.

Copyright (c) 2000, 2018, Oracle, mysql Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql [(none)]> USE maintain;

Database changed
mysql> SELECT * FROM employees_temp LIMIT 5;
ERROR 1146 (42S02): Table 'maintain.employees_temp' doesn't exist
mysql> SHOW TABLES;
+---------------------------------------+
| Tables_in_maintain                    |
+---------------------------------------+
| edu_groups6                           |
| employees_copy                        |
| students6                             |
| test_db1                              |
+---------------------------------------+
4 rows in set (0.006 sec)

mysql> SELECT * FROM test_db1 LIMIT 5;
+----+-----------+----------+-----------+
| id | firstname | lastname | groups_id |
+----+-----------+----------+-----------+
|  1 | Andrejs   | Abolins  |         1 |
|  2 | Peteris   | Ozols    |         1 |
|  3 | Liene     | Smita    |         1 |
|  4 | Antons    | Avotins  |         2 |
|  5 | Janis     | Berzs    |         2 |
+----+-----------+----------+-----------+
5 rows in set (0.010 sec)

mysql> DROP TABLE test_db1, edu_groups6;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails
mysql> CREATE TABLE test_db2 SELECT * FROM edu_groups6;
Query OK, 11 rows affected (0.762 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> DROP TABLE test_db1, test_db2;
ERROR 1051 (42S02): Unknown table 'maintain.test_db1'
mysql> SHOW TABLES;
+---------------------------------------+
| Tables_in_maintain                    |
+---------------------------------------+
| edu_groups6                           |
| employees_copy                        |
| students6                             |
+---------------------------------------+
3 rows in set (0.008 sec)

mysql> CREATE TABLE test_db1 SELECT * FROM students6;
Query OK, 11 rows affected (0.137 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE test_db2 SELECT * FROM edu_groups6;
Query OK, 11 rows affected (0.167 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> SHOW TABLES;
+---------------------------------------+
| Tables_in_maintain                    |
+---------------------------------------+
| edu_groups6                           |
| employees_copy                        |
| students6                             |
| test_db1                              |
| test_db2                              |
+---------------------------------------+
5 rows in set (0.003 sec)

mysql> DROP TABLE test_db1, test_db2;
Query OK, 0 rows affected (0.094 sec)

mysql> DROP TABLE IF EXISTS staff_list1;
Query OK, 0 rows affected, 1 warning (0.005 sec)

mysql> SHOW WARNINGS;
+-------+------+---------------------------------------------------------+
| Level | Code | Message                                                 |
+-------+------+---------------------------------------------------------+
| Note  | 1051 | Unknown table 'maintain.staff_list1'                    |
+-------+------+---------------------------------------------------------+
1 row in set (0.001 sec)

mysql> ALTER TABLE employees_copy ADD COLUMN comments VARCHAR(255);
Query OK, 0 rows affected (0.057 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employees LIMIT 5;
ERROR 1146 (42S02): Table 'maintain.employees' doesn't exist
mysql> SELECT * FROM employees_copy LIMIT 5;
+--------+----------------+-----------+----------+
| emp_no | emp_birth_date | emp_name  | comments |
+--------+----------------+-----------+----------+
|  10001 | 1953-09-02     | Georgi    | NULL     |
|  10002 | 1964-06-02     | Bezalel   | NULL     |
|  10003 | 1959-12-03     | Parto     | NULL     |
|  10004 | 1954-05-01     | Chirstian | NULL     |
|  10005 | 1955-01-21     | Kyoichi   | NULL     |
+--------+----------------+-----------+----------+
5 rows in set (0.014 sec)

mysql> SHOW INDEX FROM employees_copy;
Empty set (0.004 sec)

mysql> ALTER TABLE employees_copy ADD INDEX birth_idx (emp_birth_date);
Query OK, 0 rows affected (0.565 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employees_copy ADD UNIQUE name_unique_idx (emp_name);
Query OK, 0 rows affected (0.226 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employees_copy ADD PRIMARY KEY (emp_no);
Query OK, 0 rows affected (0.231 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW INDEX FROM employees_copy;
+----------------+------------+-----------------+--------------+----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table          | Non_unique | Key_name        | Seq_in_index | Column_name    | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+----------------+------------+-----------------+--------------+----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| employees_copy |          0 | PRIMARY         |            1 | emp_no         | A         |          20 |     NULL | NULL   |      | BTREE      |         |               |
| employees_copy |          0 | name_unique_idx |            1 | emp_name       | A         |          20 |     NULL | NULL   |      | BTREE      |         |               |
| employees_copy |          1 | birth_idx       |            1 | emp_birth_date | A         |          20 |     NULL | NULL   |      | BTREE      |         |               |
+----------------+------------+-----------------+--------------+----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
3 rows in set (0.056 sec)

mysql> exit;
