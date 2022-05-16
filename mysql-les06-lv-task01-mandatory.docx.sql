mysql> source /home/user/dir1/source_file.sql
Query OK, 0 rows affected (0.002 sec)

Query OK, 0 rows affected (0.001 sec)

Query OK, 0 rows affected (0.001 sec)

Query OK, 0 rows affected, 1 warning (0.003 sec)

Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
Query OK, 0 rows affected (0.123 sec)

Query OK, 0 rows affected (0.127 sec)
Records: 0  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0.219 sec)

Query OK, 0 rows affected (0.250 sec)
Records: 0  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0.127 sec)

Query OK, 0 rows affected (0.010 sec)

Query OK, 0 rows affected (0.013 sec)

Query OK, 0 rows affected (0.001 sec)

mysql> SHOW TABLES;
+---------------------------------------+
| Tables_in_maintain                    |
+---------------------------------------+
| edu_groups6                           |
| employees_copy                        |
| levels61                              |
| students6                             |
| tasks61                               |
| tests61                               |
+---------------------------------------+
6 rows in set (0.004 sec)

mysql> DESCRIBE tests61;
+----------------+---------------------+------+-----+------------------------+-------------------------------+
| Field          | Type                | Null | Key | Default                | Extra                         |
+----------------+---------------------+------+-----+------------------------+-------------------------------+
| id             | tinyint(3) unsigned | NO   | PRI | NULL                   | auto_increment                |
| name           | varchar(25)         | NO   | UNI | Kontroldarba nosaukums |                               |
| theme          | varchar(55)         | NO   |     | Teema                  |                               |
| modifying_time | timestamp           | NO   |     | current_timestamp()    | on update current_timestamp() |
+----------------+---------------------+------+-----+------------------------+-------------------------------+
4 rows in set (0.042 sec)

mysql> INSERT INTO tests61 (name, theme) VALUES('1. kontroldarbs', 'Mainiigie');
Query OK, 1 row affected (0.026 sec)

mysql> INSERT INTO tests61 (name, theme) VALUES ('2. kontroldarbs', 'Ievade, izvade');
Query OK, 1 row affected (0.024 sec)

mysql> SELECT * FROM tests61;
+----+-----------------+----------------+---------------------+
| id | name            | theme          | modifying_time      |
+----+-----------------+----------------+---------------------+
|  1 | 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 |
|  2 | 2. kontroldarbs | Ievade, izvade | 2022-05-14 13:55:07 |
+----+-----------------+----------------+---------------------+
2 rows in set (2.523 sec)

mysql> INSERT INTO tasks61 (theme, type, task_text) VALUES('Mainigie', 'Daudzizveellu', 'Izvelies mainigu tipus'), ('Mainigie', 'Daudzizveellu', 'Kas ir integer?'), ('Mainigie', 'Daudzizveellu', 'Kas ir float?'), ('Ievade, izvade', 'Garais teksts', 'Pieraksti programmas kodu, kura jaievdada divus veselus skaitlus.' ), ('Ievade, izvade','Garais teksts', 'Kas ir ievade?'), ('Ievade, izvade', 'Daudzdzizveellu', 'Izvelies kas ir izvade?');
ERROR 1406 (22001): Data too long for column 'task_text' at row 4

mysql> DESCRIBE levels61;
+----------+---------------------+------+-----+---------+----------------+
| Field    | Type                | Null | Key | Default | Extra          |
+----------+---------------------+------+-----+---------+----------------+
| id       | tinyint(4)          | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20)         | NO   |     | NULL    |                |
| tasks_id | tinyint(3) unsigned | YES  | MUL | NULL    |                |
+----------+---------------------+------+-----+---------+----------------+
3 rows in set (0.074 sec)

mysql> ALTER TABLE levels61 RENAME COLUMN tasks_id TO tests_id;
Query OK, 0 rows affected (0.079 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE levels61;
+----------+---------------------+------+-----+---------+----------------+
| Field    | Type                | Null | Key | Default | Extra          |
+----------+---------------------+------+-----+---------+----------------+
| id       | tinyint(4)          | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20)         | NO   |     | NULL    |                |
| tests_id | tinyint(3) unsigned | YES  | MUL | NULL    |                |
+----------+---------------------+------+-----+---------+----------------+
3 rows in set (0.032 sec)

mysql> SHOW INDEX FROM levels61;
+----------+------------+--------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table    | Non_unique | Key_name                 | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+----------+------------+--------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| levels61 |          0 | PRIMARY                  |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| levels61 |          1 | fk_level6_in_tests61_idx |            1 | tests_id    | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+----------+------------+--------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.023 sec)

