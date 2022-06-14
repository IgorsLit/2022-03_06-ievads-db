mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| .....c8r....  ....   |
| info       _schema   |
+----------------------+
2 rows in set (5.88 sec)

mysql> use .....c8r....  ....;
Database changed
mysql> -- Tā var pārbaudīt datubāzi, kurai esat pieslēdzies
mysql> select database();
+----------------------+
| database()           |
+----------------------+
| .....c8r....  ....   |
+----------------------+
1 row in set (0.05 sec)

mysql> show tables;
Empty set (0.05 sec)

mysql> create table my_tab_01(a_name varchar(200), a_content varcar(4000));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'varcar(4000))' at line 1
mysql> create table my_tab_01(a_name varchar(200), a_content varchar(4000));
Query OK, 0 rows affected (0.07 sec)

mysql> show tables;
+--------------------------------+
| Tables_in_.....c8r....  ....   |
+--------------------------------+
| my_tab_01                      |
+--------------------------------+
1 row in set (0.05 sec)

mysql> insert into my_tab_01(a_name, a_content) values('Test', 'Hello World !');
Query OK, 1 row affected (0.06 sec)

mysql> select * from my_tab_01
    -> ;
+--------+---------------+
| a_name | a_content     |
+--------+---------------+
| Test   | Hello World ! |
+--------+---------------+
1 row in set (0.05 sec)

mysql> select * from my_tab_01;
+--------+---------------+
| a_name | a_content     |
+--------+---------------+
| Test   | Hello World ! |
+--------+---------------+
1 row in set (0.05 sec)

mysql> -- Ejam ārā no klienta ar quit;
mysql> quit;

show databases;
use .....c8r....  ....;
-- Tā var pārbaudīt datubāzi, kurai esat pieslēdzies   select database();
select database();
show tables;
create table my_tab_01(a_name varchar(200), a_content varchar(4000));
insert into my_tab_01(a_name, a_content) values('Test', 'Hello World !');
select * from my_tab_01;
-- Ejam ārā no klienta ar quit;
quit;

