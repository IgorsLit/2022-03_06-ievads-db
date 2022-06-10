mysql> USE edu_db;

Database changed
mysql> DESCRIBE groups;
+-------+---------------------+------+-----+---------+----------------+
| Field | Type                | Null | Key | Default | Extra          |
+-------+---------------------+------+-----+---------+----------------+
| id    | tinyint(1) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(10)         | YES  | UNI | NULL    |                |
+-------+---------------------+------+-----+---------+----------------+
2 rows in set (0.062 sec)

mysql> ALTER TABLE groups ADD edu_year_num TINYINT(1) UNSIGNED NOT NULL DEFAULT 1;
Query OK, 0 rows affected (0.202 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE groups ADD modifying_time TIMESTAMP;
Query OK, 0 rows affected (0.099 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM groups;
+----+-------+--------------+---------------------+
| id | name  | edu_year_num | modifying_time      |
+----+-------+--------------+---------------------+
|  1 | DP1-1 |            1 | 2022-05-08 21:01:10 |
|  2 | DP1-2 |            1 | 2022-05-08 21:01:10 |
|  3 | DP2-1 |            1 | 2022-05-08 21:01:10 |
|  4 | DP2-2 |            1 | 2022-05-08 21:01:10 |
|  5 | DT1-1 |            1 | 2022-05-08 21:01:10 |
|  6 | DT2-1 |            1 | 2022-05-08 21:01:10 |
|  7 | A1-1  |            1 | 2022-05-08 21:01:10 |
|  8 | A2-1  |            1 | 2022-05-08 21:01:10 |
+----+-------+--------------+---------------------+
8 rows in set (0.025 sec)

mysql> UPDATE groups SET edu_year_num = 2 WHERE name LIKE '%2-_';
Query OK, 4 rows affected (0.038 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> SELECT * FROM groups;
+----+-------+--------------+---------------------+
| id | name  | edu_year_num | modifying_time      |
+----+-------+--------------+---------------------+
|  1 | DP1-1 |            1 | 2022-05-08 21:01:10 |
|  2 | DP1-2 |            1 | 2022-05-08 21:01:10 |
|  3 | DP2-1 |            2 | 2022-05-08 21:14:21 |
|  4 | DP2-2 |            2 | 2022-05-08 21:14:21 |
|  5 | DT1-1 |            1 | 2022-05-08 21:01:10 |
|  6 | DT2-1 |            2 | 2022-05-08 21:14:21 |
|  7 | A1-1  |            1 | 2022-05-08 21:01:10 |
|  8 | A2-1  |            2 | 2022-05-08 21:14:21 |
+----+-------+--------------+---------------------+
8 rows in set (0.003 sec)

mysql> INSERT INTO groups(name, edu_year_num) VALUES ('PP1-1', 1), ('DP3-1', 3), ('DP4-1', 4);
Query OK, 3 rows affected (0.058 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM groups;
+----+-------+--------------+---------------------+
| id | name  | edu_year_num | modifying_time      |
+----+-------+--------------+---------------------+
|  1 | DP1-1 |            1 | 2022-05-08 21:01:10 |
|  2 | DP1-2 |            1 | 2022-05-08 21:01:10 |
|  3 | DP2-1 |            2 | 2022-05-08 21:14:21 |
|  4 | DP2-2 |            2 | 2022-05-08 21:14:21 |
|  5 | DT1-1 |            1 | 2022-05-08 21:01:10 |
|  6 | DT2-1 |            2 | 2022-05-08 21:14:21 |
|  7 | A1-1  |            1 | 2022-05-08 21:01:10 |
|  8 | A2-1  |            2 | 2022-05-08 21:14:21 |
|  9 | PP1-1 |            1 | 2022-05-08 21:20:22 |
| 10 | DP3-1 |            3 | 2022-05-08 21:20:22 |
| 11 | DP4-1 |            4 | 2022-05-08 21:20:22 |
+----+-------+--------------+---------------------+
11 rows in set (0.003 sec)

mysql> SELECT DISTINCT edu_year_num AS 'kurss(macibu gads)' FROM groups;
+--------------------+
| kurss(macibu gads) |
+--------------------+
|                  1 |
|                  2 |
|                  3 |
|                  4 |
+--------------------+
4 rows in set (0.019 sec)

mysql> SELECT modifying_time AS 'Izmainas datums', edu_year_num AS 'kurss(macibu gads)' FROM groups;
+---------------------+--------------------+
| Izmainas datums     | kurss(macibu gads) |
+---------------------+--------------------+
| 2022-05-08 21:01:10 |                  1 |
| 2022-05-08 21:01:10 |                  1 |
| 2022-05-08 21:14:21 |                  2 |
| 2022-05-08 21:14:21 |                  2 |
| 2022-05-08 21:01:10 |                  1 |
| 2022-05-08 21:14:21 |                  2 |
| 2022-05-08 21:01:10 |                  1 |
| 2022-05-08 21:14:21 |                  2 |
| 2022-05-08 21:20:22 |                  1 |
| 2022-05-08 21:20:22 |                  3 |
| 2022-05-08 21:20:22 |                  4 |
+---------------------+--------------------+
11 rows in set (0.009 sec)

mysql> SELECT name, edu_year_num, modifying_time AS modtime FROM groups ORDER BY modtime;
+-------+--------------+---------------------+
| name  | edu_year_num | modtime             |
+-------+--------------+---------------------+
| DP1-1 |            1 | 2022-05-08 21:01:10 |
| DP1-2 |            1 | 2022-05-08 21:01:10 |
| A1-1  |            1 | 2022-05-08 21:01:10 |
| DT1-1 |            1 | 2022-05-08 21:01:10 |
| A2-1  |            2 | 2022-05-08 21:14:21 |
| DT2-1 |            2 | 2022-05-08 21:14:21 |
| DP2-2 |            2 | 2022-05-08 21:14:21 |
| DP2-1 |            2 | 2022-05-08 21:14:21 |
| PP1-1 |            1 | 2022-05-08 21:20:22 |
| DP3-1 |            3 | 2022-05-08 21:20:22 |
| DP4-1 |            4 | 2022-05-08 21:20:22 |
+-------+--------------+---------------------+
11 rows in set (0.018 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE eyn = 1;
ERROR 1054 (42S22): Unknown column 'eyn' in 'where clause'
mysql> SELECT name, edu_year_num AS eyn, modifying_time FROM groups WHERE eyn = 1;
ERROR 1054 (42S22): Unknown column 'eyn' in 'where clause'
mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE edu_year_num = 1;
+-------+-----+---------------------+
| name  | eyn | modtime             |
+-------+-----+---------------------+
| DP1-1 |   1 | 2022-05-08 21:01:10 |
| DP1-2 |   1 | 2022-05-08 21:01:10 |
| DT1-1 |   1 | 2022-05-08 21:01:10 |
| A1-1  |   1 | 2022-05-08 21:01:10 |
| PP1-1 |   1 | 2022-05-08 21:20:22 |
+-------+-----+---------------------+
5 rows in set (0.019 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE edu_year_num = 1 AND name = 'A1-1';
+------+-----+---------------------+
| name | eyn | modtime             |
+------+-----+---------------------+
| A1-1 |   1 | 2022-05-08 21:01:10 |
+------+-----+---------------------+
1 row in set (0.015 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE edu_year_num = 1 AND name = 'DP1-1' OR name = 'DP1-2';
+-------+-----+---------------------+
| name  | eyn | modtime             |
+-------+-----+---------------------+
| DP1-1 |   1 | 2022-05-08 21:01:10 |
| DP1-2 |   1 | 2022-05-08 21:01:10 |
+-------+-----+---------------------+
2 rows in set (0.050 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE name = 'DP1-1' OR name = 'DP1-2' AND edu_year_num = 1;
+-------+-----+---------------------+
| name  | eyn | modtime             |
+-------+-----+---------------------+
| DP1-1 |   1 | 2022-05-08 21:01:10 |
| DP1-2 |   1 | 2022-05-08 21:01:10 |
+-------+-----+---------------------+
2 rows in set (0.010 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE edu_year_num = 1 AND name = 'DP2-1' OR name = 'DP1-2';
+-------+-----+---------------------+
| name  | eyn | modtime             |
+-------+-----+---------------------+
| DP1-2 |   1 | 2022-05-08 21:01:10 |
+-------+-----+---------------------+
1 row in set (0.012 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE name = 'DP1-2' OR name = 'DP2-1' AND edu_year_num = 1;
+-------+-----+---------------------+
| name  | eyn | modtime             |
+-------+-----+---------------------+
| DP1-2 |   1 | 2022-05-08 21:01:10 |
+-------+-----+---------------------+
1 row in set (0.010 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE name = 'DP1-2' OR (name = 'DP2-1' AND edu_year_num = 1);
+-------+-----+---------------------+
| name  | eyn | modtime             |
+-------+-----+---------------------+
| DP1-2 |   1 | 2022-05-08 21:01:10 |
+-------+-----+---------------------+
1 row in set (0.009 sec)

mysql> SELECT name, edu_year_num AS eyn, modifying_time AS modtime FROM groups WHERE (edu_year_num = 1 AND name = 'DP2-1') OR name = 'DP1-2';
+-------+-----+---------------------+
| name  | eyn | modtime             |
+-------+-----+---------------------+
| DP1-2 |   1 | 2022-05-08 21:01:10 |
+-------+-----+---------------------+
1 row in set (0.010 sec)

mysql> USE sakila;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT FROM sakila.actor a WHERE a.first_name = 'MORGAN' OR a.first_name = 'SUSAN' AND a.last_name = 'DAVIS';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM sakila.actor a WHERE a.first_name = 'MORGAN' OR a.first_name = 'SUSAN' A...' at line 1

mysql> DESCRIBE actor;
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                 | Null | Key | Default             | Extra                         |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| actor_id    | smallint(5) unsigned | NO   | PRI | NULL                | auto_increment                |
| first_name  | varchar(45)          | NO   |     | NULL                |                               |
| last_name   | varchar(45)          | NO   | MUL | NULL                |                               |
| last_update | timestamp            | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
4 rows in set (0.023 sec)

mysql> SELECT * FROM sakila.actor a WHERE a.first_name = 'MORGAN' OR a.first_name = 'SUSAN' AND a.last_name = 'DAVIS';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|      101 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
|      110 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
|      113 | MORGAN     | HOPKINS   | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS  | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
5 rows in set (0.021 sec)

mysql> SELECT * FROM sakila.actor a WHERE a.first_name = 'MORGAN' AND a.first_name = 'SUSAN' OR a.last_name = 'DAVIS';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        4 | JENNIFER   | DAVIS     | 2006-02-15 04:34:33 |
|      101 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
|      110 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
3 rows in set (0.014 sec)

mysql> SELECT * FROM sakila.actor a WHERE a.first_name = 'MORGAN' OR (a.first_name = 'SUSAN' AND a.last_name = 'DAVIS');
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|      101 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
|      110 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
|      113 | MORGAN     | HOPKINS   | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS  | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
5 rows in set (0.015 sec)

mysql> SELECT * FROM sakila.actor a WHERE (a.first_name = 'MORGAN' AND a.first_name = 'SUSAN') OR a.last_name = 'DAVIS';
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        4 | JENNIFER   | DAVIS     | 2006-02-15 04:34:33 |
|      101 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
|      110 | SUSAN      | DAVIS     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
3 rows in set (0.010 sec)

mysql> EXIT;
