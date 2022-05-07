DB [(none)]> USE sakila;
Database changed
DB [sakila]> SHOW TABLES;
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| film_text                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
23 rows in set (0.005 sec)

DB [sakila]> SHOW INDEX FROM city;
+-------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name          | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| city  |          0 | PRIMARY           |            1 | city_id     | A         |         600 |     NULL | NULL   |      | BTREE      |         |               |
| city  |          1 | idx_fk_country_id |            1 | country_id  | A         |         300 |     NULL | NULL   |      | BTREE      |         |               |
+-------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.016 sec)

DB [sakila]> SELECT * FROM city WHERE city_id=586;
+---------+---------+------------+---------------------+
| city_id | city    | country_id | last_update         |
+---------+---------+------------+---------------------+
|     586 | Yerevan |          7 | 2006-02-15 04:45:25 |
+---------+---------+------------+---------------------+
1 row in set (0.006 sec)

DB [sakila]> EXPLAIN SELECT * FROM city WHERE city_id=586;
+------+-------------+-------+-------+---------------+---------+---------+-------+------+-------+
| id   | select_type | table | type  | possible_keys | key     | key_len | ref   | rows | Extra |
+------+-------------+-------+-------+---------------+---------+---------+-------+------+-------+
|    1 | SIMPLE      | city  | const | PRIMARY       | PRIMARY | 2       | const | 1    |       |
+------+-------------+-------+-------+---------------+---------+---------+-------+------+-------+
1 row in set (0.007 sec)

DB [sakila]> SHOW INDEX FROM film;
+-------+------------+-----------------------------+--------------+----------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name                    | Seq_in_index | Column_name          | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+-----------------------------+--------------+----------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| film  |          0 | PRIMARY                     |            1 | film_id              | A         |        1000 |     NULL | NULL   |      | BTREE      |         |               |
| film  |          1 | idx_title                   |            1 | title                | A         |        1000 |     NULL | NULL   |      | BTREE      |         |               |
| film  |          1 | idx_fk_language_id          |            1 | language_id          | A         |           2 |     NULL | NULL   |      | BTREE      |         |               |
| film  |          1 | idx_fk_original_language_id |            1 | original_language_id | A         |           2 |     NULL | NULL   | YES  | BTREE      |         |               |
+-------+------------+-----------------------------+--------------+----------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
4 rows in set (0.010 sec)

DB [sakila]> CREATE INDEX film_01_idx ON film(release_year);
Query OK, 0 rows affected (0.254 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [sakila]> SHOW INDEX FROM film;
+-------+------------+-----------------------------+--------------+----------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name                    | Seq_in_index | Column_name          | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+-----------------------------+--------------+----------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| film  |          0 | PRIMARY                     |            1 | film_id              | A         |        1000 |     NULL | NULL   |      | BTREE      |         |               |
| film  |          1 | idx_title                   |            1 | title                | A         |        1000 |     NULL | NULL   |      | BTREE      |         |               |
| film  |          1 | idx_fk_language_id          |            1 | language_id          | A         |           2 |     NULL | NULL   |      | BTREE      |         |               |
| film  |          1 | idx_fk_original_language_id |            1 | original_language_id | A         |           2 |     NULL | NULL   | YES  | BTREE      |         |               |
| film  |          1 | film_01_idx                 |            1 | release_year         | A         |           2 |     NULL | NULL   | YES  | BTREE      |         |               |
+-------+------------+-----------------------------+--------------+----------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
5 rows in set (0.020 sec)

DB [sakila]> EXPLAIN SELECT * FROM film WHERE release_year=2006 AND rental_rate>0.99 AND description LIKE '%Epic%';
+------+-------------+-------+------+---------------+------+---------+------+------+-------------+
| id   | select_type | table | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+------+-------------+-------+------+---------------+------+---------+------+------+-------------+
|    1 | SIMPLE      | film  | ALL  | film_01_idx   | NULL | NULL    | NULL | 1000 | Using where |
+------+-------------+-------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.441 sec)

DB [sakila]> SELECT * FROM film WHERE release_year=2006 AND rental_rate>0.99 AND description LIKE '%Epic%' LIMIT 5;
+---------+-------------------+-----------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
| film_id | title             | description                                                                                   | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                              | last_update         |
+---------+-------------------+-----------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
|       8 | AIRPORT POLLOCK   | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                 |         2006 |           1 |                 NULL |               6 |        4.99 |     54 |            15.99 | R      | Trailers                                      | 2006-02-15 05:03:42 |
|      30 | ANYTHING SAVANNAH | A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House |         2006 |           1 |                 NULL |               4 |        2.99 |     82 |            27.99 | R      | Trailers,Deleted Scenes,Behind the Scenes     | 2006-02-15 05:03:42 |
|      53 | BANG KWAI         | A Epic Drama of a Madman And a Cat who must Face a A Shark in An Abandoned Amusement Park     |         2006 |           1 |                 NULL |               5 |        2.99 |     87 |            25.99 | NC-17  | Commentaries,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|     145 | CHISUM BEHAVIOR   | A Epic Documentary of a Sumo Wrestler And a Butler who must Kill a Car in Ancient India       |         2006 |           1 |                 NULL |               5 |        4.99 |    124 |            25.99 | G      | Trailers,Commentaries,Behind the Scenes       | 2006-02-15 05:03:42 |
|     202 | DADDY PITTSBURGH  | A Epic Story of a A Shark And a Student who must Confront a Explorer in The Gulf of Mexico    |         2006 |           1 |                 NULL |               5 |        4.99 |    161 |            26.99 | G      | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
+---------+-------------------+-----------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
5 rows in set (0.095 sec)

