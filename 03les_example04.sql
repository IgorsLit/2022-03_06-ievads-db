--Date, TIme, Timestamp, Char, Varchar, Json

DB [datatypes]> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2022-04-23 |
+------------+
1 row in set (0.025 sec)

DB [datatypes]> SELECT DATE('2017-01-31 12:01:00');
+-----------------------------+
| DATE('2017-01-31 12:01:00') |
+-----------------------------+
| 2017-01-31                  |
+-----------------------------+
1 row in set (0.023 sec)

DB [datatypes]> SELECT ADDDATE('2022-04-23', 8);
+--------------------------+
| ADDDATE('2022-04-23', 8) |
+--------------------------+
| 2022-05-01               |
+--------------------------+
1 row in set (0.031 sec)

DB [datatypes]> 
DB [datatypes]> CREATE TABLE Dates(Id TINYINT, Dates DATE);
Query OK, 0 rows affected (0.129 sec)

DB [datatypes]> INSERT INTO Dates VALUES(1, '2022-03-24');
Query OK, 1 row affected (0.032 sec)

DB [datatypes]> INSERT INTO Dates VALUES(2, '2022/03/25');
Query OK, 1 row affected (0.012 sec)

DB [datatypes]> INSERT INTO Dates VALUES(3, '20220326');
Query OK, 1 row affected (0.013 sec)

DB [datatypes]> INSERT INTO Dates VALUES(4, '220327');
Query OK, 1 row affected (0.013 sec)

DB [datatypes]> INSERT INTO Dates VALUES(5, '2022+03+28');
Query OK, 1 row affected (0.013 sec)

DB [datatypes]> SELECT * FROM Dates;
+------+------------+
| Id   | Dates      |
+------+------------+
|    1 | 2022-03-24 |
|    2 | 2022-03-25 |
|    3 | 2022-03-26 |
|    4 | 2022-03-27 |
|    5 | 2022-03-28 |
+------+------------+
5 rows in set (0.018 sec)

DB [datatypes]> 
DB [datatypes]> 
DB [datatypes]> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 17:07:20  |
+-----------+
1 row in set (0.004 sec)

DB [datatypes]> SELECT TIMEDIFF('23:34:32', '22:00:00');
+----------------------------------+
| TIMEDIFF('23:34:32', '22:00:00') |
+----------------------------------+
| 01:34:32                         |
+----------------------------------+
1 row in set (0.011 sec)

DB [datatypes]> SELECT TIME('2022-03-31 11:06:43');
+-----------------------------+
| TIME('2022-03-31 11:06:43') |
+-----------------------------+
| 11:06:43                    |
+-----------------------------+
1 row in set (0.002 sec)

DB [datatypes]> SELECT TIMEDIFF('211344', '201123');
+------------------------------+
| TIMEDIFF('211344', '201123') |
+------------------------------+
| 01:02:21                     |
+------------------------------+
1 row in set (0.002 sec)

DB [datatypes]> 
DB [datatypes]> 
DB [datatypes]> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2022-04-23 17:11:33 |
+---------------------+
1 row in set (0.006 sec)

DB [datatypes]> SELECT DAYNAME('2022@03@23 11@12@12');
+--------------------------------+
| DAYNAME('2022@03@23 11@12@12') |
+--------------------------------+
| Wednesday                      |
+--------------------------------+
1 row in set (0.009 sec)

DB [datatypes]> SELECT DAYNAME('2022@04@23 11@12@12');
+--------------------------------+
| DAYNAME('2022@04@23 11@12@12') |
+--------------------------------+
| Saturday                       |
+--------------------------------+
1 row in set (0.002 sec)

DB [datatypes]> 
DB [datatypes]> SELECT YEAR(CURDATE()) AS 'Current year';
+--------------+
| Current year |
+--------------+
|         2022 |
+--------------+
1 row in set (0.013 sec)

DB [datatypes]> 
DB [datatypes]> 
DB [datatypes]> CREATE TABLE Prices(Id TINYINT PRIMARY KEY, Price DECIMAL(8, 2), Stamp TIMESTAMP);
Query OK, 0 rows affected (0.100 sec)

DB [datatypes]> INSERT INTO Prices(Id, Price) VALUES(1, 234.34);
Query OK, 1 row affected (0.020 sec)

DB [datatypes]> INSERT INTO Prices(Id, Price) VALUES(2, 344.12);
Query OK, 1 row affected (0.018 sec)

DB [datatypes]> SELECT * FROM Prices;
+----+--------+---------------------+
| Id | Price  | Stamp               |
+----+--------+---------------------+
|  1 | 234.34 | 2022-04-23 17:22:37 |
|  2 | 344.12 | 2022-04-23 17:23:14 |
+----+--------+---------------------+
2 rows in set (0.006 sec)

