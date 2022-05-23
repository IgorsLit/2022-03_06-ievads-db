mysql> USE sakila;

Database changed
mysql> SHOW TABLES;
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

mysql> DESCRIBE country;
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                 | Null | Key | Default             | Extra                         |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| country_id  | smallint(5) unsigned | NO   | PRI | NULL                | auto_increment                |
| country     | varchar(50)          | NO   |     | NULL                |                               |
| last_update | timestamp            | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
3 rows in set (0.062 sec)

mysql> SELECT * FROM country LIMIT 3;
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
+------------+----------------+---------------------+
3 rows in set (0.013 sec)

mysql> SELECT * FROM country WHERE LENGTH(country) > 10;
+------------+---------------------------------------+---------------------+
| country_id | country                               | last_update         |
+------------+---------------------------------------+---------------------+
|          1 | Afghanistan                           | 2006-02-15 04:44:00 |
|          3 | American Samoa                        | 2006-02-15 04:44:00 |
|         25 | Congo, The Democratic Republic of the | 2006-02-15 04:44:00 |
|         26 | Czech Republic                        | 2006-02-15 04:44:00 |
|         27 | Dominican Republic                    | 2006-02-15 04:44:00 |
|         32 | Faroe Islands                         | 2006-02-15 04:44:00 |
|         35 | French Guiana                         | 2006-02-15 04:44:00 |
|         36 | French Polynesia                      | 2006-02-15 04:44:00 |
|         41 | Holy See (Vatican City State)         | 2006-02-15 04:44:00 |
|         55 | Liechtenstein                         | 2006-02-15 04:44:00 |
|         67 | Netherlands                           | 2006-02-15 04:44:00 |
|         68 | New Zealand                           | 2006-02-15 04:44:00 |
|         70 | North Korea                           | 2006-02-15 04:44:00 |
|         75 | Philippines                           | 2006-02-15 04:44:00 |
|         77 | Puerto Rico                           | 2006-02-15 04:44:00 |
|         80 | Russian Federation                    | 2006-02-15 04:44:00 |
|         81 | Saint Vincent and the Grenadines      | 2006-02-15 04:44:00 |
|         82 | Saudi Arabia                          | 2006-02-15 04:44:00 |
|         85 | South Africa                          | 2006-02-15 04:44:00 |
|         86 | South Korea                           | 2006-02-15 04:44:00 |
|         91 | Switzerland                           | 2006-02-15 04:44:00 |
|         98 | Turkmenistan                          | 2006-02-15 04:44:00 |
|        101 | United Arab Emirates                  | 2006-02-15 04:44:00 |
|        102 | United Kingdom                        | 2006-02-15 04:44:00 |
|        103 | United States                         | 2006-02-15 04:44:00 |
|        106 | Virgin Islands, U.S.                  | 2006-02-15 04:44:00 |
+------------+---------------------------------------+---------------------+
26 rows in set (0.016 sec)

mysql> DESCRIBE city;
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                 | Null | Key | Default             | Extra                         |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| city_id     | smallint(5) unsigned | NO   | PRI | NULL                | auto_increment                |
| city        | varchar(50)          | NO   |     | NULL                |                               |
| country_id  | smallint(5) unsigned | NO   | MUL | NULL                |                               |
| last_update | timestamp            | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
4 rows in set (0.017 sec)

mysql> SELECT * FROM city LIMIT 3;
+---------+--------------------+------------+---------------------+
| city_id | city               | country_id | last_update         |
+---------+--------------------+------------+---------------------+
|       1 | A Corua (La Corua) |         87 | 2006-02-15 04:45:25 |
|       2 | Abha               |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi          |        101 | 2006-02-15 04:45:25 |
+---------+--------------------+------------+---------------------+
3 rows in set (0.009 sec)

mysql> SELECT * FROM city WHERE city LIKE '%ah%';
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       9 | Ahmadnagar              |         44 | 2006-02-15 04:45:25 |
|      45 | Baha Blanca             |          6 | 2006-02-15 04:45:25 |
|      71 | Berhampore (Baharampur) |         44 | 2006-02-15 04:45:25 |
|     162 | Esfahan                 |         46 | 2006-02-15 04:45:25 |
|     164 | Etawah                  |         44 | 2006-02-15 04:45:25 |
|     197 | Halisahar               |         44 | 2006-02-15 04:45:25 |
|     253 | Kakamigahara            |         50 | 2006-02-15 04:45:25 |
|     265 | Kermanshah              |         46 | 2006-02-15 04:45:25 |
|     281 | Ktahya                  |         97 | 2006-02-15 04:45:25 |
|     319 | Mahajanga               |         57 | 2006-02-15 04:45:25 |
|     324 | Mandi Bahauddin         |         72 | 2006-02-15 04:45:25 |
|     365 | Nezahualcyotl           |         60 | 2006-02-15 04:45:25 |
|     467 | Shahr-e Kord            |         46 | 2006-02-15 04:45:25 |
|     520 | Tallahassee             |        103 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
14 rows in set (0.023 sec)

