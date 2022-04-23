create schema datatypes;
use datatypes;
CREATE TABLE Ages(Id SMALLINT, Age TINYINT) ENGINE=Memory;
INSERT INTO Ages VALUES(1, 43);
INSERT INTO Ages VALUES(2, 128);
ALTER TABLE Ages MODIFY Age TINYINT UNSIGNED;
INSERT INTO Ages VALUES(2, 128);


DB [datatypes]> SELECT * FROM Ages;
+------+------+
| Id   | Age  |
+------+------+
|    1 |   43 |
|    2 |  128 |
+------+------+
3 rows in set (0.002 sec)

DB [datatypes]> 