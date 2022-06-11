mysql> USE sakila;
mysql> SELECT * FROM film AS flm LIMIT 10;
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
| film_id | title            | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|       2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       3 | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      |         2006 |           1 |                 NULL |               7 |        2.99 |     50 |            18.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
|       5 | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                   | 2006-02-15 05:03:42 |
|       6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                   | 2006-02-15 05:03:42 |
|       7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                     |         2006 |           1 |                 NULL |               6 |        4.99 |     62 |            28.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                         |         2006 |           1 |                 NULL |               6 |        4.99 |     54 |            15.99 | R      | Trailers                         | 2006-02-15 05:03:42 |
|       9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|      10 | ALADDIN CALENDAR | A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China                             |         2006 |           1 |                 NULL |               6 |        4.99 |     63 |            24.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
10 rows in set (0.019 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year, flm.rental_duration, flm.length FROM film AS flm LIMIT 5;
+---------+------------------+--------------+-----------------+--------+
| film_id | title            | release_year | rental_duration | length |
+---------+------------------+--------------+-----------------+--------+
|       1 | ACADEMY DINOSAUR |         2006 |               6 |     86 |
|       2 | ACE GOLDFINGER   |         2006 |               3 |     48 |
|       3 | ADAPTATION HOLES |         2006 |               7 |     50 |
|       4 | AFFAIR PREJUDICE |         2006 |               5 |    117 |
|       5 | AFRICAN EGG      |         2006 |               6 |    130 |
+---------+------------------+--------------+-----------------+--------+
5 rows in set (0.011 sec)

mysql> SELECT * FROM film_category AS category;
+---------+-------------+---------------------+
| film_id | category_id | last_update         |
+---------+-------------+---------------------+
|       1 |           6 | 2006-02-15 05:07:09 |
|       2 |          11 | 2006-02-15 05:07:09 |
|       3 |           6 | 2006-02-15 05:07:09 |
|       4 |          11 | 2006-02-15 05:07:09 |
|       5 |           8 | 2006-02-15 05:07:09 |
|       6 |           9 | 2006-02-15 05:07:09 |
|       7 |           5 | 2006-02-15 05:07:09 |
|       8 |          11 | 2006-02-15 05:07:09 |
|       9 |          11 | 2006-02-15 05:07:09 |
|      10 |          15 | 2006-02-15 05:07:09 |
|      11 |           9 | 2006-02-15 05:07:09 |
|      12 |          12 | 2006-02-15 05:07:09 |





|     979 |           7 | 2006-02-15 05:07:09 |
|     980 |          12 | 2006-02-15 05:07:09 |
|     981 |          16 | 2006-02-15 05:07:09 |
|     982 |           1 | 2006-02-15 05:07:09 |
|     983 |          12 | 2006-02-15 05:07:09 |
|     984 |           9 | 2006-02-15 05:07:09 |
|     985 |          14 | 2006-02-15 05:07:09 |
|     986 |           2 | 2006-02-15 05:07:09 |
|     987 |          12 | 2006-02-15 05:07:09 |
|     988 |          16 | 2006-02-15 05:07:09 |
|     989 |          16 | 2006-02-15 05:07:09 |
|     990 |          11 | 2006-02-15 05:07:09 |
|     991 |           1 | 2006-02-15 05:07:09 |
|     992 |           6 | 2006-02-15 05:07:09 |
|     993 |           3 | 2006-02-15 05:07:09 |
|     994 |          13 | 2006-02-15 05:07:09 |
|     995 |          11 | 2006-02-15 05:07:09 |
|     996 |           6 | 2006-02-15 05:07:09 |
|     997 |          12 | 2006-02-15 05:07:09 |
|     998 |          11 | 2006-02-15 05:07:09 |
|     999 |           3 | 2006-02-15 05:07:09 |
|    1000 |           5 | 2006-02-15 05:07:09 |
+---------+-------------+---------------------+
1000 rows in set (0.119 sec)

mysql> SELECT * FROM film_category AS f_category LIMIT 5;
+---------+-------------+---------------------+
| film_id | category_id | last_update         |
+---------+-------------+---------------------+
|       1 |           6 | 2006-02-15 05:07:09 |
|       2 |          11 | 2006-02-15 05:07:09 |
|       3 |           6 | 2006-02-15 05:07:09 |
|       4 |          11 | 2006-02-15 05:07:09 |
|       5 |           8 | 2006-02-15 05:07:09 |
+---------+-------------+---------------------+
5 rows in set (0.005 sec)

mysql> SELECT * FROM category AS categ;
+-------------+-------------+---------------------+
| category_id | name        | last_update         |
+-------------+-------------+---------------------+
|           1 | Action      | 2006-02-15 04:46:27 |
|           2 | Animation   | 2006-02-15 04:46:27 |
|           3 | Children    | 2006-02-15 04:46:27 |
|           4 | Classics    | 2006-02-15 04:46:27 |
|           5 | Comedy      | 2006-02-15 04:46:27 |
|           6 | Documentary | 2006-02-15 04:46:27 |
|           7 | Drama       | 2006-02-15 04:46:27 |
|           8 | Family      | 2006-02-15 04:46:27 |
|           9 | Foreign     | 2006-02-15 04:46:27 |
|          10 | Games       | 2006-02-15 04:46:27 |
|          11 | Horror      | 2006-02-15 04:46:27 |
|          12 | Music       | 2006-02-15 04:46:27 |
|          13 | New         | 2006-02-15 04:46:27 |
|          14 | Sci-Fi      | 2006-02-15 04:46:27 |
|          15 | Sports      | 2006-02-15 04:46:27 |
|          16 | Travel      | 2006-02-15 04:46:27 |
+-------------+-------------+---------------------+
16 rows in set (0.007 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year, flm.rental_duration, flm.length FROM film AS flm LIMIT 5;
+---------+------------------+--------------+-----------------+--------+
| film_id | title            | release_year | rental_duration | length |
+---------+------------------+--------------+-----------------+--------+
|       1 | ACADEMY DINOSAUR |         2006 |               6 |     86 |
|       2 | ACE GOLDFINGER   |         2006 |               3 |     48 |
|       3 | ADAPTATION HOLES |         2006 |               7 |     50 |
|       4 | AFFAIR PREJUDICE |         2006 |               5 |    117 |
|       5 | AFRICAN EGG      |         2006 |               6 |    130 |
+---------+------------------+--------------+-----------------+--------+
5 rows in set (0.018 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, f_cat.film_id, f_cat.category_id AS categ FROM film AS flm INNER JOIN film_category AS f_cat ON flm.film_id = f_cat.film_id LIMIT 5;
+---------+---------------------+------+--------+---------+-------+
| film_id | title               | Year | length | film_id | categ |
+---------+---------------------+------+--------+---------+-------+
|      19 | AMADEUS HOLY        | 2006 |    113 |      19 |     1 |
|      21 | AMERICAN CIRCUS     | 2006 |    129 |      21 |     1 |
|      29 | ANTITRUST TOMATOES  | 2006 |    168 |      29 |     1 |
|      38 | ARK RIDGEMONT       | 2006 |     68 |      38 |     1 |
|      56 | BAREFOOT MANCHURIAN | 2006 |    129 |      56 |     1 |
+---------+---------------------+------+--------+---------+-------+
5 rows in set (0.069 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, f_cat.film_id, f_cat.category_id AS categ FROM film AS flm INNER JOIN film_category AS f_cat USING(film_id) LIMIT 5;
+---------+------------------+------+--------+---------+-------+
| film_id | title            | Year | length | film_id | categ |
+---------+------------------+------+--------+---------+-------+
|       1 | ACADEMY DINOSAUR | 2006 |     86 |       1 |     6 |
|       2 | ACE GOLDFINGER   | 2006 |     48 |       2 |    11 |
|       3 | ADAPTATION HOLES | 2006 |     50 |       3 |     6 |
|       4 | AFFAIR PREJUDICE | 2006 |    117 |       4 |    11 |
|       5 | AFRICAN EGG      | 2006 |    130 |       5 |     8 |
+---------+------------------+------+--------+---------+-------+
5 rows in set (0.016 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, f_cat.category_id AS catN, categ.category_id AS catN2, categ.name FROM film AS flm INNER JOIN film_category AS f_cat USING(film_id) INNER JOIN category AS categ USING(category_id) ORDER BY flm.film_id LIMIT 10;
+---------+------------------+------+--------+------+-------+-------------+
| film_id | title            | Year | length | catN | catN2 | name        |
+---------+------------------+------+--------+------+-------+-------------+
|       1 | ACADEMY DINOSAUR | 2006 |     86 |    6 |     6 | Documentary |
|       2 | ACE GOLDFINGER   | 2006 |     48 |   11 |    11 | Horror      |
|       3 | ADAPTATION HOLES | 2006 |     50 |    6 |     6 | Documentary |
|       4 | AFFAIR PREJUDICE | 2006 |    117 |   11 |    11 | Horror      |
|       5 | AFRICAN EGG      | 2006 |    130 |    8 |     8 | Family      |
|       6 | AGENT TRUMAN     | 2006 |    169 |    9 |     9 | Foreign     |
|       7 | AIRPLANE SIERRA  | 2006 |     62 |    5 |     5 | Comedy      |
|       8 | AIRPORT POLLOCK  | 2006 |     54 |   11 |    11 | Horror      |
|       9 | ALABAMA DEVIL    | 2006 |    114 |   11 |    11 | Horror      |
|      10 | ALADDIN CALENDAR | 2006 |     63 |   15 |    15 | Sports      |
+---------+------------------+------+--------+------+-------+-------------+
10 rows in set (0.305 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, categ.name AS 'Category' FROM film AS flm INNER JOIN film_category AS f_cat USING(film_id) INNER JOIN category AS categ USING(category_id) ORDER BY flm.film_id LIMIT 10;
+---------+------------------+------+--------+-------------+
| film_id | title            | Year | length | Category    |
+---------+------------------+------+--------+-------------+
|       1 | ACADEMY DINOSAUR | 2006 |     86 | Documentary |
|       2 | ACE GOLDFINGER   | 2006 |     48 | Horror      |
|       3 | ADAPTATION HOLES | 2006 |     50 | Documentary |
|       4 | AFFAIR PREJUDICE | 2006 |    117 | Horror      |
|       5 | AFRICAN EGG      | 2006 |    130 | Family      |
|       6 | AGENT TRUMAN     | 2006 |    169 | Foreign     |
|       7 | AIRPLANE SIERRA  | 2006 |     62 | Comedy      |
|       8 | AIRPORT POLLOCK  | 2006 |     54 | Horror      |
|       9 | ALABAMA DEVIL    | 2006 |    114 | Horror      |
|      10 | ALADDIN CALENDAR | 2006 |     63 | Sports      |
+---------+------------------+------+--------+-------------+
10 rows in set (0.316 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, categ.name AS 'Category' FROM film AS flm INNER JOIN film_category AS f_cat USING(film_id) INNER JOIN category AS categ USING(category_id) ORDER BY flm.film_id DESC LIMIT 10;
+---------+-------------------+------+--------+-------------+
| film_id | title             | Year | length | Category    |
+---------+-------------------+------+--------+-------------+
|    1000 | ZORRO ARK         | 2006 |     50 | Comedy      |
|     999 | ZOOLANDER FICTION | 2006 |    101 | Children    |
|     998 | ZHIVAGO CORE      | 2006 |    105 | Horror      |
|     997 | YOUTH KICK        | 2006 |    179 | Music       |
|     996 | YOUNG LANGUAGE    | 2006 |    183 | Documentary |
|     995 | YENTL IDAHO       | 2006 |     86 | Horror      |
|     994 | WYOMING STORM     | 2006 |    100 | New         |
|     993 | WRONG BEHAVIOR    | 2006 |    178 | Children    |
|     992 | WRATH MILE        | 2006 |    176 | Documentary |
|     991 | WORST BANGER      | 2006 |    185 | Action      |
+---------+-------------------+------+--------+-------------+
10 rows in set (0.343 sec)

mysql> INSERT INTO film (title, language_id, length) VALUES ('MYSQL in examples', 1, 20);
Query OK, 1 row affected (0.408 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS 'Year', flm.length FROM film AS flm ORDER BY flm.film_id DESC LIMIT 10;
+---------+-------------------+------+--------+
| film_id | title             | Year | length |
+---------+-------------------+------+--------+
|    1001 | MYSQL in examples | NULL |     20 |
|    1000 | ZORRO ARK         | 2006 |     50 |
|     999 | ZOOLANDER FICTION | 2006 |    101 |
|     998 | ZHIVAGO CORE      | 2006 |    105 |
|     997 | YOUTH KICK        | 2006 |    179 |
|     996 | YOUNG LANGUAGE    | 2006 |    183 |
|     995 | YENTL IDAHO       | 2006 |     86 |
|     994 | WYOMING STORM     | 2006 |    100 |
|     993 | WRONG BEHAVIOR    | 2006 |    178 |
|     992 | WRATH MILE        | 2006 |    176 |
+---------+-------------------+------+--------+
10 rows in set (0.014 sec)

mysql> SELECT * FROM film AS flm ORDER BY flm.film_id DESC LIMIT 1;
+---------+-------------------+-------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+------------------+---------------------+
| film_id | title             | description | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features | last_update         |
+---------+-------------------+-------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+------------------+---------------------+
|    1001 | MYSQL in examples | NULL        |         NULL |           1 |                 NULL |               3 |        4.99 |     20 |            19.99 | G      | NULL             | 2022-06-11 21:25:21 |
+---------+-------------------+-------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+------------------+---------------------+
1 row in set (0.024 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, categ.name AS 'Category' FROM film AS flm INNER JOIN film_category AS f_cat USING(film_id) INNER JOIN category AS categ USING(category_id) ORDER BY flm.film_id DESC LIMIT 10;
+---------+-------------------+------+--------+-------------+
| film_id | title             | Year | length | Category    |
+---------+-------------------+------+--------+-------------+
|    1000 | ZORRO ARK         | 2006 |     50 | Comedy      |
|     999 | ZOOLANDER FICTION | 2006 |    101 | Children    |
|     998 | ZHIVAGO CORE      | 2006 |    105 | Horror      |
|     997 | YOUTH KICK        | 2006 |    179 | Music       |
|     996 | YOUNG LANGUAGE    | 2006 |    183 | Documentary |
|     995 | YENTL IDAHO       | 2006 |     86 | Horror      |
|     994 | WYOMING STORM     | 2006 |    100 | New         |
|     993 | WRONG BEHAVIOR    | 2006 |    178 | Children    |
|     992 | WRATH MILE        | 2006 |    176 | Documentary |
|     991 | WORST BANGER      | 2006 |    185 | Action      |
+---------+-------------------+------+--------+-------------+
10 rows in set (0.315 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, categ.name AS 'Category' FROM film AS flm LEFT JOIN film_category AS f_cat USING(film_id) INNER JOIN category AS categ USING(category_id) ORDER BY flm.film_id DESC LIMIT 10;
+---------+-------------------+------+--------+-------------+
| film_id | title             | Year | length | Category    |
+---------+-------------------+------+--------+-------------+
|    1000 | ZORRO ARK         | 2006 |     50 | Comedy      |
|     999 | ZOOLANDER FICTION | 2006 |    101 | Children    |
|     998 | ZHIVAGO CORE      | 2006 |    105 | Horror      |
|     997 | YOUTH KICK        | 2006 |    179 | Music       |
|     996 | YOUNG LANGUAGE    | 2006 |    183 | Documentary |
|     995 | YENTL IDAHO       | 2006 |     86 | Horror      |
|     994 | WYOMING STORM     | 2006 |    100 | New         |
|     993 | WRONG BEHAVIOR    | 2006 |    178 | Children    |
|     992 | WRATH MILE        | 2006 |    176 | Documentary |
|     991 | WORST BANGER      | 2006 |    185 | Action      |
+---------+-------------------+------+--------+-------------+
10 rows in set (0.309 sec)

mysql> SELECT flm.film_id, flm.title, flm.release_year AS Year, flm.length, categ.name AS 'Category' FROM film AS flm LEFT JOIN film_category AS f_cat USING(film_id) LEFT JOIN category AS categ USING(category_id) ORDER BY flm.film_id DESC LIMIT 10;
+---------+-------------------+------+--------+-------------+
| film_id | title             | Year | length | Category    |
+---------+-------------------+------+--------+-------------+
|    1001 | MYSQL in examples | NULL |     20 | NULL        |
|    1000 | ZORRO ARK         | 2006 |     50 | Comedy      |
|     999 | ZOOLANDER FICTION | 2006 |    101 | Children    |
|     998 | ZHIVAGO CORE      | 2006 |    105 | Horror      |
|     997 | YOUTH KICK        | 2006 |    179 | Music       |
|     996 | YOUNG LANGUAGE    | 2006 |    183 | Documentary |
|     995 | YENTL IDAHO       | 2006 |     86 | Horror      |
|     994 | WYOMING STORM     | 2006 |    100 | New         |
|     993 | WRONG BEHAVIOR    | 2006 |    178 | Children    |
|     992 | WRATH MILE        | 2006 |    176 | Documentary |
+---------+-------------------+------+--------+-------------+
10 rows in set (0.037 sec)

mysql> exit;
