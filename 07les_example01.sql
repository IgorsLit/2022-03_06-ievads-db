mysql> CREATE SCHEMA dataml;
Query OK, 1 row affected (0.017 sec)

mysql> USE dataml;
Database changed

mysql> CREATE TABLE employees_copy AS SELECT * FROM employees.employees LIMIT 30;
Query OK, 30 rows affected (0.240 sec)
Records: 30  Duplicates: 0  Warnings: 0

mysql> DESCRIBE employees_copy;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int(11)       | NO   |     | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
6 rows in set (0.047 sec)

mysql> ALTER TABLE employees_copy ADD COLUMN emp_id INT AUTO_INCREMENT PRIMARY KEY;
Query OK, 0 rows affected (0.248 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO employees_copy (emp_no, birth_date, first_name, last_name, gender, hire_date)
    -> VALUES
    -> ('1001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'),
    -> ('1002', '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21');
Query OK, 2 rows affected (0.034 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employees_copy WHERE emp_no IN ('1001', '1002');
+--------+------------+------------+-----------+--------+------------+--------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | emp_id |
+--------+------------+------------+-----------+--------+------------+--------+
|   1001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |     31 |
|   1002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |     32 |
+--------+------------+------------+-----------+--------+------------+--------+
2 rows in set (0.013 sec)

mysql> SELECT * FROM employees_copy LIMIT 1;
+--------+------------+------------+-----------+--------+------------+--------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | emp_id |
+--------+------------+------------+-----------+--------+------------+--------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |      1 |
+--------+------------+------------+-----------+--------+------------+--------+
1 row in set (0.007 sec)

mysql> REPLACE INTO employees_copy(emp_no, birth_date, first_name, last_name, hire_date) VALUES ('10001', '1958-04-17', 'Rob', 'Bob', '2021-08-25');
Query OK, 1 row affected (0.014 sec)

mysql> SELECT * FROM employees_copy WHERE emp_no = '10001';
+--------+------------+------------+-----------+--------+------------+--------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | emp_id |
+--------+------------+------------+-----------+--------+------------+--------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |      1 |
|  10001 | 1958-04-17 | Rob        | Bob       | M      | 2021-08-25 |     33 |
+--------+------------+------------+-----------+--------+------------+--------+
2 rows in set (0.009 sec)

mysql> SET AUTOCOMMIT = 0;
Query OK, 0 rows affected (0.009 sec)

mysql> SELECT * FROM employees_copy WHERE emp_no = '10002';
+--------+------------+------------+-----------+--------+------------+--------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | emp_id |
+--------+------------+------------+-----------+--------+------------+--------+
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |      2 |
+--------+------------+------------+-----------+--------+------------+--------+
1 row in set (0.003 sec)

mysql> DELETE FROM employees_copy WHERE emp_no = '10002';
Query OK, 1 row affected (0.007 sec)

mysql> SELECT * FROM employees_copy WHERE emp_no = '10002';
Empty set (0.003 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.010 sec)

mysql> SELECT * FROM employees_copy WHERE emp_no = '10002';
+--------+------------+------------+-----------+--------+------------+--------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | emp_id |
+--------+------------+------------+-----------+--------+------------+--------+
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |      2 |
+--------+------------+------------+-----------+--------+------------+--------+
1 row in set (0.006 sec)

mysql> EXIT;
