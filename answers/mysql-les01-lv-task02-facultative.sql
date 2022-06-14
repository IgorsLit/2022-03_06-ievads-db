mysql> select 'Hello World!';
+--------------+
| Hello World! |
+--------------+
| Hello World! |
+--------------+
1 row in set (0.05 sec)

mysql> select 'Hello World!' say_hello;
+--------------+
| say_hello    |
+--------------+
| Hello World! |
+--------------+
1 row in set (0.05 sec)

mysql> select concat('Hello World!', ' I am ', /* => here goes your name, please :) */'Igors!' say_hello;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select concat('Hello World!', ' I am ', /* => here goes your name, please :) */'Igors!') say_hello;
+--------------------------+
| say_hello                |
+--------------------------+
| Hello World! I am Igors! |
+--------------------------+
1 row in set (0.05 sec)

mysql> select concat('Hello World!', ' I am ', /* => here goes your name, please :) */'Igors!', 'And for the record : ', now()) say_hello;
+------------------------------------------------------------------+
| say_hello                                                        |
+------------------------------------------------------------------+
| Hello World! I am Igors!And for the record : 2022-04-11 13:54:43 |
+------------------------------------------------------------------+
1 row in set (0.05 sec)

mysql> select concat('Hello World!', ' I am ', /* => here goes your name, please :) */'Igors!', 'And for the record : ', now(), ' Sum is : ', 3+12) say_hello;
+------------------------------------------------------------------------------+
| say_hello                                                                    |
+------------------------------------------------------------------------------+
| Hello World! I am Igors!And for the record : 2022-04-11 13:55:39 Sum is : 15 |
+------------------------------------------------------------------------------+
1 row in set (0.05 sec)

mysql> select concat('Hello World!', ' I am ', /* => here goes your name, please :) */'Igors!', ' And for the record : ', now(), ' Sum is : ', 3+12, " Sqrt : sqrt(9)) say_hello;
    ">
    "> "
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> select concat('Hello World!', ' I am ', /* => here goes your name, please :) */'Igors!', ' And for the record : ', now(), ' Sum is : ', 3+12, " Sqrt :", sqrt(9)) say_hello;
+---------------------------------------------------------------------------------------+
| say_hello                                                                             |
+---------------------------------------------------------------------------------------+
| Hello World! I am Igors! And for the record : 2022-04-11 13:56:35 Sum is : 15 Sqrt :3 |
+---------------------------------------------------------------------------------------+
1 row in set (0.05 sec)

mysql>


select 'Hello World!';
select 'Hello World!' say_hello;
select concat('Hello World!', ' I am ' , /*=> here does your name, please :0 */'Igor') say_hello;
select concat('Hello World!', 'I am ', /* => here goes your name, please :) */'Igors!', ' And for the record : ', now(), ' Sum is : ', 3+12, " Sqrt :", sqrt(9)) say_hello;

