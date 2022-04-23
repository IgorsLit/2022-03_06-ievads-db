-- Decimal

DB [datatypes]> CREATE TABLE Materials (
    -> Id INT AUTO_INCREMENT PRIMARY KEY, 
    -> Description VARCHAR(255), 
    -> Cost DECIMAL(19, 4) NOT NULL
    -> );
Query OK, 0 rows affected (0.132 sec)

DB [datatypes]> INSERT INTO Materials(Description, cost)
    -> VALUES('Bicycle', 500.34), ('Seat', 10.23), ('Break', 5.21);
Query OK, 3 rows affected (0.055 sec)
Records: 3  Duplicates: 0  Warnings: 0

DB [datatypes]> SELECT * FROM Materials;
+----+-------------+----------+
| Id | Description | Cost     |
+----+-------------+----------+
|  1 | Bicycle     | 500.3400 |
|  2 | Seat        |  10.2300 |
|  3 | Break       |   5.2100 |
+----+-------------+----------+
3 rows in set (0.008 sec)

DB [datatypes]> 