mysql> SELECT * FROM city WHERE city COLLATE utf8_bin LIKE '%ah%';
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|      45 | Baha Blanca             |          6 | 2006-02-15 04:45:25 |
|      71 | Berhampore (Baharampur) |         44 | 2006-02-15 04:45:25 |
|     162 | Esfahan                 |         46 | 2006-02-15 04:45:25 |
|     164 | Etawah                  |         44 | 2006-02-15 04:45:25 |
|     197 | Halisahar               |         44 | 2006-02-15 04:45:25 |
|     253 | Kakamigahara            |         50 | 2006-02-15 04:45:25 |
|     265 | Kermanshah              |         46 | 2006-02-15 04:45:25 |
|     281 | Ktahya                  |         97 | 2006-02-15 04:45:25 |
|     319 | Mahajanga               |         57 | 2006-02-15 04:45:25 |
|     324 | Mandi Bahauddin         |         72 | 2006-02-15 04:45:25 |
|     365 | Nezahualcyotl           |         60 | 2006-02-15 04:45:25 |
|     467 | Shahr-e Kord            |         46 | 2006-02-15 04:45:25 |
|     520 | Tallahassee             |        103 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+
13 rows in set (0.043 sec)

mysql> SELECT * FROM city WHERE city COLLATE utf8_bin LIKE '%Ah%';
+---------+------------+------------+---------------------+
| city_id | city       | country_id | last_update         |
+---------+------------+------------+---------------------+
|       9 | Ahmadnagar |         44 | 2006-02-15 04:45:25 |
+---------+------------+------------+---------------------+
1 row in set (0.019 sec)

mysql> DESCRIBE actor;
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                 | Null | Key | Default             | Extra                         |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| actor_id    | smallint(5) unsigned | NO   | PRI | NULL                | auto_increment                |
| first_name  | varchar(45)          | NO   |     | NULL                |                               |
| last_name   | varchar(45)          | NO   | MUL | NULL                |                               |
| last_update | timestamp            | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
4 rows in set (0.017 sec)

mysql> SELECT COUNT(*) FROM actor;
+----------+
| COUNT(*) |
+----------+
|      200 |
+----------+
1 row in set (0.014 sec)

mysql> SELECT actor_id, CONCAT(first_name, ' ', last_name) FROM actor LIMIT 15;
+----------+------------------------------------+
| actor_id | CONCAT(first_name, ' ', last_name) |
+----------+------------------------------------+
|        1 | PENELOPE GUINESS                   |
|        2 | NICK WAHLBERG                      |
|        3 | ED CHASE                           |
|        4 | JENNIFER DAVIS                     |
|        5 | JOHNNY LOLLOBRIGIDA                |
|        6 | BETTE NICHOLSON                    |
|        7 | GRACE MOSTEL                       |
|        8 | MATTHEW JOHANSSON                  |
|        9 | JOE SWANK                          |
|       10 | CHRISTIAN GABLE                    |
|       11 | ZERO CAGE                          |
|       12 | KARL BERRY                         |
|       13 | UMA WOOD                           |
|       14 | VIVIEN BERGEN                      |
|       15 | CUBA OLIVIER                       |
+----------+------------------------------------+
15 rows in set (0.010 sec)

mysql> SELECT * FROM payment LIMIT 5;
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
| payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
|          1 |           1 |        1 |        76 |   2.99 | 2005-05-25 11:30:37 | 2006-02-15 22:12:30 |
|          2 |           1 |        1 |       573 |   0.99 | 2005-05-28 10:35:23 | 2006-02-15 22:12:30 |
|          3 |           1 |        1 |      1185 |   5.99 | 2005-06-15 00:54:12 | 2006-02-15 22:12:30 |
|          4 |           1 |        2 |      1422 |   0.99 | 2005-06-15 18:02:53 | 2006-02-15 22:12:30 |
|          5 |           1 |        2 |      1476 |   9.99 | 2005-06-15 21:08:46 | 2006-02-15 22:12:30 |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
5 rows in set (0.008 sec)

mysql> SELECT MIN(payment_date), MAX(payment_date) FROM payment;
+---------------------+---------------------+
| MIN(payment_date)   | MAX(payment_date)   |
+---------------------+---------------------+
| 2005-05-24 22:53:30 | 2006-02-14 15:16:03 |
+---------------------+---------------------+
1 row in set (0.458 sec)

