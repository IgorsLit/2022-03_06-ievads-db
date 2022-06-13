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

Welcome to the MySql monitor.  Commands end with ; or \g.
Your MySql connection id is 3

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
| employee_title_vw    |
| employees            |
| salaries             |
| titles               |
+----------------------+
9 rows in set (0.004 sec)

mysql> SELECT * FROM salaries LIMIT 10;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  60117 | 1986-06-26 | 1987-06-26 |
|  10001 |  62102 | 1987-06-26 | 1988-06-25 |
|  10001 |  66074 | 1988-06-25 | 1989-06-25 |
|  10001 |  66596 | 1989-06-25 | 1990-06-25 |
|  10001 |  66961 | 1990-06-25 | 1991-06-25 |
|  10001 |  71046 | 1991-06-25 | 1992-06-24 |
|  10001 |  74333 | 1992-06-24 | 1993-06-24 |
|  10001 |  75286 | 1993-06-24 | 1994-06-24 |
|  10001 |  75994 | 1994-06-24 | 1995-06-24 |
|  10001 |  76884 | 1995-06-24 | 1996-06-23 |
+--------+--------+------------+------------+
10 rows in set (0.054 sec)

mysql> SELECT * FROM salaries WHERE emp_no = 10001;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  60117 | 1986-06-26 | 1987-06-26 |
|  10001 |  62102 | 1987-06-26 | 1988-06-25 |
|  10001 |  66074 | 1988-06-25 | 1989-06-25 |
|  10001 |  66596 | 1989-06-25 | 1990-06-25 |
|  10001 |  66961 | 1990-06-25 | 1991-06-25 |
|  10001 |  71046 | 1991-06-25 | 1992-06-24 |
|  10001 |  74333 | 1992-06-24 | 1993-06-24 |
|  10001 |  75286 | 1993-06-24 | 1994-06-24 |
|  10001 |  75994 | 1994-06-24 | 1995-06-24 |
|  10001 |  76884 | 1995-06-24 | 1996-06-23 |
|  10001 |  80013 | 1996-06-23 | 1997-06-23 |
|  10001 |  81025 | 1997-06-23 | 1998-06-23 |
|  10001 |  81097 | 1998-06-23 | 1999-06-23 |
|  10001 |  84917 | 1999-06-23 | 2000-06-22 |
|  10001 |  85112 | 2000-06-22 | 2001-06-22 |
|  10001 |  85097 | 2001-06-22 | 2002-06-22 |
|  10001 |  88958 | 2002-06-22 | 9999-01-01 |
+--------+--------+------------+------------+
17 rows in set (0.016 sec)

mysql> SELECT * FROM salaries WHERE emp_no = 10001 AND YEAR(to_date) = 9999;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  88958 | 2002-06-22 | 9999-01-01 |
+--------+--------+------------+------------+
1 row in set (0.012 sec)

mysql> SELECT * FROM salaries WHERE emp_no = 10002 AND YEAR(to_date) = 9999;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10002 |  72527 | 2001-08-02 | 9999-01-01 |
+--------+--------+------------+------------+
1 row in set (0.011 sec)

mysql> SELECT * FROM dept_emp LIMIT 10;
+--------+---------+------------+------------+
| emp_no | dept_no | from_date  | to_date    |
+--------+---------+------------+------------+
|  10001 | d005    | 1986-06-26 | 9999-01-01 |
|  10002 | d007    | 1996-08-03 | 9999-01-01 |
|  10003 | d004    | 1995-12-03 | 9999-01-01 |
|  10004 | d004    | 1986-12-01 | 9999-01-01 |
|  10005 | d003    | 1989-09-12 | 9999-01-01 |
|  10006 | d005    | 1990-08-05 | 9999-01-01 |
|  10007 | d008    | 1989-02-10 | 9999-01-01 |
|  10008 | d005    | 1998-03-11 | 2000-07-31 |
|  10009 | d006    | 1985-02-18 | 9999-01-01 |
|  10010 | d004    | 1996-11-24 | 2000-06-26 |
+--------+---------+------------+------------+
10 rows in set (0.014 sec)

mysql> SELECT * FROM employees LIMIT 10;
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
10 rows in set (0.011 sec)

