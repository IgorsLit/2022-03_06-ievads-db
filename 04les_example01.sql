DB [(none)]> CREATE DATABASE green_db;
Query OK, 1 row affected (0.009 sec)

DB [(none)]> USE green_db;
Database changed
DB [green_db]> SHOW DATABASES;
+-----------------------------+
| Database                    |
+-----------------------------+
| datatypes                   |
| databasestablescreation     |
| employees                   |
| green_db                    |
| information_schema          |
| mysql                       |
| performance_schema          |
| sakila                      |
+-----------------------------+
8 rows in set (0.008 sec)

DB [green_db]> DROP DATABASE green_db;
Query OK, 0 rows affected (0.440 sec)

DB [(none)]> DROP DATABASE green_db;
ERROR 1008 (HY000): Can't drop database 'green_db'; database doesn't exist
DB [(none)]> DROP DATABASE IF EXISTS green_db;
Query OK, 0 rows affected, 1 warning (0.002 sec)

DB [(none)]> SELECT database();
+------------+
| database() |
+------------+
| NULL       |
+------------+
1 row in set (0.014 sec)

DB [(none)]> USE sakila;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
DB [sakila]> SELECT database();
+------------+
| database() |
+------------+
| sakila     |
+------------+
1 row in set (0.002 sec)

DB [sakila]> USE databasestablescreation;
Database changed
DB [databasestablescreation]> CREATE TABLE IF NOT EXISTS `city` (
    -> `ID` INT(11) NOT NULL AUTO_INCREMENT, 
    -> `Name` CHAR(35) NOT NULL DEFAULT '', 
    -> `CountryCode` CHAR(3) NOT NULL DEFAULT '', 
    -> `Distrct` CHAR(20) NOT NULL DEFAULT '', 
    -> `Info` LONGTEXT CHARACTER SET 'utf8mb4'
    -> COLLATE 'utf8mb4_bin' NULL DEFAULT NULL, 
    -> PRIMARY KEY (`ID`)) 
    -> ENGINE = InnoDB
    -> AUTO_INCREMENT = 4080 
    -> DEFAULT CHARACTER SET = utf8mb4; 
Query OK, 0 rows affected (0.328 sec)

DB [databasestablescreation]> DESCRIBE city;
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   |     |         |                |
| Distrct     | char(20) | NO   |     |         |                |
| Info        | longtext | YES  |     | NULL    |                |
+-------------+----------+------+-----+---------+----------------+
5 rows in set (0.130 sec)

DB [databasestablescreation]> DESCRIBE databasestablescreation.city;
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   |     |         |                |
| Distrct     | char(20) | NO   |     |         |                |
| Info        | longtext | YES  |     | NULL    |                |
+-------------+----------+------+-----+---------+----------------+
5 rows in set (0.017 sec)

