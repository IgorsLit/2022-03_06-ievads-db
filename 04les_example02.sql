DB [databasestablescreation]> DESCRIBE city;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| ID           | int(11)      | NO   | PRI | NULL    | auto_increment |
| CityName     | varchar(100) | YES  |     | NULL    |                |
| CountryCode  | char(3)      | NO   |     |         |                |
| District     | char(20)     | NO   |     |         |                |
| Info         | longtext     | YES  |     | NULL    |                |
| country_name | varchar(45)  | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
6 rows in set (0.060 sec)

DB [databasestablescreation]> SHOW TABLES;
+---------------------------------------+
| Tables_in_databasestablescreation     |
+---------------------------------------+
| city                                  |
| city_backup                           |
| city_copy                             |
+---------------------------------------+
3 rows in set (0.003 sec)

DB [databasestablescreation]> CREATE TABLE IF NOT EXISTS city2 (
    -> city_id SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT, 
    -> city VARCHAR(50) NOT NULL DEFAULT '', 
    -> country_id SMALLINT(3) UNSIGNED NOT NULL, 
    -> last_update TIMESTAMP, PRIMARY KEY (city_id));
Query OK, 0 rows affected (0.422 sec)

DB [databasestablescreation]> INSERT INTO city2 (city, country_id) VALUES ('Valmiera', 1), ('Liepaja', 1), ('Riga', 1), ('Tallina', 2), ('Rokishkas', 3);
Query OK, 5 rows affected (0.133 sec)
Records: 5  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> SELECT * FROM city2 AS new_city;
+---------+-----------+------------+---------------------+
| city_id | city      | country_id | last_update         |
+---------+-----------+------------+---------------------+
|       1 | Valmiera  |          1 | 2022-05-04 12:24:03 |
|       2 | Liepaja   |          1 | 2022-05-04 12:24:03 |
|       3 | Riga      |          1 | 2022-05-04 12:24:03 |
|       4 | Tallina   |          2 | 2022-05-04 12:24:03 |
|       5 | Rokishkas |          3 | 2022-05-04 12:24:03 |
+---------+-----------+------------+---------------------+
5 rows in set (0.027 sec)

DB [databasestablescreation]> INSERT INTO city2 (city, country_id) VALUES ('Viljnja', 3);
Query OK, 1 row affected (0.014 sec)

DB [databasestablescreation]> SELECT * FROM city2;
+---------+-----------+------------+---------------------+
| city_id | city      | country_id | last_update         |
+---------+-----------+------------+---------------------+
|       1 | Valmiera  |          1 | 2022-05-04 12:24:03 |
|       2 | Liepaja   |          1 | 2022-05-04 12:24:03 |
|       3 | Riga      |          1 | 2022-05-04 12:24:03 |
|       4 | Tallina   |          2 | 2022-05-04 12:24:03 |
|       5 | Rokishkas |          3 | 2022-05-04 12:24:03 |
|       6 | Viljnja   |          3 | 2022-05-04 12:26:42 |
+---------+-----------+------------+---------------------+
6 rows in set (0.009 sec)

DB [databasestablescreation]> ALTER TABLE city2 RENAME cities2;
Query OK, 0 rows affected (0.107 sec)

DB [databasestablescreation]> SHOW TABLES;
+---------------------------------------+
| Tables_in_databasestablescreation     |
+---------------------------------------+
| cities2                               |
| city                                  |
| city_backup                           |
| city_copy                             |
+---------------------------------------+
4 rows in set (0.005 sec)

DB [databasestablescreation]> CREATE TABLE IF NOT EXISTS countries (
    -> country_id TINYINT(2) UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    -> name VARCHAR(25) NOT NULL DEFAULT '');
Query OK, 0 rows affected (0.202 sec)

DB [databasestablescreation]> ALTER TABLE countries RENAME countries2;
Query OK, 0 rows affected (0.087 sec)

DB [databasestablescreation]> INSERT INTO countries2 (name) VALUES ('Latvija'), ('Igaunija'), ('Lietuva'), ('Vacija'), ('Shveice'), ('Zviedrija');
Query OK, 6 rows affected (0.066 sec)
Records: 6  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> SELECT * FROM countries2;
+------------+-----------+
| country_id | name      |
+------------+-----------+
|          1 | Latvija   |
|          2 | Igaunija  |
|          3 | Lietuva   |
|          4 | Vacija    |
|          5 | Shveice   |
|          6 | Zviedrija |
+------------+-----------+
6 rows in set (0.008 sec)

DB [databasestablescreation]> SELECT * FROM cities2;
+---------+-----------+------------+---------------------+
| city_id | city      | country_id | last_update         |
+---------+-----------+------------+---------------------+
|       1 | Valmiera  |          1 | 2022-05-04 12:24:03 |
|       2 | Liepaja   |          1 | 2022-05-04 12:24:03 |
|       3 | Riga      |          1 | 2022-05-04 12:24:03 |
|       4 | Tallina   |          2 | 2022-05-04 12:24:03 |
|       5 | Rokishkas |          3 | 2022-05-04 12:24:03 |
|       6 | Viljnja   |          3 | 2022-05-04 12:26:42 |
+---------+-----------+------------+---------------------+
6 rows in set (0.019 sec)

DB [databasestablescreation]> CREATE TABLE cities2_copy SELECT * FROM cities2;
Query OK, 6 rows affected (0.232 sec)
Records: 6  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> SELECT * FROM cities2_copy;
+---------+-----------+------------+---------------------+
| city_id | city      | country_id | last_update         |
+---------+-----------+------------+---------------------+
|       1 | Valmiera  |          1 | 2022-05-04 12:24:03 |
|       2 | Liepaja   |          1 | 2022-05-04 12:24:03 |
|       3 | Riga      |          1 | 2022-05-04 12:24:03 |
|       4 | Tallina   |          2 | 2022-05-04 12:24:03 |
|       5 | Rokishkas |          3 | 2022-05-04 12:24:03 |
|       6 | Viljnja   |          3 | 2022-05-04 12:26:42 |
+---------+-----------+------------+---------------------+
6 rows in set (0.011 sec)

DB [databasestablescreation]> SHOW INDEX FROM cities2_copy;
Empty set (0.042 sec)

DB [databasestablescreation]> SHOW INDEX FROM cities2;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| cities2 |          0 | PRIMARY  |            1 | city_id     | A         |           5 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
1 row in set (0.010 sec)

DB [databasestablescreation]> DESCRIBE cities2_copy;
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                 | Null | Key | Default             | Extra                         |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| city_id     | smallint(3) unsigned | NO   |     | 0                   |                               |
| city        | varchar(50)          | NO   |     |                     |                               |
| country_id  | smallint(3) unsigned | NO   |     | NULL                |                               |
| last_update | timestamp            | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
4 rows in set (0.138 sec)

DB [databasestablescreation]> ALTER TABLE cities2_copy DROP COLUMN city_id;
Query OK, 0 rows affected (0.397 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE cities2_copy;
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                 | Null | Key | Default             | Extra                         |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| city        | varchar(50)          | NO   |     |                     |                               |
| country_id  | smallint(3) unsigned | NO   |     | NULL                |                               |
| last_update | timestamp            | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
3 rows in set (0.043 sec)

DB [databasestablescreation]> EXIT;