mysql> SELECT * FROM departments LIMIT 10;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+
9 rows in set (0.013 sec)

mysql> SELECT COUNT(*) FROM departments;
+----------+
| COUNT(*) |
+----------+
|        9 |
+----------+
1 row in set (0.009 sec)

mysql> SELECT emp.last_name, emp.emp_no, dep.dept_name, dep.dept_no, de.emp_no, de.dept_no, de.to_date FROM employees AS emp JOIN dept_emp AS de USING(emp_no) JOIN departments AS dep USING(dept_no) WHERE YEAR(de.to_date) = 9999 LIMIT 5;
+-------------+--------+------------------+---------+--------+---------+------------+
| last_name   | emp_no | dept_name        | dept_no | emp_no | dept_no | to_date    |
+-------------+--------+------------------+---------+--------+---------+------------+
| Lortz       |  10038 | Customer Service | d009    |  10038 | d009    | 9999-01-01 |
| Tramer      |  10049 | Customer Service | d009    |  10049 | d009    | 9999-01-01 |
| Billingsley |  10060 | Customer Service | d009    |  10060 | d009    | 9999-01-01 |
| Syrzycki    |  10088 | Customer Service | d009    |  10088 | d009    | 9999-01-01 |
| Swick       |  10112 | Customer Service | d009    |  10112 | d009    | 9999-01-01 |
+-------------+--------+------------------+---------+--------+---------+------------+
5 rows in set (0.042 sec)

mysql> SELECT dep.dept_name, dep.dept_no, max(sl.salary), de.to_date AS dep_emp_date, sl.to_date AS salary_date FROM employees AS emp JOIN dept_emp AS de USING(emp_no) JOIN departments AS dep USING(dept_no) JOIN salaries AS sl ON (sl.emp_no = de.emp_no) WHERE YEAR(sl.to_date) = 9999 LIMIT 2;
+------------------+---------+----------------+--------------+-------------+
| dept_name        | dept_no | max(sl.salary) | dep_emp_date | salary_date |
+------------------+---------+----------------+--------------+-------------+
| Customer Service | d009    |         158220 | 9999-01-01   | 9999-01-01  |
+------------------+---------+----------------+--------------+-------------+
1 row in set (7 min 46.884 sec)

mysql> DROP VIEW dept_max_salary_vw;
Query OK, 0 rows affected (0.031 sec)

MariaDB [employees]> CREATE VIEW dept_max_salary_vw AS
    -> SELECT dep.dept_name, dep.dept_no, max(sl.salary) AS max_salary
    -> FROM departments AS dep
    -> JOIN dept_emp AS de USING(dept_no)
    -> JOIN employees AS emp USING(emp_no)
    -> JOIN salaries AS sl ON (sl.emp_no = de.emp_no)
    -> WHERE YEAR(sl.to_date) = 9999
    -> GROUP BY dep.dept_name, dep.dept_no;
Query OK, 0 rows affected (0.051 sec)

