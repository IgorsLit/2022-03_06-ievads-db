Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 8.0.99 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
-- Pieslēdzieties MySQL serverim, employees datubāzei.
mysql> USE employees;
ERROR 1049 (42000): Unknown database 'employees'
mysql> -- Pieslēdzieties MySQL serverim, employees datubāzei.
mysql> SELECT CONCAT(first_name, ' ', last_name) AS full_name, title, from_date, to_date
    -> FROM titles JOIN employees USING (emp_no)
    -> ORDER BY emp_no;
ERROR 1046 (3D000): No database selected
mysql> exit;

-- Turpinajums WorkBencha 
-- DUBLEJAS IERAKSTI, tapec ka ieprieksejais amats un pasreizejais

-- cilveka pasrejzejais amats ar WHERE
CREATE VIEW employee_title_vw AS
SELECT CONCAT(first_name, ' ', last_name) AS full_name, title, from_date, to_date
FROM titles JOIN employees USING (emp_no)
WHERE to_tate > CURDATE()
ORDER BY emp_no;

CREATE VIEW employee_title_vw AS
SELECT emp_no, CONCAT(first_name, ' ', last_name) AS full_name, title, from_date, to_date
FROM titles 
JOIN employees USING (emp_no)
WHERE to_tate > CURDATE()
ORDER BY emp_no;

-- Uzrakstiet vaicājumu, kurš atgriezis visus departamenta vadītāju amatu nosaukumus. Izmantojiet apakšvaicājumu EXISTS. Pamainiet uz apakšvaicājumu IN.
SELECT DISTINCT title FROM employee_title_vw AS oute 
WHERE emp_no IN (SELECT emp_no FROM dept_manager);

SELECT DISTINCT title FROM employee_title_vw AS oute 
WHERE EXISTS (SELECT 1 FROM dept_manager WHERE emp_no = oute.emp_no);

-- first query test
SELECT dept_name, dept_no,
       max(salary)
FROM departments AS d
JOIN dep_emp AS de USING (dept_no)
JOIN eployees AS e USING (emp_no)
JOIN salaries AS s ON (s.emp_no = de.emp_no)
GROUP BY dept_name, dept_no;

-- second part of preview query
DROP VIEW dept_max_salary_vw;
CREATE VIEW dept_max_salary_vw AS
SELECT dept_name, dept_no,
       max(salary)
FROM departments AS d
JOIN dep_emp AS de USING (dept_no)
JOIN eployees AS e USING (emp_no)
JOIN salaries AS s ON (s.emp_no = de.emp_no)
GROUP BY dept_name, dept_no; 

SELECT CONCAT(first_name, ' ', last_name) AS full_name,
(SELECT CONCAT(dept_name, ' ', max_salary) 
FROM dept_max_salary_vw
WHERE dept_no = de.dept_no)
FROM employees AS e JOIN dept_emp AS de USING (emp_no);




Welcome to the MySql monitor.  Commands end with ; or \g.
Your MySql connection id is 2

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

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
8 rows in set (0.012 sec)

mysql> SELECT * FROM titles LIMIT 10;
+--------+-----------------+------------+------------+
| emp_no | title           | from_date  | to_date    |
+--------+-----------------+------------+------------+
|  10001 | Senior Engineer | 1986-06-26 | 9999-01-01 |
|  10002 | Staff           | 1996-08-03 | 9999-01-01 |
|  10003 | Senior Engineer | 1995-12-03 | 9999-01-01 |
|  10004 | Engineer        | 1986-12-01 | 1995-12-01 |
|  10004 | Senior Engineer | 1995-12-01 | 9999-01-01 |
|  10005 | Senior Staff    | 1996-09-12 | 9999-01-01 |
|  10005 | Staff           | 1989-09-12 | 1996-09-12 |
|  10006 | Senior Engineer | 1990-08-05 | 9999-01-01 |
|  10007 | Senior Staff    | 1996-02-11 | 9999-01-01 |
|  10007 | Staff           | 1989-02-10 | 1996-02-11 |
+--------+-----------------+------------+------------+
10 rows in set (0.062 sec)

mysql> SELECT DISTINCT t.title FROM titles AS t;
+--------------------+
| title              |
+--------------------+
| Senior Engineer    |
| Staff              |
| Engineer           |
| Senior Staff       |
| Assistant Engineer |
| Technique Leader   |
| Manager            |
+--------------------+
7 rows in set (14.163 sec)

mysql> SELECT COUNT(*) FROM titles AS t;
+----------+
| COUNT(*) |
+----------+
|   443308 |
+----------+
1 row in set (3.308 sec)

mysql> SELECT * FROM employees AS emp LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski | F      | 1989-02-10 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |
|  10009 | 1952-04-19 | Sumant     | Peac      | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |
+--------+------------+------------+-----------+--------+------------+
10 rows in set (0.012 sec)

mysql> SELECT CONCAT(emp.first_name, ' ', emp.last_name) AS full_name, t.title, t.from_date, t.to_date
    -> FROM titles AS t INNER JOIN employees AS emp USING(emp_no)
    -> ORDER BY emp_no LIMIT 10;
+-------------------+-----------------+------------+------------+
| full_name         | title           | from_date  | to_date    |
+-------------------+-----------------+------------+------------+
| Georgi Facello    | Senior Engineer | 1986-06-26 | 9999-01-01 |
| Bezalel Simmel    | Staff           | 1996-08-03 | 9999-01-01 |
| Parto Bamford     | Senior Engineer | 1995-12-03 | 9999-01-01 |
| Chirstian Koblick | Engineer        | 1986-12-01 | 1995-12-01 |
| Chirstian Koblick | Senior Engineer | 1995-12-01 | 9999-01-01 |
| Kyoichi Maliniak  | Senior Staff    | 1996-09-12 | 9999-01-01 |
| Kyoichi Maliniak  | Staff           | 1989-09-12 | 1996-09-12 |
| Anneke Preusig    | Senior Engineer | 1990-08-05 | 9999-01-01 |
| Tzvetan Zielinski | Senior Staff    | 1996-02-11 | 9999-01-01 |
| Tzvetan Zielinski | Staff           | 1989-02-10 | 1996-02-11 |
+-------------------+-----------------+------------+------------+
10 rows in set (0.030 sec)