mysql> SELECT CONCAT(YEAR(payment_date), '-', MONTH(payment_date), '-', DAYOFMONTH(payment_date)) AS payment FROM payment WHERE CONCAT(YEAR(payment_date), '-', MONTH(payment_date), '-', DAYOFMONTH(payment_date)) > '2006-02-01';
+-----------+
| payment   |
+-----------+
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |


| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
| 2006-2-14 |
+-----------+
182 rows in set (0.618 sec)

mysql> SELECT * FROM payment ORDER BY payment_date DESC LIMIT 1;
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
| payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
|        145 |           5 |        2 |     13209 |   0.99 | 2006-02-14 15:16:03 | 2006-02-15 22:12:30 |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
1 row in set (0.351 sec)

mysql> SELECT CONCAT(YEAR(payment_date), '-', MONTH(payment_date), '-', DAYOFMONTH(payment_date)) AS DATE FROM payment LIMIT 3;
+-----------+
| DATE      |
+-----------+
| 2005-5-25 |
| 2005-5-28 |
| 2005-6-15 |
+-----------+
3 rows in set (0.006 sec)

mysql> SELECT * FROM payment LIMIT 3;
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
| payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
|          1 |           1 |        1 |        76 |   2.99 | 2005-05-25 11:30:37 | 2006-02-15 22:12:30 |
|          2 |           1 |        1 |       573 |   0.99 | 2005-05-28 10:35:23 | 2006-02-15 22:12:30 |
|          3 |           1 |        1 |      1185 |   5.99 | 2005-06-15 00:54:12 | 2006-02-15 22:12:30 |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
3 rows in set (0.007 sec)

mysql> exit;


mysql> USE funcs

Database changed
mysql> CREATE TABLE country_copy AS SELECT * FROM sakila.country;
Query OK, 109 rows affected (0.282 sec)
Records: 109  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM country_copy;
+------------+---------------------------------------+---------------------+
| country_id | country                               | last_update         |
+------------+---------------------------------------+---------------------+
|          1 | Afghanistan                           | 2006-02-15 04:44:00 |
|          2 | Algeria                               | 2006-02-15 04:44:00 |
|          3 | American Samoa                        | 2006-02-15 04:44:00 |
|          4 | Angola                                | 2006-02-15 04:44:00 |
|          5 | Anguilla                              | 2006-02-15 04:44:00 |
|          6 | Argentina                             | 2006-02-15 04:44:00 |
|          7 | Armenia                               | 2006-02-15 04:44:00 |
|          8 | Australia                             | 2006-02-15 04:44:00 |
|          9 | Austria                               | 2006-02-15 04:44:00 |
|         10 | Azerbaijan                            | 2006-02-15 04:44:00 |
|         11 | Bahrain                               | 2006-02-15 04:44:00 |
|         12 | Bangladesh                            | 2006-02-15 04:44:00 |
|         13 | Belarus                               | 2006-02-15 04:44:00 |
|         14 | Bolivia                               | 2006-02-15 04:44:00 |


|         95 | Tonga                                 | 2006-02-15 04:44:00 |
|         96 | Tunisia                               | 2006-02-15 04:44:00 |
|         97 | Turkey                                | 2006-02-15 04:44:00 |
|         98 | Turkmenistan                          | 2006-02-15 04:44:00 |
|         99 | Tuvalu                                | 2006-02-15 04:44:00 |
|        100 | Ukraine                               | 2006-02-15 04:44:00 |
|        101 | United Arab Emirates                  | 2006-02-15 04:44:00 |
|        102 | United Kingdom                        | 2006-02-15 04:44:00 |
|        103 | United States                         | 2006-02-15 04:44:00 |
|        104 | Venezuela                             | 2006-02-15 04:44:00 |
|        105 | Vietnam                               | 2006-02-15 04:44:00 |
|        106 | Virgin Islands, U.S.                  | 2006-02-15 04:44:00 |
|        107 | Yemen                                 | 2006-02-15 04:44:00 |
|        108 | Yugoslavia                            | 2006-02-15 04:44:00 |
|        109 | Zambia                                | 2006-02-15 04:44:00 |
+------------+---------------------------------------+---------------------+
109 rows in set (0.021 sec)

mysql> select CONCAT('1919. gada 11. novembris', ' ', CURRENT_TIME());
+---------------------------------------------------------+
| CONCAT('1919. gada 11. novembris', ' ', CURRENT_TIME()) |
+---------------------------------------------------------+
| 1919. gada 11. novembris 21:08:30                       |
+---------------------------------------------------------+
1 row in set (0.002 sec)

mysql> SELECT STR_TO_DATE("August, 5, 2017", "%M, %e, %Y");
+----------------------------------------------+
| STR_TO_DATE("August, 5, 2017", "%M, %e, %Y") |
+----------------------------------------------+
| 2017-08-05                                   |
+----------------------------------------------+
1 row in set (0.002 sec)

