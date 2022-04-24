DB [(none)]> create schema datatypes;
Query OK, 1 row affected (0.003 sec)

DB [(none)]> USE datatypes
Database changed

DB [datatypes]> INSERT INTO TestIntegers VALUES(70000);
ERROR 1264 (22003): Out of range value for column 'TestSmallint' at row 1

DB [datatypes]> ALTER TABLE TestIntegers MODIFY TestSmallint MEDIUMINT;
Query OK, 0 rows affected (0.399 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [datatypes]> INSERT INTO TestIntegers VALUES(70000);
Query OK, 1 row affected (0.031 sec)

DB [datatypes]> SELECT * FROM TestIntegers;
+--------------+
| TestSmallint |
+--------------+
|        70000 |
+--------------+
1 row in set (0.008 sec)

DB [datatypes]> INSERT INTO TestIntegers VALUES (3.141592), (9.8), (10000.99);
Query OK, 3 rows affected (0.056 sec)
Records: 3  Duplicates: 0  Warnings: 0

DB [datatypes]> SELECT * FROM TestIntegers;
+--------------+
| TestSmallint |
+--------------+
|        70000 |
|            3 |
|           10 |
|        10001 |
+--------------+
4 rows in set (0.006 sec)

DB [datatypes]> SELECT STR_TO_DATE('July 12 1979', '%M %d %Y');
+-----------------------------------------+
| STR_TO_DATE('July 12 1979', '%M %d %Y') |
+-----------------------------------------+
| 1979-07-12                              |
+-----------------------------------------+
1 row in set (0.025 sec)

DB [datatypes]> SELECT STR_TO_DATE('July 12 1979', '%M %d %Y'), STR_TO_DATE('February 12 1865', '%M %d %Y');
+-----------------------------------------+---------------------------------------------+
| STR_TO_DATE('July 12 1979', '%M %d %Y') | STR_TO_DATE('February 12 1865', '%M %d %Y') |
+-----------------------------------------+---------------------------------------------+
| 1979-07-12                              | 1865-02-12                                  |
+-----------------------------------------+---------------------------------------------+
1 row in set (0.002 sec)

DB [(none)]> SELECT STR_TO_DATE('July 12 1979', '%M %d %Y') AS Date1, STR_TO_DATE('February 12 1865', '%M %d %Y') AS Date2;
+------------+------------+
| Date1      | Date2      |
+------------+------------+
| 1979-07-12 | 1865-02-12 |
+------------+------------+
1 row in set (0.005 sec)

DB [(none)]> SELECT STR_TO_DATE('July 12 1979', '%M %d %Y') AS Date1, STR_TO_DATE('February 12 1865', '%M %d %Y') AS Date2, DATEDIFF (STR_TO_DATE('July 12 1979', '%M %d %Y'), STR_TO_DATE('February 12 1865', '%M %d %Y')) AS 'Date Betweem';
+------------+------------+--------------+
| Date1      | Date2      | Date Betweem |
+------------+------------+--------------+
| 1979-07-12 | 1865-02-12 |        41787 |
+------------+------------+--------------+
1 row in set (0.003 sec)

DB [(none)]> SELECT STR_TO_DATE('July 12 1979', '%M %d %Y') AS Date1, STR_TO_DATE('February 12 1865', '%M %d %Y') AS Date2, DATEDIFF (STR_TO_DATE('July 12 1979', '%M %d %Y'), STR_TO_DATE('February 12 1865', '%M %d %Y')) AS 'Date Betweem';
+------------+------------+--------------+
| Date1      | Date2      | Date Betweem |
+------------+------------+--------------+
| 1979-07-12 | 1865-02-12 |        41787 |
+------------+------------+--------------+
1 row in set (0.005 sec)

DB [(none)]> exit
