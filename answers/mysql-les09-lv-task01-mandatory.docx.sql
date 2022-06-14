-- First OS1
mysql> USE edu_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT * INTO OUTFILE '/home/user/folder/db_kopija/students.txt' FROM students;
ERROR 1 (HY000): Can't create/write to file '/home/user/folder/db_kopija/students.txt' (Errcode: 13 "Permission denied")
mysql> exit
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)




-- Second OS2 
mysql> USE edu_db;
Database changed
mysql> SELECT * INTO OUTFILE 'students.txt' FROM students;
ERROR 1290 (HY000): The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
mysql> SELECT @@GLOBAL.secure_file_priv; 
+------------------------------------------------+
| @@GLOBAL.secure_file_priv                      |
+------------------------------------------------+
| C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ |
+------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT * INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\students.txt' FROM students;
Query OK, 13 rows affected (0.03 sec)

mysql> exit


-- Import to cloude DB
mysql> SHOW GLOBAL VARIABLES LIKE 'local_infile';
ERROR 2013 (HY000): Lost connection to MySQL server during query
No connection. Trying to reconnect...
Connection id:    1686037
Current database: bzf9gc8r7yfbjez5vx5s

+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | OFF   |
+---------------+-------+
1 row in set (12.67 sec)

mysql> SET GLOBAL local_infile=true;
ERROR 1227 (42000): Access denied; you need (at least one of) the SUPER or SYSTEM_VARIABLES_ADMIN privilege(s) for this operation
mysql> exit


-- Import to local DB
mysql> SHOW GLOBAL VARIABLES LIKE 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | OFF   |
+---------------+-------+
1 row in set (0.12 sec)

mysql> SET GLOBAL local_infile=true;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW GLOBAL VARIABLES LIKE 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | ON    |
+---------------+-------+
1 row in set (0.00 sec)

mysql> USE edu_db;
Database changed
mysql> SHOW TABLES;
+------------------------+
| Tables_in_edu_db       |
+------------------------+
| edu_group              |
| student                |
+------------------------+
2 rows in set (0.07 sec)

mysql> SHOW SCHEMAS;
+---------------------+
| Database            |
+---------------------+
| 10lesjo             |
| 8lesfunct           |
| 9lesimpor           |

| sys                 |
| world               |
+---------------------+
16 rows in set (0.05 sec)

mysql> USE 9lesimpo
Database changed
mysql> SHOW TABLES;
+----------------------------+
| Tables_in_9lesimpor        |
+----------------------------+
| actor_copy                 |
+----------------------------+
1 row in set (0.00 sec)

mysql> USE edu_db;
Database changed
mysql> CREATE TABLE 9lesimpor.student_copy SELECT * FROM edu_db.student WHERE 1=2;
Query OK, 0 rows affected (0.21 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> USE 9lesimpor;
Database changed
mysql> SHOW TABLES;
+----------------------------+
| Tables_in_9lesimpor        |
+----------------------------+
| actor_copy                 |
| student_copy               |
+----------------------------+
2 rows in set (0.01 sec)

mysql> DESCRIBE STUDENT_COPY;
+-----------+------------------+------+-----+---------+-------+
| Field     | Type             | Null | Key | Default | Extra |
+-----------+------------------+------+-----+---------+-------+
| id        | tinyint(1)       | NO   |     | 0       |       |
| firstname | varchar(20)      | NO   |     | NULL    |       |
| lastname  | varchar(20)      | NO   |     | NULL    |       |
| groups_id | tinyint unsigned | YES  |     | NULL    |       |
+-----------+------------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\students.txt' INTO TABLE student_copy;
Query OK, 13 rows affected (0.01 sec)
Records: 13  Deleted: 0  Skipped: 0  Warnings: 0

mysql> SELECT * FROM student_copy;
+----+-----------+----------+-----------+
| id | firstname | lastname | groups_id |
+----+-----------+----------+-----------+
| 23 | Andrejs   | Abolins  |        12 |
| 24 | Peteris   | Ozols    |        12 |
| 25 | Liene     | Smita    |        12 |
| 26 | Antons    | Avotins  |        13 |
| 27 | Janis     | Berzs    |        13 |
| 28 | Peteris   | Berzins  |        13 |
| 29 | Uldis     | Ivanovs  |        13 |
| 30 | Andrejs   | Berzins  |        14 |
| 31 | Antra     | Liepina  |        14 |
| 32 | Oskars    | Berzins  |        15 |
| 33 | Ilvars    | Liepins  |        16 |
| 36 | P?teris   | Petrovs  |        22 |
| 37 | J?nis     | Jansons  |        22 |
+----+-----------+----------+-----------+
13 rows in set (0.00 sec)

mysql> exit
