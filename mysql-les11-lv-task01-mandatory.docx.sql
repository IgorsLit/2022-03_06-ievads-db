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