mysql> ALTER TABLE tasks61 ADD COLUMN levels_id TINYINT NOT NULL DEFAULT 1;
Query OK, 0 rows affected (0.068 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE tasks61;
+-----------+-------------+------+-----+--------------------------------+----------------+
| Field     | Type        | Null | Key | Default                        | Extra          |
+-----------+-------------+------+-----+--------------------------------+----------------+
| id        | tinyint(4)  | NO   | PRI | NULL                           | auto_increment |
| theme     | varchar(50) | NO   |     | NULL                           |                |
| type      | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| task_text | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| levels_id | tinyint(4)  | NO   |     | 1                              |                |
+-----------+-------------+------+-----+--------------------------------+----------------+
5 rows in set (0.030 sec)

mysql> ALTER TABLE tasks61 MODIFY COLUMN task_text VARCHAR(70);
Query OK, 0 rows affected (0.269 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE tasks61 ADD COLUMN describe_of_task VARCHAR(3) NOT NULL DEFAULT 123;
Query OK, 0 rows affected (0.058 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SOURCE /home/user/dir1/source_data.sql
Query OK, 6 rows affected (0.059 sec)
Records: 6  Duplicates: 0  Warnings: 0

ERROR 1054 (42S22): Unknown column 'tasks_id' in 'field list'
mysql> SHOW ERRORS;
+-------+------+-------------------------------------------+
| Level | Code | Message                                   |
+-------+------+-------------------------------------------+
| Error | 1054 | Unknown column 'tasks_id' in 'field list' |
+-------+------+-------------------------------------------+
1 row in set (0.001 sec)

mysql> SOURCE /home/user/dir1/source_data2.sql
Query OK, 4 rows affected (0.140 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM tests61;
+----+-----------------+----------------+---------------------+
| id | name            | theme          | modifying_time      |
+----+-----------------+----------------+---------------------+
|  1 | 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 |
|  2 | 2. kontroldarbs | Ievade, izvade | 2022-05-14 13:55:07 |
+----+-----------------+----------------+---------------------+
2 rows in set (0.026 sec)

mysql> SELECT * FROM levels61;
+----+------------+----------+
| id | name       | tests_id |
+----+------------+----------+
|  1 | Videjais   |        1 |
|  2 | Optimalais |        1 |
|  3 | Augstakais |        1 |
|  4 | Videjais   |        2 |
+----+------------+----------+
4 rows in set (0.006 sec)

mysql> SELECT * FROM tasks61;
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+------------------+
| id | theme          | type            | task_text                                                         | levels_id | describe_of_task |
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+------------------+
|  4 | Mainigie       | Daudzizveellu   | Izvelies mainigu tipus                                            |         1 | 123              |
|  5 | Mainigie       | Daudzizveellu   | Kas ir integer?                                                   |         1 | 123              |
|  6 | Mainigie       | Daudzizveellu   | Kas ir float?                                                     |         1 | 123              |
|  7 | Ievade, izvade | Garais teksts   | Pieraksti programmas kodu, kura jaievdada divus veselus skaitlus. |         1 | 123              |
|  8 | Ievade, izvade | Garais teksts   | Kas ir ievade?                                                    |         1 | 123              |
|  9 | Ievade, izvade | Daudzdzizveellu | Izvelies kas ir izvade?                                           |         1 | 123              |
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+------------------+
6 rows in set (0.005 sec)

mysql> ALTER TABLE tasks61 ADD COLUMN (describe_of_task2 VARCHAR(4) NOT NULL DEFAULT 0000);
Query OK, 0 rows affected (0.059 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE tasks61;
+-------------------+-------------+------+-----+--------------------------------+----------------+
| Field             | Type        | Null | Key | Default                        | Extra          |
+-------------------+-------------+------+-----+--------------------------------+----------------+
| id                | tinyint(4)  | NO   | PRI | NULL                           | auto_increment |
| theme             | varchar(50) | NO   |     | NULL                           |                |
| type              | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| task_text         | varchar(70) | YES  |     | NULL                           |                |
| levels_id         | tinyint(4)  | NO   |     | 1                              |                |
| describe_of_task  | varchar(3)  | NO   |     | 123                            |                |
| describe_of_task2 | varchar(4)  | NO   |     | 0                              |                |
+-------------------+-------------+------+-----+--------------------------------+----------------+
7 rows in set (0.031 sec)

mysql> ALTER TABLE tasks61 MODIFY COLUMN describe_of_task2 VARCHAR(4) NOT NULL DEFAULT '0000';
Query OK, 0 rows affected (0.018 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE tasks61;
+-------------------+-------------+------+-----+--------------------------------+----------------+
| Field             | Type        | Null | Key | Default                        | Extra          |
+-------------------+-------------+------+-----+--------------------------------+----------------+
| id                | tinyint(4)  | NO   | PRI | NULL                           | auto_increment |
| theme             | varchar(50) | NO   |     | NULL                           |                |
| type              | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| task_text         | varchar(70) | YES  |     | NULL                           |                |
| levels_id         | tinyint(4)  | NO   |     | 1                              |                |
| describe_of_task  | varchar(3)  | NO   |     | 123                            |                |
| describe_of_task2 | varchar(4)  | NO   |     | 0000                           |                |
+-------------------+-------------+------+-----+--------------------------------+----------------+
7 rows in set (0.029 sec)

mysql> SELECT * FROM tasks61;
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+------------------+-------------------+
| id | theme          | type            | task_text                                                         | levels_id | describe_of_task | describe_of_task2 |
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+------------------+-------------------+
|  4 | Mainigie       | Daudzizveellu   | Izvelies mainigu tipus                                            |         1 | 123              | 0                 |
|  5 | Mainigie       | Daudzizveellu   | Kas ir integer?                                                   |         1 | 123              | 0                 |
|  6 | Mainigie       | Daudzizveellu   | Kas ir float?                                                     |         1 | 123              | 0                 |
|  7 | Ievade, izvade | Garais teksts   | Pieraksti programmas kodu, kura jaievdada divus veselus skaitlus. |         1 | 123              | 0                 |
|  8 | Ievade, izvade | Garais teksts   | Kas ir ievade?                                                    |         1 | 123              | 0                 |
|  9 | Ievade, izvade | Daudzdzizveellu | Izvelies kas ir izvade?                                           |         1 | 123              | 0                 |
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+------------------+-------------------+
6 rows in set (0.009 sec)

mysql> DESCRIBE tasks61;
+-------------------+-------------+------+-----+--------------------------------+----------------+
| Field             | Type        | Null | Key | Default                        | Extra          |
+-------------------+-------------+------+-----+--------------------------------+----------------+
| id                | tinyint(4)  | NO   | PRI | NULL                           | auto_increment |
| theme             | varchar(50) | NO   |     | NULL                           |                |
| type              | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| task_text         | varchar(70) | YES  |     | NULL                           |                |
| levels_id         | tinyint(4)  | NO   |     | 1                              |                |
| describe_of_task  | varchar(3)  | NO   |     | 123                            |                |
| describe_of_task2 | varchar(4)  | NO   |     | 0000                           |                |
+-------------------+-------------+------+-----+--------------------------------+----------------+
7 rows in set (0.030 sec)

mysql> ALTER TABLE tasks61 DROP COLUMN describe_of_task;
Query OK, 0 rows affected (0.080 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE tasks61;
+-------------------+-------------+------+-----+--------------------------------+----------------+
| Field             | Type        | Null | Key | Default                        | Extra          |
+-------------------+-------------+------+-----+--------------------------------+----------------+
| id                | tinyint(4)  | NO   | PRI | NULL                           | auto_increment |
| theme             | varchar(50) | NO   |     | NULL                           |                |
| type              | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| task_text         | varchar(70) | YES  |     | NULL                           |                |
| levels_id         | tinyint(4)  | NO   |     | 1                              |                |
| describe_of_task2 | varchar(4)  | NO   |     | 0000                           |                |
+-------------------+-------------+------+-----+--------------------------------+----------------+
6 rows in set (0.033 sec)

mysql> ALTER TABLE tasks61 DROP COLUMN describe_of_task2;
Query OK, 0 rows affected (0.064 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE tasks61;
+-----------+-------------+------+-----+--------------------------------+----------------+
| Field     | Type        | Null | Key | Default                        | Extra          |
+-----------+-------------+------+-----+--------------------------------+----------------+
| id        | tinyint(4)  | NO   | PRI | NULL                           | auto_increment |
| theme     | varchar(50) | NO   |     | NULL                           |                |
| type      | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| task_text | varchar(70) | YES  |     | NULL                           |                |
| levels_id | tinyint(4)  | NO   |     | 1                              |                |
+-----------+-------------+------+-----+--------------------------------+----------------+
5 rows in set (0.028 sec)

mysql> CREATE TABLE levels61_copy AS SELECT id, name FROM levels61;
Query OK, 4 rows affected (0.662 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> DESCRIBE levels61_copy;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | tinyint(4)  | NO   |     | 0       |       |
| name  | varchar(20) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.064 sec)

mysql> DESCRIBE levels61;
+----------+---------------------+------+-----+---------+----------------+
| Field    | Type                | Null | Key | Default | Extra          |
+----------+---------------------+------+-----+---------+----------------+
| id       | tinyint(4)          | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20)         | NO   |     | NULL    |                |
| tests_id | tinyint(3) unsigned | YES  | MUL | NULL    |                |
+----------+---------------------+------+-----+---------+----------------+
3 rows in set (0.017 sec)

mysql> ALTER TABLE levels61_copy ADD COLUMN (tests_id TINYINT NOT NULL DEFAULT 1);
Query OK, 0 rows affected (0.162 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE levels61_copy MODIFY COLUMN id TINYINT PRIMARY KEY AUTO_INCREMENT;
Query OK, 4 rows affected (0.448 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> DESCRIBE levels61_copy;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | tinyint(4)  | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20) | NO   |     | NULL    |                |
| tests_id | tinyint(4)  | NO   |     | 1       |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.020 sec)

mysql> CREATE INDEX tests_id_idx ON levels61_copy(tests_id);
Query OK, 0 rows affected (0.342 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE levels61_copy;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | tinyint(4)  | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20) | NO   |     | NULL    |                |
| tests_id | tinyint(4)  | NO   | MUL | 1       |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.075 sec)

mysql> CREATE UNIQUE INDEX tests_id_UNIQUE_idx ON levels61_copy(tests_id DESC);
ERROR 1062 (23000): Duplicate entry '1' for key 'tests_id_UNIQUE_idx'
mysql> ALTER TABLE levels61_copy DROP INDEX tests_id_idx;
Query OK, 0 rows affected (0.101 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE levels61_copy;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | tinyint(4)  | NO   | PRI | NULL    | auto_increment |
| name     | varchar(20) | NO   |     | NULL    |                |
| tests_id | tinyint(4)  | NO   |     | 1       |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.020 sec)

mysql> CREATE INDEX tests_id_idx ON levels61_copy(tests_id);
Query OK, 0 rows affected (0.141 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT tests_id FROM levels61_copy;
+----------+
| tests_id |
+----------+
|        1 |
|        1 |
|        1 |
|        1 |
+----------+
4 rows in set (0.019 sec)

mysql> UPDATE levels61_copy SET tests_id = 2 WHERE id = 2;
Query OK, 1 row affected (0.059 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE levels61_copy SET tests_id = 3 WHERE id = 3;
Query OK, 1 row affected (0.024 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE levels61_copy SET tests_id = 4 WHERE id = 4;
Query OK, 1 row affected (0.026 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT tests_id FROM levels61_copy;
+----------+
| tests_id |
+----------+
|        1 |
|        2 |
|        3 |
|        4 |
+----------+
4 rows in set (0.007 sec)

mysql> CREATE UNIQUE INDEX tests_id_UNIQUE_idx ON levels61_copy(tests_id DESC);
Query OK, 0 rows affected (0.103 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT tests_id FROM levels61_copy;
+----------+
| tests_id |
+----------+
|        1 |
|        2 |
|        3 |
|        4 |
+----------+
4 rows in set (0.016 sec)

mysql> SELECT * FROM levels61_copy;
+----+------------+----------+
| id | name       | tests_id |
+----+------------+----------+
|  1 | Videjais   |        1 |
|  2 | Optimalais |        2 |
|  3 | Augstakais |        3 |
|  4 | Videjais   |        4 |
+----+------------+----------+
4 rows in set (0.006 sec)

mysql> SHOW INDEX FROM levels61_copy;
+---------------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table         | Non_unique | Key_name            | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| levels61_copy |          0 | PRIMARY             |            1 | id          | A         |           4 |     NULL | NULL   |      | BTREE      |         |               |
| levels61_copy |          0 | tests_id_UNIQUE_idx |            1 | tests_id    | A         |           4 |     NULL | NULL   |      | BTREE      |         |               |
| levels61_copy |          1 | tests_id_idx        |            1 | tests_id    | A         |           4 |     NULL | NULL   |      | BTREE      |         |               |
+---------------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
3 rows in set (0.006 sec)

mysql> -- tasks table
mysql> DESCRIBE tasks61;
+-----------+-------------+------+-----+--------------------------------+----------------+
| Field     | Type        | Null | Key | Default                        | Extra          |
+-----------+-------------+------+-----+--------------------------------+----------------+
| id        | tinyint(4)  | NO   | PRI | NULL                           | auto_increment |
| theme     | varchar(50) | NO   |     | NULL                           |                |
| type      | varchar(30) | NO   |     | Daudzizveellu(Multiple choise) |                |
| task_text | varchar(70) | YES  |     | NULL                           |                |
| levels_id | tinyint(4)  | NO   |     | 1                              |                |
+-----------+-------------+------+-----+--------------------------------+----------------+
5 rows in set (0.017 sec)

mysql> SELECT * FROM tasks61;
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+
| id | theme          | type            | task_text                                                         | levels_id |
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+
|  4 | Mainigie       | Daudzizveellu   | Izvelies mainigu tipus                                            |         1 |
|  5 | Mainigie       | Daudzizveellu   | Kas ir integer?                                                   |         1 |
|  6 | Mainigie       | Daudzizveellu   | Kas ir float?                                                     |         1 |
|  7 | Ievade, izvade | Garais teksts   | Pieraksti programmas kodu, kura jaievdada divus veselus skaitlus. |         1 |
|  8 | Ievade, izvade | Garais teksts   | Kas ir ievade?                                                    |         1 |
|  9 | Ievade, izvade | Daudzdzizveellu | Izvelies kas ir izvade?                                           |         1 |
+----+----------------+-----------------+-------------------------------------------------------------------+-----------+
6 rows in set (0.010 sec)

mysql> ALTER TABLE tasks61 ADD CONSTRAINT fk_levels_in_tasks61 FOREIGN KEY (levels_id) REFERENCES levels61(id);
Query OK, 6 rows affected (0.496 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> UPDATE tasks61 SET levels_id = 4 WHERE id = 7;
Query OK, 1 row affected (0.037 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE tasks61 SET levels_id = 4 WHERE id = 8;
Query OK, 1 row affected (0.021 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE tasks61 SET levels_id = 4 WHERE id = 9;
Query OK, 1 row affected (0.015 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE tasks61 SET levels_id = 2 WHERE id = 6;
Query OK, 1 row affected (0.030 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT tst.id, tst.name, tst.theme, tst.modifying_time, lvs.id, lvs.name, lvs.tests_id FROM tests61 AS tst INNER JOIN levels61 AS lvs ON tst.id = lvs.tests_id;
+----+-----------------+----------------+---------------------+----+------------+----------+
| id | name            | theme          | modifying_time      | id | name       | tests_id |
+----+-----------------+----------------+---------------------+----+------------+----------+
|  1 | 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 |  1 | Videjais   |        1 |
|  1 | 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 |  2 | Optimalais |        1 |
|  1 | 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 |  3 | Augstakais |        1 |
|  2 | 2. kontroldarbs | Ievade, izvade | 2022-05-14 13:55:07 |  4 | Videjais   |        2 |
+----+-----------------+----------------+---------------------+----+------------+----------+
4 rows in set (0.049 sec)

mysql> SELECT tst.name, tst.theme, tst.modifying_time, lvs.name, tsk.task_text, tsk.levels_id FROM ((tests61 AS tst INNER JOIN levels61 AS lvs ON tst.id = lvs.tests_id) INNER JOIN tasks61 AS tsk ON lvs.id = tsk.levels_id);
+-----------------+----------------+---------------------+------------+-------------------------------------------------------------------+-----------+
| name            | theme          | modifying_time      | name       | task_text                                                         | levels_id |
+-----------------+----------------+---------------------+------------+-------------------------------------------------------------------+-----------+
| 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 | Videjais   | Izvelies mainigu tipus                                            |         1 |
| 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 | Videjais   | Kas ir integer?                                                   |         1 |
| 1. kontroldarbs | Mainiigie      | 2022-05-14 13:53:39 | Optimalais | Kas ir float?                                                     |         2 |
| 2. kontroldarbs | Ievade, izvade | 2022-05-14 13:55:07 | Videjais   | Pieraksti programmas kodu, kura jaievdada divus veselus skaitlus. |         4 |
| 2. kontroldarbs | Ievade, izvade | 2022-05-14 13:55:07 | Videjais   | Kas ir ievade?                                                    |         4 |
| 2. kontroldarbs | Ievade, izvade | 2022-05-14 13:55:07 | Videjais   | Izvelies kas ir izvade?                                           |         4 |
+-----------------+----------------+---------------------+------------+-------------------------------------------------------------------+-----------+
6 rows in set (0.013 sec)