mysql> SELECT CONCAT(first_name, ' ', last_name) AS full_name, (SELECT CONCAT(dept_name, ' ', max_salary) FROM dept_max_salary_vw WHERE dept_no = de.dept_no) FROM employees AS emp JOIN dept_emp AS de USING(emp_no) WHERE YEAR(de.to_date) = 9999 GROUP BY CONCAT(first_name, ' ', last_name);
+--------------------------------+------------------------------------------------------------------------------------------------+
| full_name                      | (SELECT CONCAT(dept_name, ' ', max_salary) FROM dept_max_salary_vw WHERE dept_no = de.dept_no) |
+--------------------------------+------------------------------------------------------------------------------------------------+
| Aamer Anger                    | Customer Service 144866                                                                        |
| Aamer Armand                   | Quality Management 132103                                                                      |
| Aamer Azevdeo                  | Customer Service 144866                                                                        |
| Aamer Azuma                    | Quality Management 132103                                                                      |
| Aamer Baak                     | Sales 158220                                                                                   |
| Aamer Baaleh                   | Development 144434                                                                             |
| Aamer Baar                     | Production 138273                                                                              |
| Aamer Baba                     | Sales 158220                                                                                   |
| Aamer Bahl                     | Human Resources 141953                                                                         |
| Aamer Bahr                     | Development 144434                                                                             |
| Aamer Basawa                   | Marketing 145128                                                                               |
| Aamer Beausoleil               | Development 144434                                                                             |
| Aamer Belinskaya               | Development 144434                                                                             |
| Aamer Benantar                 | Quality Management 132103                                                                      |
| Aamer Bennis                   | Development 144434                                                                             |
| Aamer Berendt                  | Development 144434                                                                             |
| Aamer Beznosov                 | Production 138273                                                                              |
| Aamer Bharadwaj                | Development 144434                                                                             |
| Aamer Birch                    | Production 138273                                                                              |
| Aamer Bottner                  | Finance 142395                                                                                 |
| Aamer Bouloucos                | Quality Management 132103                                                                      |
| Aamer Brandsma                 | Development 144434                                                                             |
| Aamer Bridgland                | Sales 158220                                                                                   |
| Aamer Brlek                    | Quality Management 132103                                                                      |
| Aamer Burnard                  | Research 130211                                                                                |
| Aamer Calkin                   | Development 144434                                                                             |
| Aamer Cardazo                  | Production 138273                                                                              |
| Aamer Chenoweth                | Development 144434                                                                             |
| Aamer Cheshire                 | Production 138273                                                                              |
| Aamer Conti                    | Sales 158220                                                                                   |
| Aamer Crabtree                 | Development 144434                                                                             |
| Aamer Cromarty                 | Sales 158220                                                                                   |
| Aamer Cummings                 | Production 138273                                                                              |
| Aamer Cyre                     | Customer Service 144866                                                                        |
| Aamer Daescu                   | Production 138273                                                                              |
| Aamer Danecki                  | Production 138273                                                                              |
| Aamer Danner                   | Marketing 145128                                                                               |
| Aamer Dehkordi                 | Production 138273                                                                              |
| Aamer Demke                    | Production 138273                                                                              |
| Aamer Denny                    | Customer Service 144866                                                                        |
| Aamer Dulli                    | Quality Management 132103                                                                      |
| Aamer Dusink                   | Development 144434                                                                             |


| Yishai Zaumen                  | Production 138273                                                                              |
| Yishai Zedlitz                 | Finance 142395                                                                                 |
| Yishay Aamodt                  | Sales 158220                                                                                   |
| Yishay Akazan                  | Sales 158220                                                                                   |
| Yishay Akiyama                 | Human Resources 141953                                                                         |
| Yishay Alencar                 | Customer Service 144866                                                                        |
| Yishay Ambroszkiewicz          | Marketing 145128                                                                               |
| Yishay Auyong                  | Customer Service 144866                                                                        |
| Yishay Axelband                | Development 144434                                                                             |
| Yishay Azadmanesh              | Quality Management 132103                                                                      |



| Zvonko Valtorta                | Production 138273                                                                              |
| Zvonko Varman                  | Development 144434                                                                             |
| Zvonko Vecchio                 | Customer Service 144866                                                                        |
| Zvonko Veeraraghavan           | Production 138273                                                                              |
| Zvonko Ventosa                 | Marketing 145128                                                                               |
| Zvonko Vesna                   | Sales 158220                                                                                   |
| Zvonko Viele                   | Production 138273                                                                              |
| Zvonko Vigier                  | Finance 142395                                                                                 |
| Zvonko Waterhouse              | Production 138273                                                                              |
| Zvonko Whitcomb                | Sales 158220                                                                                   |
| Zvonko Wielonsky               | Quality Management 132103                                                                      |
| Zvonko Wilharm                 | Marketing 145128                                                                               |
| Zvonko Wroclawski              | Development 144434                                                                             |
| Zvonko Yetto                   | Marketing 145128                                                                               |
| Zvonko Yoshizawa               | Production 138273                                                                              |
| Zvonko Yurov                   | Sales 158220                                                                                   |
| Zvonko Zambonelli              | Finance 142395                                                                                 |
| Zvonko Zobel                   | Sales 158220                                                                                   |
| Zvonko Zuberek                 | Production 138273                                                                              |
+--------------------------------+------------------------------------------------------------------------------------------------+
226781 rows in set (16 min 39.766 sec)

mysql> exit