DB [datatypes]> UPDATE Prices SET Price=250.50 WHERE Id=1;
Query OK, 1 row affected (0.071 sec)
Rows matched: 1  Changed: 1  Warnings: 0

DB [datatypes]> SELECT * FROM Prices;
+----+--------+---------------------+
| Id | Price  | Stamp               |
+----+--------+---------------------+
|  1 | 250.50 | 2022-04-23 17:26:17 |
|  2 | 344.12 | 2022-04-23 17:23:14 |
+----+--------+---------------------+
2 rows in set (0.004 sec)

DB [datatypes]> 
DB [datatypes]> 
DB [datatypes]> CREATE TABLE Chars(Id TINYINT PRIMARY KEY, Chars CHAR(3));
Query OK, 0 rows affected (0.084 sec)

DB [datatypes]> INSERT INTO Chars VALUES (1, 'a'), (2, 'ab'), (3, 'abc');
Query OK, 3 rows affected (0.048 sec)
Records: 3  Duplicates: 0  Warnings: 0

DB [datatypes]> INSERT INTO Chars VALUES (1, 'abcd');
ERROR 1406 (22001): Data too long for column 'Chars' at row 1
DB [datatypes]> 
DB [datatypes]> 
DB [datatypes]> CREATE TABLE FirstNames(Id TINYINT, Firstname VARCHAR(20));
Query OK, 0 rows affected (0.109 sec)

DB [datatypes]> INSERT INTO FirstNames VALUES (1, 'Tom'), (2, 'Lucy'), (3, 'Alice'),
    -> (4, 'Robert'), (5, 'Timothy'), (6, 'Alexander');
Query OK, 6 rows affected (0.063 sec)
Records: 6  Duplicates: 0  Warnings: 0

DB [datatypes]> SELECT Id, Firstname, LENGTH(Firstname) AS Length FROM FirstNames;
+------+-----------+--------+
| Id   | Firstname | Length |
+------+-----------+--------+
|    1 | Tom       |      3 |
|    2 | Lucy      |      4 |
|    3 | Alice     |      5 |
|    4 | Robert    |      6 |
|    5 | Timothy   |      7 |
|    6 | Alexander |      9 |
+------+-----------+--------+
6 rows in set (0.018 sec)

DB [datatypes]> 
DB [datatypes]> 
DB [datatypes]> CREATE TABLE Images(Id INT PRIMARY KEY, Img LONGBLOB);
Query OK, 0 rows affected (0.135 sec)

DB [datatypes]> SHOW VARIABLES LIKE "secure_file_priv";
+------------------+-------+
| Variable_name    | Value |
+------------------+-------+
| secure_file_priv |       |
+------------------+-------+
1 row in set (0.064 sec)

DB [datatypes]> INSERT INTO Images VALUES(1, LOAD_FILE(/home/user/Pictures/file.jpg));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your DB server version for the right syntax to use near '/home/user/Pictures/file.jpg))' at line 1
DB [datatypes]> 
DB [datatypes]> 
DB [datatypes]> CREATE TABLE t1 (jdoc JSON);
Query OK, 0 rows affected (0.185 sec)

DB [datatypes]> SELECT JSON_ARRAY('a', 1, NOW());
+---------------------------------+
| JSON_ARRAY('a', 1, NOW())       |
+---------------------------------+
| ["a", 1, "2022-04-23 18:27:05"] |
+---------------------------------+
1 row in set (0.031 sec)

DB [datatypes]> INSERT INTO t1 VALUES('{"key1": "value1", "key2": "value2"}');
Query OK, 1 row affected (0.012 sec)

DB [datatypes]> SELECT JSON_ARRAY('a', 1, NOW());
+---------------------------------+
| JSON_ARRAY('a', 1, NOW())       |
+---------------------------------+
| ["a", 1, "2022-04-23 18:31:44"] |
+---------------------------------+
1 row in set (0.002 sec)

DB [datatypes]> SELECT JSON_OBJECT('key1', 1, 'key2', 'abc');
+---------------------------------------+
| JSON_OBJECT('key1', 1, 'key2', 'abc') |
+---------------------------------------+
| {"key1": 1, "key2": "abc"}            |
+---------------------------------------+
1 row in set (0.004 sec)

DB [datatypes]> SELECT JSON_TYPE('["a", "b", 1]');
+----------------------------+
| JSON_TYPE('["a", "b", 1]') |
+----------------------------+
| ARRAY                      |
+----------------------------+
1 row in set (0.004 sec)

DB [datatypes]> 