mysql> SELECT STR_TO_DATE("August 5 2017", "%M %e %Y");
+------------------------------------------+
| STR_TO_DATE("August 5 2017", "%M %e %Y") |
+------------------------------------------+
| 2017-08-05                               |
+------------------------------------------+
1 row in set (0.002 sec)

mysql> SELECT STR_TO_DATE("August, 5, 2017", "%M %e %Y");
+--------------------------------------------+
| STR_TO_DATE("August, 5, 2017", "%M %e %Y") |
+--------------------------------------------+
| NULL                                       |
+--------------------------------------------+
1 row in set, 1 warning (0.002 sec)

mysql> select SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1);
+----------------------------------------------------+
| SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1) |
+----------------------------------------------------+
| 1919                                               |
+----------------------------------------------------+
1 row in set (0.004 sec)

mysql> select SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1), SUBSTRING_INDEX('1919.gada 11. novembris', '.', -1);
+----------------------------------------------------+-----------------------------------------------------+
| SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1) | SUBSTRING_INDEX('1919.gada 11. novembris', '.', -1) |
+----------------------------------------------------+-----------------------------------------------------+
| 1919                                               |  novembris                                          |
+----------------------------------------------------+-----------------------------------------------------+
1 row in set (0.002 sec)

mysql> select SUBSTRING_INDEX(SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1) AS DAY;
+------+
| DAY  |
+------+
| 11.  |
+------+
1 row in set (0.002 sec)

mysql> select SUBSTRING_INDEX(SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), '.', 1) AS YEAR2ver;
+----------+
| YEAR2ver |
+----------+
| 1919     |
+----------+
1 row in set (0.002 sec)

mysql> select SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) AS DAY;
+------+
| DAY  |
+------+
| 11   |
+------+
1 row in set (0.002 sec)

mysql> select SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1) AS year;
+------+
| year |
+------+
| 1919 |
+------+
1 row in set (0.002 sec)

mysql> select SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1) AS year, SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) AS day;
+------+------+
| year | day  |
+------+------+
| 1919 | 11   |
+------+------+
1 row in set (0.002 sec)

mysql> select SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1) AS year, SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) AS day, SUBSTRING_INDEX('1919.gada 11. novembris', ' ',-1) AS menesis;
+------+------+-----------+
| year | day  | menesis   |
+------+------+-----------+
| 1919 | 11   | novembris |
+------+------+-----------+
1 row in set (0.007 sec)

mysql> select CASE 'novembris' 
    -> WHEN 'janvaris' THEN 'January'
    -> WHEN 'februaris' THEN 'Feruary'
    -> WHEN 'marts' THEN 'March'
    -> WHEN 'aprilis' THEN 'April'
    -> WHEN 'maijs' THEN 'May'
    -> WHEN 'junijs' THEN 'June'
    -> WHEN 'julijs' THEN 'July'
    -> WHEN 'augusts' THEN 'August'
    -> WHEN 'septembris' THEN 'September'
    -> WHEN 'oktobris' THEN 'October'
    -> WHEN 'novembris' THEN 'November'
    -> WHEN 'decembris' THEN 'December'
    -> END;
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| CASE 'novembris' 
WHEN 'janvaris' THEN 'January'
WHEN 'februaris' THEN 'Feruary'
WHEN 'marts' THEN 'March'
WHEN 'aprilis' THEN 'April'
WHEN 'maijs' THEN 'May'
WHEN 'junijs' THEN 'June'
WHEN 'julijs' THEN 'July'
WHEN 'augusts' THEN 'August'
WHEN 'septembri |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| November                                                                                                                                                                                                                                                        |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.004 sec)

mysql> select CASE 'aprilis'  WHEN 'janvaris' THEN 'January' WHEN 'februaris' THEN 'Feruary' WHEN 'marts' THEN 'March' WHEN 'aprilis' THEN 'April' WHEN 'maijs' THEN 'May' WHEN 'junijs' THEN 'June' WHEN 'julijs' THEN 'July' WHEN 'augusts' THEN 'August' WHEN 'septembris' THEN 'September' WHEN 'oktobris' THEN 'October' WHEN 'novembris' THEN 'November' WHEN 'decembris' THEN 'December' END AS month_name;
+------------+
| month_name |
+------------+
| April      |
+------------+
1 row in set (0.003 sec)

mysql> select CASE SUBSTRING_INDEX('1919.gada 11. novembris', ' ', -1) 
    -> WHEN 'janvaris' THEN 'January'
    -> WHEN 'februaris' THEN 'Feruary'
    -> WHEN 'marts' THEN 'March'
    -> WHEN 'aprilis' THEN 'April'
    -> WHEN 'maijs' THEN 'May'
    -> WHEN 'junijs' THEN 'June'
    -> WHEN 'julijs' THEN 'July'
    -> WHEN 'augusts' THEN 'August'
    -> WHEN 'septembris' THEN 'September'
    -> WHEN 'oktobris' THEN 'October'
    -> WHEN 'novembris' THEN 'November'
    -> WHEN 'decembris' THEN 'December' 
    -> END AS month_name;