DB [sakila]> EXIT;


List of all client commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear the current input statement.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
edit      (\e) Edit command with $EDITOR.
ego       (\G) Send command to DB server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to DB server.
help      (\h) Display this help.
nopager   (\n) Disable pager, print to stdout.
notee     (\t) Don't write into outfile.
pager     (\P) Set PAGER [to_pager]. Print the query results via PAGER.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.

For server side help, type 'help contents'


DB [(none)]> source /home/user/dic1/file.sql
Query OK, 0 rows affected (0.031 sec)

Database changed

Query OK, 0 rows affected (0.159 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [none]> USE databasestablescreation;

Database changed
DB [databasestablescreation]> CREATE TABLE IF NOT EXISTS films (
    ->  country_id TINYINT(2) UNSIGNED PRIMARY KEY AUTO_INCREMENT,  name VARCHAR(25) NOT NULL DEFAULT '');
Query OK, 0 rows affected (0.157 sec)

DB [databasestablescreation]> ALTER TABLE films RENAME COLUMN country_id TO film_id;
Query OK, 0 rows affected (0.608 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> ALTER TABLE films RENAME COLUMN name TO title;
Query OK, 0 rows affected (0.058 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> CREATE TABLE languages (
    -> name VARCHAR(10) NOT NULL UNIQUE,
    -> last_update TIMESTAMP);
Query OK, 0 rows affected (0.513 sec)

DB [databasestablescreation]> DESCRIBE films;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| film_id | tinyint(2) unsigned | NO   | PRI | NULL    | auto_increment |
| title   | varchar(25)         | NO   |     |         |                |
+---------+---------------------+------+-----+---------+----------------+
2 rows in set (0.221 sec)

DB [databasestablescreation]> DESCRIBE languages;
+-------------+-------------+------+-----+---------------------+-------------------------------+
| Field       | Type        | Null | Key | Default             | Extra                         |
+-------------+-------------+------+-----+---------------------+-------------------------------+
| name        | varchar(10) | NO   | PRI | NULL                |                               |
| last_update | timestamp   | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+-------------+------+-----+---------------------+-------------------------------+
2 rows in set (0.019 sec)

DB [databasestablescreation]> ALTER TABLE languages ADD language_id TINYINT(1) UNSIGNED PRIMARY KEY AUTO_INCREMENT;
Query OK, 0 rows affected (0.179 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE languages;
+-------------+---------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                | Null | Key | Default             | Extra                         |
+-------------+---------------------+------+-----+---------------------+-------------------------------+
| name        | varchar(10)         | NO   | UNI | NULL                |                               |
| last_update | timestamp           | NO   |     | current_timestamp() | on update current_timestamp() |
| language_id | tinyint(1) unsigned | NO   | PRI | NULL                | auto_increment                |
+-------------+---------------------+------+-----+---------------------+-------------------------------+
3 rows in set (0.078 sec)

DB [databasestablescreation]> ALTER TABLE films ADD COLUMN language_id TINYINT(2) UNSIGNED;
Query OK, 0 rows affected (0.074 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE films;
+-------------+---------------------+------+-----+---------+-------+
| Field       | Type                | Null | Key | Default | Extra |
+-------------+---------------------+------+-----+---------+-------+
| film_id     | tinyint(1) unsigned | NO   | PRI | NULL    |       |
| title       | varchar(25)         | NO   |     |         |       |
| language_id | tinyint(2) unsigned | YES  |     | NULL    |       |
+-------------+---------------------+------+-----+---------+-------+
3 rows in set (0.027 sec)

DB [databasestablescreation]> ALTER TABLE films ADD CONSTRAINT fk_language_id FOREIGN KEY(language_id) REFERENCES languages(language_id);
Query OK, 0 rows affected (0.332 sec)
Records: 0  Duplicates: 0  Warnings: 0

DB [databasestablescreation]> DESCRIBE films;
+-------------+---------------------+------+-----+---------+-------+
| Field       | Type                | Null | Key | Default | Extra |
+-------------+---------------------+------+-----+---------+-------+
| film_id     | tinyint(1) unsigned | NO   | PRI | NULL    |       |
| title       | varchar(25)         | NO   |     |         |       |
| language_id | tinyint(2) unsigned | YES  | MUL | NULL    |       |
+-------------+---------------------+------+-----+---------+-------+
3 rows in set (0.021 sec)

DB [databasestablescreation]> DESCRIBE languages;
+-------------+---------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                | Null | Key | Default             | Extra                         |
+-------------+---------------------+------+-----+---------------------+-------------------------------+
| name        | varchar(10)         | NO   | UNI | NULL                |                               |
| last_update | timestamp           | NO   |     | current_timestamp() | on update current_timestamp() |
| language_id | tinyint(1) unsigned | NO   | PRI | NULL                | auto_increment                |
+-------------+---------------------+------+-----+---------------------+-------------------------------+
3 rows in set (0.025 sec)

DB [databasestablescreation]> SHOW INDEX FROM films;
+-------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| films |          0 | PRIMARY        |            1 | film_id     | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| films |          1 | fk_language_id |            1 | language_id | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+-------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.018 sec)

DB [databasestablescreation]> SHOW INDEX FROM languages;
+-----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table     | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| languages |          0 | PRIMARY  |            1 | language_id | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| languages |          0 | name     |            1 | name        | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+-----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.008 sec)

DB [databasestablescreation]> EXIT;
