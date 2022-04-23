DB [datatypes]> CREATE TABLE Numbers (Id TINYINT, Floats FLOAT, Decimals DECIMAL(3, 2));
Query OK, 0 rows affected (0.247 sec)

DB [datatypes]> INSERT INTO Numbers VALUES (1, 1.1, 1.1), (2, 1.1, 1.1), (3, 1.1, 1.1);
Query OK, 3 rows affected (0.086 sec)
Records: 3  Duplicates: 0  Warnings: 0

DB [datatypes]> SELECT * FROM Numbers;
+------+--------+----------+
| Id   | Floats | Decimals |
+------+--------+----------+
|    1 |    1.1 |     1.10 |
|    2 |    1.1 |     1.10 |
|    3 |    1.1 |     1.10 |
+------+--------+----------+
3 rows in set (0.016 sec)

DB [datatypes]> SELECT SUM(Floats), SUM(Decimals) FROM Numbers;
+--------------------+---------------+
| SUM(Floats)        | SUM(Decimals) |
+--------------------+---------------+
| 3.3000000715255737 |          3.30 |
+--------------------+---------------+
1 row in set (0.026 sec)

DB [datatypes]>

