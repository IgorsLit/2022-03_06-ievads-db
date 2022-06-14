-- Izveidojiet tabulu ar citu nosaukumu, bet tādiem pašiem laukiem kā vienai no esošām tabulām.
CREATE TABLE tasks72 SELECT * FROM tasks61 WHERE 1=2;

-- Aizpildiet šo tabulu ar datiem no avota (source) tabulas, izmantojot INSERT komandu ar sintaksi INSERT INTO... SELECT ... FROM.
INSERT INTO tasks72 (id, theme, type, task_text, last_updated) SELECT * FROM tasks61; 
SELECT * FROM maintain.tasks72; 

-- Tagad uzrakstiet UPDATE komandu, tā lai mainītu kādu lauku vienā tabulā ar šā lauka vērtību no cita ieraksta. 
UPDATE tasks72 SET id = 1 WHERE id = 31;

SELECT * FROM maintain.tasks61 WHERE id = 31;
/*
+----+----------+---------------+------------------------+---------------------+
| id | theme    | type          | task_text              | last_updated        |
+----+----------+---------------+------------------------+---------------------+
| 31 | Mainigie | Daudzizveellu | Izvelies mainigu tipus | 2022-06-14 15:26:22 |
+----+----------+---------------+------------------------+---------------------+
*/

UPDATE tasks61 AS destination, tasks72 AS source_col SET destination.last_updated = source_col.last_updated WHERE destination.id = source_col.id+30;
SELECT * FROM maintain.tasks72 WHERE id = 1;
/*
+----+----------+---------------+------------------------+---------------------+
| id | theme    | type          | task_text              | last_updated        |
+----+----------+---------------+------------------------+---------------------+
|  1 | Mainigie | Daudzizveellu | Izvelies mainigu tipus | 2022-06-14 15:48:36 |
+----+----------+---------------+------------------------+---------------------+
*/
SELECT * FROM maintain.tasks61 WHERE id = 31;
/*
+----+----------+---------------+------------------------+---------------------+
| id | theme    | type          | task_text              | last_updated        |
+----+----------+---------------+------------------------+---------------------+
| 31 | Mainigie | Daudzizveellu | Izvelies mainigu tipus | 2022-06-14 15:48:36 |
+----+----------+---------------+------------------------+---------------------+
*/