+------------+
| month_name |
+------------+
| November   |
+------------+
1 row in set (0.003 sec)

mysql> select SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1) AS year, SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) AS day, 
    -> CASE SUBSTRING_INDEX('1919.gada 11. novembris', ' ', -1)
    -> WHEN 'janvaris' THEN 'January'
    -> WHEN 'februaris' THEN 'Feruary'
    -> WHEN 'marts' THEN 'March'
    -> WHEN 'aprilis' THEN 'April'
    -> WHEN 'maijs' THEN 'May'
    -> WHEN 'junijs' THEN 'June'
    -> WHEN 'julijs' THEN 'July'
    -> WHEN 'augusts' THEN 'August'
    -> WHEN 'septembris' THEN 'September'
    -> WHEN 'oktobris' THEN 'October'
    -> WHEN 'novembris' THEN 'November'
    -> WHEN 'decembris' THEN 'December' 
    -> END AS month_name;
+------+------+------------+
| year | day  | month_name |
+------+------+------------+
| 1919 | 11   | November   |
+------+------+------------+
1 row in set (0.004 sec)

mysql> select CONCAT(  SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 11. novembris', ' ', -1) WHEN 'janvaris' THEN 'January' WHEN 'februaris' THEN 'Feruary' WHEN 'marts' THEN 'March' WHEN 'aprilis' THEN 'April' WHEN 'maijs' THEN 'May' WHEN 'junijs' THEN 'June' WHEN 'julijs' THEN 'July' WHEN 'augusts' THEN 'August' WHEN 'septembris' THEN 'September' WHEN 'oktobris' THEN 'October' WHEN 'novembris' THEN 'November' WHEN 'decembris' THEN 'December' END  );
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| CONCAT(  SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 11. novembris', ' ', -1) WHEN 'janvaris' THEN 'Januar |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1919 11 November                                                                                                                                                                                                                                                |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.006 sec)

mysql> select STR_TO_DATE (   CONCAT(  SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 11. novembris', ' ', -1) WHEN 'janvaris' THEN 'January' WHEN 'februaris' THEN 'Feruary' WHEN 'marts' THEN 'March' WHEN 'aprilis' THEN 'April' WHEN 'maijs' THEN 'May' WHEN 'junijs' THEN 'June' WHEN 'julijs' THEN 'July' WHEN 'augusts' THEN 'August' WHEN 'septembris' THEN 'September' WHEN 'oktobris' THEN 'October' WHEN 'novembris' THEN 'November' WHEN 'decembris' THEN 'December' END  ), '%Y %e %M'   ) ;
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| STR_TO_DATE (   CONCAT(  SUBSTRING_INDEX('1919.gada 11. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 11. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 11. novembris', ' ', -1) WHEN 'janvar |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1919-11-11                                                                                                                                                                                                                                                      |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.004 sec)

mysql> select STR_TO_DATE (   CONCAT(  SUBSTRING_INDEX('1919.gada 12. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 12. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 12. novembris', ' ', -1) WHEN 'janvaris' THEN 'January' WHEN 'februaris' THEN 'Feruary' WHEN 'marts' THEN 'March' WHEN 'aprilis' THEN 'April' WHEN 'maijs' THEN 'May' WHEN 'junijs' THEN 'June' WHEN 'julijs' THEN 'July' WHEN 'augusts' THEN 'August' WHEN 'septembris' THEN 'September' WHEN 'oktobris' THEN 'October' WHEN 'novembris' THEN 'November' WHEN 'decembris' THEN 'December' END  ), '%Y %e %M'   ) ;
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| STR_TO_DATE (   CONCAT(  SUBSTRING_INDEX('1919.gada 12. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 12. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 12. novembris', ' ', -1) WHEN 'janvar |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1919-11-12                                                                                                                                                                                                                                                      |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.004 sec)

mysql> select CONCAT(    STR_TO_DATE (   CONCAT(  SUBSTRING_INDEX('1919.gada 12. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 12. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 12. novembris', ' ', -1) WHEN 'janvaris' THEN 'January' WHEN 'februaris' THEN 'Feruary' WHEN 'marts' THEN 'March' WHEN 'aprilis' THEN 'April' WHEN 'maijs' THEN 'May' WHEN 'junijs' THEN 'June' WHEN 'julijs' THEN 'July' WHEN 'augusts' THEN 'August' WHEN 'septembris' THEN 'September' WHEN 'oktobris' THEN 'October' WHEN 'novembris' THEN 'November' WHEN 'decembris' THEN 'December' END  ), '%Y %e %M'   ) , ' ', CURRENT_TIME()    ) ;
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| CONCAT(    STR_TO_DATE (   CONCAT(  SUBSTRING_INDEX('1919.gada 12. novembris', '.', 1), ' ', SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 12. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , ' ', CASE SUBSTRING_INDEX('1919.gada 12. novembris', ' ', -1) W |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1919-11-12 22:21:03                                                                                                                                                                                                                                             |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.004 sec)

mysql> SELECT * FROM country_copy LIMIT 11;
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
|          4 | Angola         | 2006-02-15 04:44:00 |
|          5 | Anguilla       | 2006-02-15 04:44:00 |
|          6 | Argentina      | 2006-02-15 04:44:00 |
|          7 | Armenia        | 2006-02-15 04:44:00 |
|          8 | Australia      | 2006-02-15 04:44:00 |
|          9 | Austria        | 2006-02-15 04:44:00 |
|         10 | Azerbaijan     | 2006-02-15 04:44:00 |
|         11 | Bahrain        | 2006-02-15 04:44:00 |
+------------+----------------+---------------------+
11 rows in set (0.009 sec)

mysql> DESCRIBE country_copy;
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| Field       | Type                 | Null | Key | Default             | Extra                         |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
| country_id  | smallint(5) unsigned | NO   |     | 0                   |                               |
| country     | varchar(50)          | NO   |     | NULL                |                               |
| last_update | timestamp            | NO   |     | current_timestamp() | on update current_timestamp() |
+-------------+----------------------+------+-----+---------------------+-------------------------------+
3 rows in set (0.056 sec)

mysql> UPDATE country_copy SET country = 'Bahrain2';
Query OK, 109 rows affected (0.167 sec)
Rows matched: 109  Changed: 109  Warnings: 0

mysql> SELECT * FROM country_copy LIMIT 11;
+------------+----------+---------------------+
| country_id | country  | last_update         |
+------------+----------+---------------------+
|          1 | Bahrain2 | 2022-05-23 22:31:49 |
|          2 | Bahrain2 | 2022-05-23 22:31:49 |
|          3 | Bahrain2 | 2022-05-23 22:31:49 |
|          4 | Bahrain2 | 2022-05-23 22:31:49 |
|          5 | Bahrain2 | 2022-05-23 22:31:49 |
|          6 | Bahrain2 | 2022-05-23 22:31:49 |
|          7 | Bahrain2 | 2022-05-23 22:31:49 |
|          8 | Bahrain2 | 2022-05-23 22:31:49 |
|          9 | Bahrain2 | 2022-05-23 22:31:49 |
|         10 | Bahrain2 | 2022-05-23 22:31:49 |
|         11 | Bahrain2 | 2022-05-23 22:31:49 |
+------------+----------+---------------------+
11 rows in set (0.006 sec)

mysql> DROP TABLE country_copy;
Query OK, 0 rows affected (0.080 sec)

mysql> CREATE TABLE country_copy AS SELECT * FROM sakila.country;
Query OK, 109 rows affected (0.233 sec)
Records: 109  Duplicates: 0  Warnings: 0

mysql> UPDATE country_copy SET country = 'Bahrain2' WHERE country_id = 11;
Query OK, 1 row affected (0.024 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM country_copy LIMIT 11;
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
|          4 | Angola         | 2006-02-15 04:44:00 |
|          5 | Anguilla       | 2006-02-15 04:44:00 |
|          6 | Argentina      | 2006-02-15 04:44:00 |
|          7 | Armenia        | 2006-02-15 04:44:00 |
|          8 | Australia      | 2006-02-15 04:44:00 |
|          9 | Austria        | 2006-02-15 04:44:00 |
|         10 | Azerbaijan     | 2006-02-15 04:44:00 |
|         11 | Bahrain2       | 2022-05-23 22:34:59 |
+------------+----------------+---------------------+
11 rows in set (0.006 sec)

mysql> ALTER TABLE country_copy MODIFY COLUMN last_update DATETIME;
Query OK, 109 rows affected (0.922 sec)
Records: 109  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM country_copy LIMIT 11;
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
|          4 | Angola         | 2006-02-15 04:44:00 |
|          5 | Anguilla       | 2006-02-15 04:44:00 |
|          6 | Argentina      | 2006-02-15 04:44:00 |
|          7 | Armenia        | 2006-02-15 04:44:00 |
|          8 | Australia      | 2006-02-15 04:44:00 |
|          9 | Austria        | 2006-02-15 04:44:00 |
|         10 | Azerbaijan     | 2006-02-15 04:44:00 |
|         11 | Bahrain2       | 2022-05-23 22:34:59 |
+------------+----------------+---------------------+
11 rows in set (0.036 sec)

mysql> UPDATE country_copy SET country = 'Bahrain' WHERE country_id = 11;
Query OK, 1 row affected (0.057 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM country_copy LIMIT 11;
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
|          4 | Angola         | 2006-02-15 04:44:00 |
|          5 | Anguilla       | 2006-02-15 04:44:00 |
|          6 | Argentina      | 2006-02-15 04:44:00 |
|          7 | Armenia        | 2006-02-15 04:44:00 |
|          8 | Australia      | 2006-02-15 04:44:00 |
|          9 | Austria        | 2006-02-15 04:44:00 |
|         10 | Azerbaijan     | 2006-02-15 04:44:00 |
|         11 | Bahrain        | 2022-05-23 22:34:59 |
+------------+----------------+---------------------+
11 rows in set (0.005 sec)

mysql> UPDATE country_copy SET last_update = 
    -> 
    -> CONCAT(    
    -> STR_TO_DATE (   CONCAT(  SUBSTRING_INDEX('1919.gada 12. novembris', '.', 1), 
    -> ' ', 
    -> SUBSTR(  SUBSTRING_INDEX( SUBSTRING_INDEX('1919.gada 12. novembris', ' ', 2), ' ', -1 ), 1, 2  ) , 
    -> ' ', 
    -> CASE 
    -> SUBSTRING_INDEX('1919.gada 12. novembris', ' ', -1) 
    -> WHEN 'janvaris' THEN 'January' 
    -> WHEN 'februaris' THEN 'Feruary' 
    -> WHEN 'marts' THEN 'March' 
    -> WHEN 'aprilis' THEN 'April' 
    -> WHEN 'maijs' THEN 'May' 
    -> WHEN 'junijs' THEN 'June' 
    -> WHEN 'julijs' THEN 'July' 
    -> WHEN 'augusts' THEN 'August' 
    -> WHEN 'septembris' THEN 'September' 
    -> WHEN 'oktobris' THEN 'October' 
    -> WHEN 'novembris' THEN 'November' 
    -> WHEN 'decembris' THEN 'December' 
    -> END  ), '%Y %e %M'   ) , 
    -> ' ', 
    -> CURRENT_TIME()
    ->     ) 
    -> 
    -> WHERE country_id = 11;
Query OK, 1 row affected (0.060 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM country_copy LIMIT 11;
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
|          4 | Angola         | 2006-02-15 04:44:00 |
|          5 | Anguilla       | 2006-02-15 04:44:00 |
|          6 | Argentina      | 2006-02-15 04:44:00 |
|          7 | Armenia        | 2006-02-15 04:44:00 |
|          8 | Australia      | 2006-02-15 04:44:00 |
|          9 | Austria        | 2006-02-15 04:44:00 |
|         10 | Azerbaijan     | 2006-02-15 04:44:00 |
|         11 | Bahrain        | 1919-11-12 22:44:08 |
+------------+----------------+---------------------+
11 rows in set (0.006 sec)

mysql> USE sakila;

Database changed
mysql> SHOW TABLES;
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
23 rows in set (0.004 sec)

mysql> SELECT * FROM payment;
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
| payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
|          1 |           1 |        1 |        76 |   2.99 | 2005-05-25 11:30:37 | 2006-02-15 22:12:30 |
|          2 |           1 |        1 |       573 |   0.99 | 2005-05-28 10:35:23 | 2006-02-15 22:12:30 |
|          3 |           1 |        1 |      1185 |   5.99 | 2005-06-15 00:54:12 | 2006-02-15 22:12:30 |
|          4 |           1 |        2 |      1422 |   0.99 | 2005-06-15 18:02:53 | 2006-02-15 22:12:30 |
|          5 |           1 |        2 |      1476 |   9.99 | 2005-06-15 21:08:46 | 2006-02-15 22:12:30 |
|          6 |           1 |        1 |      1725 |   4.99 | 2005-06-16 15:18:57 | 2006-02-15 22:12:30 |
|          7 |           1 |        1 |      2308 |   4.99 | 2005-06-18 08:41:48 | 2006-02-15 22:12:30 |
|          8 |           1 |        2 |      2363 |   0.99 | 2005-06-18 13:33:59 | 2006-02-15 22:12:30 |
|          9 |           1 |        1 |      3284 |   3.99 | 2005-06-21 06:24:45 | 2006-02-15 22:12:30 |
|         10 |           1 |        2 |      4526 |   5.99 | 2005-07-08 03:17:05 | 2006-02-15 22:12:30 |



|      16040 |         599 |        1 |      8965 |   6.99 | 2005-07-30 03:52:37 | 2006-02-15 22:24:11 |
|      16041 |         599 |        2 |      9630 |   2.99 | 2005-07-31 04:57:07 | 2006-02-15 22:24:11 |
|      16042 |         599 |        2 |      9679 |   2.99 | 2005-07-31 06:41:19 | 2006-02-15 22:24:11 |
|      16043 |         599 |        2 |     11522 |   3.99 | 2005-08-17 00:05:05 | 2006-02-15 22:24:11 |
|      16044 |         599 |        1 |     14233 |   1.99 | 2005-08-21 05:07:08 | 2006-02-15 22:24:12 |
|      16045 |         599 |        1 |     14599 |   4.99 | 2005-08-21 17:43:42 | 2006-02-15 22:24:12 |
|      16046 |         599 |        1 |     14719 |   1.99 | 2005-08-21 21:41:57 | 2006-02-15 22:24:12 |
|      16047 |         599 |        2 |     15590 |   8.99 | 2005-08-23 06:09:44 | 2006-02-15 22:24:12 |
|      16048 |         599 |        2 |     15719 |   2.99 | 2005-08-23 11:08:46 | 2006-02-15 22:24:13 |
|      16049 |         599 |        2 |     15725 |   2.99 | 2005-08-23 11:25:00 | 2006-02-15 22:24:13 |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
16049 rows in set (1.313 sec)

mysql> SELECT * FROM payment LIMIT 10;
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
| payment_id | customer_id | staff_id | rental_id | amount | payment_date        | last_update         |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
|          1 |           1 |        1 |        76 |   2.99 | 2005-05-25 11:30:37 | 2006-02-15 22:12:30 |
|          2 |           1 |        1 |       573 |   0.99 | 2005-05-28 10:35:23 | 2006-02-15 22:12:30 |
|          3 |           1 |        1 |      1185 |   5.99 | 2005-06-15 00:54:12 | 2006-02-15 22:12:30 |
|          4 |           1 |        2 |      1422 |   0.99 | 2005-06-15 18:02:53 | 2006-02-15 22:12:30 |
|          5 |           1 |        2 |      1476 |   9.99 | 2005-06-15 21:08:46 | 2006-02-15 22:12:30 |
|          6 |           1 |        1 |      1725 |   4.99 | 2005-06-16 15:18:57 | 2006-02-15 22:12:30 |
|          7 |           1 |        1 |      2308 |   4.99 | 2005-06-18 08:41:48 | 2006-02-15 22:12:30 |
|          8 |           1 |        2 |      2363 |   0.99 | 2005-06-18 13:33:59 | 2006-02-15 22:12:30 |
|          9 |           1 |        1 |      3284 |   3.99 | 2005-06-21 06:24:45 | 2006-02-15 22:12:30 |
|         10 |           1 |        2 |      4526 |   5.99 | 2005-07-08 03:17:05 | 2006-02-15 22:12:30 |
+------------+-------------+----------+-----------+--------+---------------------+---------------------+
10 rows in set (0.016 sec)

mysql> SELECT MAX(AMOUNT) FROM payment;
+-------------+
| MAX(AMOUNT) |
+-------------+
|       11.99 |
+-------------+
1 row in set (0.320 sec)

mysql> SELECT MAX(amount), customer_id  FROM payment;
+-------------+-------------+
| MAX(amount) | customer_id |
+-------------+-------------+
|       11.99 |           1 |
+-------------+-------------+
1 row in set (0.337 sec)

mysql> SELECT MAX(amount) FROM payment GROUP BY customer_id LIMIT 10;
+-------------+
| MAX(amount) |
+-------------+
|        9.99 |
|       10.99 |
|       10.99 |
|        8.99 |
|        9.99 |
|        7.99 |
|        8.99 |
|        9.99 |
|        7.99 |
|        8.99 |
+-------------+
10 rows in set (0.045 sec)

mysql> SELECT MAX(amount) FROM payment GROUP BY customer_id;
+-------------+
| MAX(amount) |
+-------------+
|        9.99 |
|       10.99 |
|       10.99 |
|        8.99 |
|        9.99 |
|        7.99 |
|        8.99 |
|        9.99 |
|        7.99 |
|        8.99 |
|        9.99 |
|       10.99 |




|        9.99 |
|        8.99 |
|        9.99 |
|        8.99 |
|        8.99 |
|        7.99 |
|        9.99 |
|        9.99 |
|       11.99 |
|       11.99 |
|        8.99 |
|        8.99 |
|       10.99 |
|        6.99 |
|        8.99 |
|        7.99 |
|        9.99 |
+-------------+
599 rows in set (1.202 sec)

mysql> SELECT MAX(amount) FROM payment GROUP BY customer_id HAVING MAX(amount) >= 10;
+-------------+
| MAX(amount) |
+-------------+
|       10.99 |
|       10.99 |
|       10.99 |
|       11.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |




|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       10.99 |
|       11.99 |
|       11.99 |
|       10.99 |
+-------------+
107 rows in set (1.284 sec)

mysql> exit;
