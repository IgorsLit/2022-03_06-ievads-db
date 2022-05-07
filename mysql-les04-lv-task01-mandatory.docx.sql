DB [(none)]> source /home/user/dir1/mysql-les04-lv-task01-mandatory_Query1.sql
Query OK, 0 rows affected (0.034 sec)

Query OK, 0 rows affected (0.001 sec)

Query OK, 0 rows affected (0.002 sec)

Query OK, 1 row affected (0.095 sec)

Database changed
Query OK, 0 rows affected (0.371 sec)

Query OK, 0 rows affected (0.118 sec)
Records: 0  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0.149 sec)

Query OK, 0 rows affected (0.184 sec)
Records: 0  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0.002 sec)

Query OK, 0 rows affected (0.002 sec)

Query OK, 0 rows affected (0.002 sec)

DB [edu_db]> DESCRIBE groups;
+-------+---------------------+------+-----+---------+----------------+
| Field | Type                | Null | Key | Default | Extra          |
+-------+---------------------+------+-----+---------+----------------+
| id    | tinyint(1) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(10)         | YES  | UNI | NULL    |                |
+-------+---------------------+------+-----+---------+----------------+
2 rows in set (0.087 sec)

DB [edu_db]> INSERT INTO groups (name) VALUES('DP1-1'), ('DP1-2'), ('DP2-1'), ('DP2-2'), ('DT1-1'), ('DT2-1'), ('A1-1'), ('A2-1');
Query OK, 8 rows affected (0.092 sec)
Records: 8  Duplicates: 0  Warnings: 0

DB [edu_db]> DESCRIBE students;
+-----------+---------------------+------+-----+---------+----------------+
| Field     | Type                | Null | Key | Default | Extra          |
+-----------+---------------------+------+-----+---------+----------------+
| id        | tinyint(1)          | NO   | PRI | NULL    | auto_increment |
| firstname | varchar(20)         | NO   |     | NULL    |                |
| lastname  | varchar(20)         | NO   |     | NULL    |                |
| group_id  | tinyint(3) unsigned | NO   | MUL | NULL    |                |
+-----------+---------------------+------+-----+---------+----------------+
4 rows in set (0.021 sec)

DB [edu_db]> INSERT INTO students (firstname, lastname, group_id) VALUES('Andrejs', 'Abolins', 1), ('Peteris', 'Ozols', 1), ('Liene', 'Smita', 1), ('Antons', 'Avotins', 2), ('Janis','Berzs', 2), ('Peteris', 'Berzins', 2), ('Uldis', 'Ivanovs', 2), ('Andrejs', 'Berzins', 3), ('Antra','Liepina', 3);
Query OK, 9 rows affected (0.097 sec)
Records: 9  Duplicates: 0  Warnings: 0

DB [edu_db]> INSERT INTO students (firstname, lastname, group_id) VALUES('Oskars', 'Berzins', 4), ('Ilvars','Liepins', 5);
Query OK, 2 rows affected (0.017 sec)
Records: 2  Duplicates: 0  Warnings: 0

DB [edu_db]> SELECT * FROM students WHERE group_id=1;
+----+-----------+----------+----------+
| id | firstname | lastname | group_id |
+----+-----------+----------+----------+
|  1 | Andrejs   | Abolins  |        1 |
|  2 | Peteris   | Ozols    |        1 |
|  3 | Liene     | Smita    |        1 |
+----+-----------+----------+----------+
3 rows in set (0.162 sec)

DB [edu_db]> SELECT std.lastname, grp.name FROM students AS std INNER JOIN groups AS grp ON std.group_id = grp.group_id;
ERROR 1054 (42S22): Unknown column 'grp.group_id' in 'on clause'

DB [edu_db]> SELECT std.firstname, std.lastname, std.group_id, grp.name FROM students AS std INNER JOIN groups AS grp ON std.group_id = 1;
+-----------+----------+----------+-------+
| firstname | lastname | group_id | name  |
+-----------+----------+----------+-------+
| Andrejs   | Abolins  |        1 | A1-1  |
| Peteris   | Ozols    |        1 | A1-1  |
| Liene     | Smita    |        1 | A1-1  |
| Andrejs   | Abolins  |        1 | A2-1  |
| Peteris   | Ozols    |        1 | A2-1  |
| Liene     | Smita    |        1 | A2-1  |
| Andrejs   | Abolins  |        1 | DP1-1 |
| Peteris   | Ozols    |        1 | DP1-1 |
| Liene     | Smita    |        1 | DP1-1 |
| Andrejs   | Abolins  |        1 | DP1-2 |
| Peteris   | Ozols    |        1 | DP1-2 |
| Liene     | Smita    |        1 | DP1-2 |
| Andrejs   | Abolins  |        1 | DP2-1 |
| Peteris   | Ozols    |        1 | DP2-1 |
| Liene     | Smita    |        1 | DP2-1 |
| Andrejs   | Abolins  |        1 | DP2-2 |
| Peteris   | Ozols    |        1 | DP2-2 |
| Liene     | Smita    |        1 | DP2-2 |
| Andrejs   | Abolins  |        1 | DT1-1 |
| Peteris   | Ozols    |        1 | DT1-1 |
| Liene     | Smita    |        1 | DT1-1 |
| Andrejs   | Abolins  |        1 | DT2-1 |
| Peteris   | Ozols    |        1 | DT2-1 |
| Liene     | Smita    |        1 | DT2-1 |
+-----------+----------+----------+-------+
24 rows in set (0.014 sec)

DB [edu_db]> EXIT;
