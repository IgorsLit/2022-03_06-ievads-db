-- First OS1
mysql> USE education_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT * INTO OUTFILE '/home/user/folder/db_kopija/students.txt' FROM students;
ERROR 1 (HY000): Can't create/write to file '/home/user/folder/db_kopija/students.txt' (Errcode: 13 "Permission denied")
mysql> exit
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)




-- Second OS2 
mysql> USE education_db;
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