DB [databasestablescreation]> CREATE TABLE city_copy SELECT * FROM city;
Query OK, 0 rows affected (0.611 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> INSERT INTO city VALUES (1,'Riga','LVA','1','info');

DB [databasestablescreation]> INSERT INTO city VALUES (2,'smallRiga','USA','','info');
Query OK, 1 row affected (0.072 sec)

DB [databasestablescreation]> INSERT INTO city VALUES (3,'Riga3','LVA','Info',''), (4,'NewYork','USA','2',''), (5,'Limbazi','LVA','3',NULL), (6,'Paris','FRA','4',NULL);
Query OK, 4 rows affected (0.053 sec)
Records: 4  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> SELECT * FROM city;
+----+-----------+-------------+---------+------+
| ID | Name      | CountryCode | Distrct | Info |
+----+-----------+-------------+---------+------+
|  1 | Riga      | LVA         | 1       | info |
|  2 | smallRiga | USA         |         | info |
|  3 | Riga3     | LVA         | Info    |      |
|  4 | NewYork   | USA         | 2       |      |
|  5 | Limbazi   | LVA         | 3       | NULL |
|  6 | Paris     | FRA         | 4       | NULL |
+----+-----------+-------------+---------+------+
6 rows in set (0.090 sec)

DB [databasestablescreation]> INSERT INTO city (Name, CountryCode, Distrct) VALUES ('Riga4','LVA','5'), ('NewYork DownTown','USA','6'), ('Limbazi in Liepaja','LVA','7'), ('Paris in Alaska','USA','4');
Query OK, 4 rows affected (0.049 sec)
Records: 4  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> SELECT * FROM city;
+------+--------------------+-------------+---------+------+
| ID   | Name               | CountryCode | Distrct | Info |
+------+--------------------+-------------+---------+------+
|    1 | Riga               | LVA         | 1       | info |
|    2 | smallRiga          | USA         |         | info |
|    3 | Riga3              | LVA         | Info    |      |
|    4 | NewYork            | USA         | 2       |      |
|    5 | Limbazi            | LVA         | 3       | NULL |
|    6 | Paris              | FRA         | 4       | NULL |
| 4080 | Riga4              | LVA         | 5       | NULL |
| 4081 | NewYork DownTown   | USA         | 6       | NULL |
| 4082 | Limbazi in Liepaja | LVA         | 7       | NULL |
| 4083 | Paris in Alaska    | USA         | 4       | NULL |
+------+--------------------+-------------+---------+------+
10 rows in set (0.010 sec)

DB [databasestablescreation]> CREATE TABLE city_copy2 SELECT * FROM city;
Query OK, 10 rows affected (0.438 sec)
Records: 10  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> ALTER TABLE city_copy2 RENAME TO city_backup;
Query OK, 0 rows affected (0.151 sec)

DB [databasestablescreation]> SHOW TABLES;
+---------------------------------------+
| Tables_in_databasestablescreation     |
+---------------------------------------+
| city                                  |
| city_backup                           |
| city_copy                             |
+---------------------------------------+
3 rows in set (0.015 sec)

DB [databasestablescreation]> DESCRIBE CITY;
ERROR 1146 (42S02): Table 'databasestablescreation.CITY' doesn't exist
DB [databasestablescreation]> DESCRIBE city;
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   |     |         |                |
| Distrct     | char(20) | NO   |     |         |                |
| Info        | longtext | YES  |     | NULL    |                |
+-------------+----------+------+-----+---------+----------------+
5 rows in set (0.017 sec)

DB [databasestablescreation]> ALTER TABLE city CHANGE COLUMN Name city_name CHAR(40);
Query OK, 10 rows affected (0.354 sec)
Records: 10  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE city;
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| city_name   | char(40) | YES  |     | NULL    |                |
| CountryCode | char(3)  | NO   |     |         |                |
| Distrct     | char(20) | NO   |     |         |                |
| Info        | longtext | YES  |     | NULL    |                |
+-------------+----------+------+-----+---------+----------------+
5 rows in set (0.024 sec)

DB [databasestablescreation]> SELECT VERSION();
+---------------------------+
| VERSION()                 |
+---------------------------+
| 10.5.15-DB-0+deb11u1      |
+---------------------------+
1 row in set (0.014 sec)

DB [databasestablescreation]> ALTER TABLE city RENAME COLUMN city_name TO `CityName`;
Query OK, 0 rows affected (0.038 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE city;
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| CityName    | char(40) | YES  |     | NULL    |                |
| CountryCode | char(3)  | NO   |     |         |                |
| Distrct     | char(20) | NO   |     |         |                |
| Info        | longtext | YES  |     | NULL    |                |
+-------------+----------+------+-----+---------+----------------+
5 rows in set (0.022 sec)

DB [databasestablescreation]> ALTER TABLE city MODIFY COLUMN CityName VARCHAR(100);
Query OK, 10 rows affected (0.427 sec)
Records: 10  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE city;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| ID          | int(11)      | NO   | PRI | NULL    | auto_increment |
| CityName    | varchar(100) | YES  |     | NULL    |                |
| CountryCode | char(3)      | NO   |     |         |                |
| Distrct     | char(20)     | NO   |     |         |                |
| Info        | longtext     | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
5 rows in set (0.022 sec)

DB [databasestablescreation]> ALTER TABLE city RENAME COLUMN Distrct TO `District`;
Query OK, 0 rows affected (0.060 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE city;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| ID          | int(11)      | NO   | PRI | NULL    | auto_increment |
| CityName    | varchar(100) | YES  |     | NULL    |                |
| CountryCode | char(3)      | NO   |     |         |                |
| District    | char(20)     | NO   |     |         |                |
| Info        | longtext     | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
5 rows in set (0.032 sec)

DB [databasestablescreation]> ALTER TABLE city ADD COLUMN (country_name VARCHAR(45));
Query OK, 0 rows affected (0.163 sec)
Records: 0  Duplicates: 0  Warnings: 0

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
6 rows in set (0.036 sec)

DB [databasestablescreation]> EXIT;