mysql> -- dublejas ieraksti, tapec ka ieprieiksejais amats un pasreizejais
mysql> SELECT CONCAT(emp.first_name, ' ', emp.last_name) AS full_name, t.title, t.from_date, t.to_date FROM titles AS t INNER JOIN employees AS
    -> emp USING(emp_no) WHERE YEAR(t.to_date) = '9999' ORDER BY emp_no LIMIT 10;
+--------------------+-----------------+------------+------------+
| full_name          | title           | from_date  | to_date    |
+--------------------+-----------------+------------+------------+
| Georgi Facello     | Senior Engineer | 1986-06-26 | 9999-01-01 |
| Bezalel Simmel     | Staff           | 1996-08-03 | 9999-01-01 |
| Parto Bamford      | Senior Engineer | 1995-12-03 | 9999-01-01 |
| Chirstian Koblick  | Senior Engineer | 1995-12-01 | 9999-01-01 |
| Kyoichi Maliniak   | Senior Staff    | 1996-09-12 | 9999-01-01 |
| Anneke Preusig     | Senior Engineer | 1990-08-05 | 9999-01-01 |
| Tzvetan Zielinski  | Senior Staff    | 1996-02-11 | 9999-01-01 |
| Sumant Peac        | Senior Engineer | 1995-02-18 | 9999-01-01 |
| Duangkaew Piveteau | Engineer        | 1996-11-24 | 9999-01-01 |
| Patricio Bridgland | Senior Engineer | 2000-12-18 | 9999-01-01 |
+--------------------+-----------------+------------+------------+
10 rows in set (0.024 sec)

mysql> CREATE VIEW employee_title_vw AS
    -> SELECT emp.emp_no, CONCAT(emp.first_name, ' ', emp.last_name) AS full_name, t.title, t.from_date, t.to_date
    -> FROM titles AS t INNER JOIN employees AS emp USING(emp_no)
    -> WHERE YEAR(t.to_date) = '9999' ORDER BY emp_no;
Query OK, 0 rows affected (0.023 sec)

mysql> SELECT count(*) FROM dept_manager;
+----------+
| count(*) |
+----------+
|       24 |
+----------+
1 row in set (0.011 sec)

mysql> SELECT * FROM dept_manager;
+--------+---------+------------+------------+
| emp_no | dept_no | from_date  | to_date    |
+--------+---------+------------+------------+
| 110022 | d001    | 1985-01-01 | 1991-10-01 |
| 110039 | d001    | 1991-10-01 | 9999-01-01 |
| 110085 | d002    | 1985-01-01 | 1989-12-17 |
| 110114 | d002    | 1989-12-17 | 9999-01-01 |
| 110183 | d003    | 1985-01-01 | 1992-03-21 |
| 110228 | d003    | 1992-03-21 | 9999-01-01 |
| 110303 | d004    | 1985-01-01 | 1988-09-09 |
| 110344 | d004    | 1988-09-09 | 1992-08-02 |
| 110386 | d004    | 1992-08-02 | 1996-08-30 |
| 110420 | d004    | 1996-08-30 | 9999-01-01 |
| 110511 | d005    | 1985-01-01 | 1992-04-25 |
| 110567 | d005    | 1992-04-25 | 9999-01-01 |
| 110725 | d006    | 1985-01-01 | 1989-05-06 |
| 110765 | d006    | 1989-05-06 | 1991-09-12 |
| 110800 | d006    | 1991-09-12 | 1994-06-28 |
| 110854 | d006    | 1994-06-28 | 9999-01-01 |
| 111035 | d007    | 1985-01-01 | 1991-03-07 |
| 111133 | d007    | 1991-03-07 | 9999-01-01 |
| 111400 | d008    | 1985-01-01 | 1991-04-08 |
| 111534 | d008    | 1991-04-08 | 9999-01-01 |
| 111692 | d009    | 1985-01-01 | 1988-10-17 |
| 111784 | d009    | 1988-10-17 | 1992-09-08 |
| 111877 | d009    | 1992-09-08 | 1996-01-03 |
| 111939 | d009    | 1996-01-03 | 9999-01-01 |
+--------+---------+------------+------------+
24 rows in set (0.006 sec)

mysql> SELECT DISTINCT title FROM employee_title_vw AS oute
    -> WHERE EXISTS (SELECT 1 FROM dept_manager WHERE emp_no = oute.emp_no)
    -> /* EXISTS atgriezz TRUE, tapec SELECT 1 in inner subQuery. Koreleejossais apakssvaicaajums ... oute (... = oute.emp_no) */
    -> ;
+------------------+
| title            |
+------------------+
| Senior Staff     |
| Manager          |
| Staff            |
| Technique Leader |
+------------------+
4 rows in set (0.136 sec)

mysql> SELECT DISTINCT title FROM employee_title_vw AS oute
    -> WHERE emp_no IN (SELECT emp_no FROM dept_manager)
    -> /* Nekoreleejossais apakssvaicaajums */
    -> ;
+------------------+
| title            |
+------------------+
| Senior Staff     |
| Manager          |
| Staff            |
| Technique Leader |
+------------------+
4 rows in set (0.029 sec)

mysql> exit
