mysql> USE education_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT * INTO OUTFILE '/home/user/folder/db_kopija/students.txt' FROM students;
ERROR 1 (HY000): Can't create/write to file '/home/user/folder/db_kopija/students.txt' (Errcode: 13 "Permission denied")
mysql> exit
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
