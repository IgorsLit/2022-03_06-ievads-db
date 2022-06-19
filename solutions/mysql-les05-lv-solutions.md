# Nodarbība 05
## Uzdevums 1 : Datu vaicājumu pamati

### Vaicājumi (Queries)

# Obligātaais mājas Darbs

```
-- pieslēdzamies izvēlētajai datubāazes instancei kurā pieejama demo datubāze employees. Iespējams izmantot arī pagājušajā praktiskajā darbā izveidoto datubāzi.

USE employees;  -- izvēlamies noklusēto datubāzi.

-- vaicājums kolonu sarakstam ar *

SELECT * FROM employees;

-- konstatējam ka šī tabula ir pārāk liela. Ieerobežojam atgriezto ierakstu skaitu uz 20. Šādā veidā iegūstam kopainu par esošajām kolonām un datu raksturu.

SELECT *
FROM employees
LIMIT 20;

-- savienojam vārdu un uzvārdu vienā rindā.

SELECT concat(first_name , ' ' , last_name) as full_name
FROM employees
LIMIT 20;

-- izdaram to pašu ar pipes simbolu. Jāuzstāda speciāls sistēmas mainīgais.

SET @@SQL_MODE = CONCAT(@@SQL_MODE, ',PIPES_AS_CONCAT');

SHOW VARIABLES LIKE '%SQL_MODE%'

SELECT first_name || ' ' || last_name as full_name
FROM employees
LIMIT 20;

-- izmēģinam distinct uz gender kolonas. Sākumā izvadam visus ierakstus lai ieraudzītu atšķirību.

SELECT gender
FROM employees;

SELECT DISTINCT gender
FROM employees;

-- izmēģinam ORDER BY
-- sortējaam employees pēc dzimšanas datuma dilstoši , vārda, uzvārda, parādam vecumu.

SELECT first_name,last_name,birth_date,timestampdiff(YEAR,birth_date,current_date) age
FROM employees
ORDER BY birth_date desc, first_name, last_name;

-- filtrējam ierakstus ar WHERE.

SELECT *
FROM employees
WHERE first_name LIKE 'A%' and YEAR(birth_date) > 1988;

SELECT first_name,last_name, birth_date
FROM employees
WHERE first_name LIKE 'A%' and YEAR(birth_date)>=1965;

```

# Neobligātais mājas darbs.

```
-- reeverse engineer employees datubāazi iegūstot vizuālu datu modeli iekš mysqlworkbench.
-- Izmaantojiet šso modeļa vizualizāciju lai saprastu PK - FK attiecības (relācijas).

-- izpildām JOIN (tabulu saavienošanu) no 2 tabulām: employees un titles

SELECT e.emp_no empno_pk,t.emp_no title_ref_empno, t.title, t.from_date title_fromdate,t.to_date title_todate
FROM employees e JOIN titles t
USING (emp_no);

-- rezultāts atrodas iekš data grid. Pārslēdzieties un EXPLAIN PLAN. Ko domājat par šo izpildes plānu?

-- navigātorā pārejiet uz indeksiem. Kādi indeksi pieejami?

-- aapskatiet indexus mysqlworkbench vai ar šādu komandu:

SHOW INDEX FROM db_name. table_name;

-- Index uz Primary Key ir automātisks. Pieliekam arī uz foreign key.

CREATE INDEX titles_employees_fk_idx on titles(emp_no);

-- apskatam vai radāas atšķirība izpildes plānam.

```
