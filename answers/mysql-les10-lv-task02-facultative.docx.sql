mysql> USE sakila
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

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

mysql> SELECT * FROM film_actor AS f_act WHERE film_id = 1;
+----------+---------+---------------------+
| actor_id | film_id | last_update         |
+----------+---------+---------------------+
|        1 |       1 | 2006-02-15 05:05:03 |
|       10 |       1 | 2006-02-15 05:05:03 |
|       20 |       1 | 2006-02-15 05:05:03 |
|       30 |       1 | 2006-02-15 05:05:03 |
|       40 |       1 | 2006-02-15 05:05:03 |
|       53 |       1 | 2006-02-15 05:05:03 |
|      108 |       1 | 2006-02-15 05:05:03 |
|      162 |       1 | 2006-02-15 05:05:03 |
|      188 |       1 | 2006-02-15 05:05:03 |
|      198 |       1 | 2006-02-15 05:05:03 |
+----------+---------+---------------------+
10 rows in set (0.132 sec)

mysql> SELECT COUNT(*) FROM film_actor AS f_act WHERE film_id = 1;
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
1 row in set (0.009 sec)

mysql> SELECT COUNT(*) FROM film_actor AS f_act WHERE film_id = 2;
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
1 row in set (0.007 sec)

mysql> SELECT COUNT(*) FROM film_actor AS f_act WHERE film_id = 3;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.008 sec)

mysql> -- Filmas piedalas sekojo'sie aktieri (3 tabulas: film, film_actor un actor)
mysql> SELECT flm.film_id AS 'Nr.', flm.title, act.first_name AS 'Name', act.last_name AS 'Surname' FROM film AS flm JOIN film_actor USING(film_id) JOIN actor AS act USING(actor_id) LIMIT 17;
+-----+-----------------------+----------+---------+
| Nr. | title                 | Name     | Surname |
+-----+-----------------------+----------+---------+
|   1 | ACADEMY DINOSAUR      | PENELOPE | GUINESS |
|  23 | ANACONDA CONFESSIONS  | PENELOPE | GUINESS |
|  25 | ANGELS LIFE           | PENELOPE | GUINESS |
| 106 | BULWORTH COMMANDMENTS | PENELOPE | GUINESS |
| 140 | CHEAPER CLYDE         | PENELOPE | GUINESS |
| 166 | COLOR PHILADELPHIA    | PENELOPE | GUINESS |
| 277 | ELEPHANT TROJAN       | PENELOPE | GUINESS |
| 361 | GLEAMING JAWBREAKER   | PENELOPE | GUINESS |
| 438 | HUMAN GRAFFITI        | PENELOPE | GUINESS |
| 499 | KING EVOLUTION        | PENELOPE | GUINESS |
| 506 | LADY STAGE            | PENELOPE | GUINESS |
| 509 | LANGUAGE COWBOY       | PENELOPE | GUINESS |
| 605 | MULHOLLAND BEAST      | PENELOPE | GUINESS |
| 635 | OKLAHOMA JUMANJI      | PENELOPE | GUINESS |
| 749 | RULES HUMAN           | PENELOPE | GUINESS |
| 832 | SPLASH GUMP           | PENELOPE | GUINESS |
| 939 | VERTIGO NORTHWEST     | PENELOPE | GUINESS |
+-----+-----------------------+----------+---------+
17 rows in set (0.049 sec)

mysql> SELECT flm.film_id AS 'Nr.', flm.title, act.first_name AS 'Name', act.last_name AS 'Surname' FROM film AS flm JOIN film_actor USING(film_id) JOIN actor AS act USING(actor_id) ORDER BY flm.film_id LIMIT 17;
+-----+------------------+-----------+-----------+
| Nr. | title            | Name      | Surname   |
+-----+------------------+-----------+-----------+
|   1 | ACADEMY DINOSAUR | PENELOPE  | GUINESS   |
|   1 | ACADEMY DINOSAUR | CHRISTIAN | GABLE     |
|   1 | ACADEMY DINOSAUR | LUCILLE   | TRACY     |
|   1 | ACADEMY DINOSAUR | SANDRA    | PECK      |
|   1 | ACADEMY DINOSAUR | JOHNNY    | CAGE      |
|   1 | ACADEMY DINOSAUR | MENA      | TEMPLE    |
|   1 | ACADEMY DINOSAUR | WARREN    | NOLTE     |
|   1 | ACADEMY DINOSAUR | OPRAH     | KILMER    |
|   1 | ACADEMY DINOSAUR | ROCK      | DUKAKIS   |
|   1 | ACADEMY DINOSAUR | MARY      | KEITEL    |
|   2 | ACE GOLDFINGER   | BOB       | FAWCETT   |
|   2 | ACE GOLDFINGER   | MINNIE    | ZELLWEGER |
|   2 | ACE GOLDFINGER   | SEAN      | GUINESS   |
|   2 | ACE GOLDFINGER   | CHRIS     | DEPP      |
|   3 | ADAPTATION HOLES | NICK      | WAHLBERG  |
|   3 | ADAPTATION HOLES | BOB       | FAWCETT   |
|   3 | ADAPTATION HOLES | CAMERON   | STREEP    |
+-----+------------------+-----------+-----------+
17 rows in set (0.022 sec)

mysql> SELECT flm.film_id AS 'Nr.', flm.title, act.first_name AS 'Name', act.last_name AS 'Surname' FROM film AS flm JOIN film_actor USING(film_id) JOIN actor AS act USING(actor_id) WHERE flm.film_id = 3;
+-----+------------------+----------+-----------+
| Nr. | title            | Name     | Surname   |
+-----+------------------+----------+-----------+
|   3 | ADAPTATION HOLES | NICK     | WAHLBERG  |
|   3 | ADAPTATION HOLES | BOB      | FAWCETT   |
|   3 | ADAPTATION HOLES | CAMERON  | STREEP    |
|   3 | ADAPTATION HOLES | RAY      | JOHANSSON |
|   3 | ADAPTATION HOLES | JULIANNE | DENCH     |
+-----+------------------+----------+-----------+
5 rows in set (0.015 sec)

mysql> SELECT flm.film_id AS 'Nr.', flm.title, act.first_name AS 'Name', act.last_name AS 'Surname' FROM film AS flm JOIN film_actor USING(film_id) JOIN actor AS act USING(actor_id) WHERE flm.film_id >= 4 AND flm.film_id <=6;
+-----+------------------+----------+-----------+
| Nr. | title            | Name     | Surname   |
+-----+------------------+----------+-----------+
|   4 | AFFAIR PREJUDICE | JODIE    | DEGENERES |
|   4 | AFFAIR PREJUDICE | SCARLETT | DAMON     |
|   4 | AFFAIR PREJUDICE | KENNETH  | PESCI     |
|   4 | AFFAIR PREJUDICE | FAY      | WINSLET   |
|   4 | AFFAIR PREJUDICE | OPRAH    | KILMER    |
|   5 | AFRICAN EGG      | GARY     | PHOENIX   |
|   5 | AFRICAN EGG      | DUSTIN   | TAUTOU    |
|   5 | AFRICAN EGG      | MATTHEW  | LEIGH     |
|   5 | AFRICAN EGG      | MATTHEW  | CARREY    |
|   5 | AFRICAN EGG      | THORA    | TEMPLE    |
|   6 | AGENT TRUMAN     | KIRSTEN  | PALTROW   |
|   6 | AGENT TRUMAN     | SANDRA   | KILMER    |
|   6 | AGENT TRUMAN     | JAYNE    | NEESON    |
|   6 | AGENT TRUMAN     | WARREN   | NOLTE     |
|   6 | AGENT TRUMAN     | MORGAN   | WILLIAMS  |
|   6 | AGENT TRUMAN     | KENNETH  | HOFFMAN   |
|   6 | AGENT TRUMAN     | REESE    | WEST      |
+-----+------------------+----------+-----------+
17 rows in set (0.020 sec)

mysql> SELECT * FROM country LIMIT 5;
+------------+----------------+---------------------+
| country_id | country        | last_update         |
+------------+----------------+---------------------+
|          1 | Afghanistan    | 2006-02-15 04:44:00 |
|          2 | Algeria        | 2006-02-15 04:44:00 |
|          3 | American Samoa | 2006-02-15 04:44:00 |
|          4 | Angola         | 2006-02-15 04:44:00 |
|          5 | Anguilla       | 2006-02-15 04:44:00 |
+------------+----------------+---------------------+
5 rows in set (0.012 sec)

mysql> SELECT * FROM city LIMIT 5;
+---------+--------------------+------------+---------------------+
| city_id | city               | country_id | last_update         |
+---------+--------------------+------------+---------------------+
|       1 | A Corua (La Corua) |         87 | 2006-02-15 04:45:25 |
|       2 | Abha               |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi          |        101 | 2006-02-15 04:45:25 |
|       4 | Acua               |         60 | 2006-02-15 04:45:25 |
|       5 | Adana              |         97 | 2006-02-15 04:45:25 |
+---------+--------------------+------------+---------------------+
5 rows in set (0.012 sec)

mysql> SELECT * FROM address LIMIT 5;
+------------+----------------------+----------+----------+---------+-------------+-------------+---------------------+
| address_id | address              | address2 | district | city_id | postal_code | phone       | last_update         |
+------------+----------------------+----------+----------+---------+-------------+-------------+---------------------+
|          1 | 47 MySakila Drive    | NULL     | Alberta  |     300 |             |             | 2014-09-25 22:30:27 |
|          2 | 28 MySQL Boulevard   | NULL     | QLD      |     576 |             |             | 2014-09-25 22:30:09 |
|          3 | 23 Workhaven Lane    | NULL     | Alberta  |     300 |             | 14033335568 | 2014-09-25 22:30:27 |
|          4 | 1411 Lillydale Drive | NULL     | QLD      |     576 |             | 6172235589  | 2014-09-25 22:30:09 |
|          5 | 1913 Hanoi Way       |          | Nagasaki |     463 | 35200       | 28303384290 | 2014-09-25 22:31:53 |
+------------+----------------------+----------+----------+---------+-------------+-------------+---------------------+
5 rows in set (0.015 sec)

mysql> SELECT COUNT(DISTINCT city_id) FROM address;
+-------------------------+
| COUNT(DISTINCT city_id) |
+-------------------------+
|                     599 |
+-------------------------+
1 row in set (0.076 sec)

mysql> -- Adrese (2 tabulas: address un city)
mysql> SELECT adr.address_id, adr.address, adr.district, cit.city_id, cit.city FROM address AS adr JOIN city AS cit USING(city_id) LIMIT 15;
+------------+------------------------------------+----------------+---------+----------------+
| address_id | address                            | district       | city_id | city           |
+------------+------------------------------------+----------------+---------+----------------+
|          1 | 47 MySakila Drive                  | Alberta        |     300 | Lethbridge     |
|          2 | 28 MySQL Boulevard                 | QLD            |     576 | Woodridge      |
|          3 | 23 Workhaven Lane                  | Alberta        |     300 | Lethbridge     |
|          4 | 1411 Lillydale Drive               | QLD            |     576 | Woodridge      |
|          5 | 1913 Hanoi Way                     | Nagasaki       |     463 | Sasebo         |
|          6 | 1121 Loja Avenue                   | California     |     449 | San Bernardino |
|          7 | 692 Joliet Street                  | Attika         |      38 | Athenai        |
|          8 | 1566 Inegl Manor                   | Mandalay       |     349 | Myingyan       |
|          9 | 53 Idfu Parkway                    | Nantou         |     361 | Nantou         |
|         10 | 1795 Santiago de Compostela Way    | Texas          |     295 | Laredo         |
|         11 | 900 Santiago de Compostela Parkway | Central Serbia |     280 | Kragujevac     |
|         12 | 478 Joliet Way                     | Hamilton       |     200 | Hamilton       |
|         13 | 613 Korolev Drive                  | Masqat         |     329 | Masqat         |
|         14 | 1531 Sal Drive                     | Esfahan        |     162 | Esfahan        |
|         15 | 1542 Tarlac Parkway                | Kanagawa       |     440 | Sagamihara     |
+------------+------------------------------------+----------------+---------+----------------+
15 rows in set (0.012 sec)

mysql> -- Adrese (3 tabulas: address, city un country)
mysql> SELECT adr.address_id, adr.address, adr.district, cit.city_id, cit.city, cit.country_id, cot.country_id, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) LIMIT 15;
+------------+-------------------------------+--------------+---------+-----------------+------------+------------+----------------+
| address_id | address                       | district     | city_id | city            | country_id | country_id | country        |
+------------+-------------------------------+--------------+---------+-----------------+------------+------------+----------------+
|        222 | 1168 Najafabad Parkway        | Kabol        |     251 | Kabul           |          1 |          1 | Afghanistan    |
|        446 | 1924 Shimonoseki Drive        | Batna        |      59 | Batna           |          2 |          2 | Algeria        |
|         73 | 1031 Daugavpils Parkway       | Bchar        |      63 | Bchar           |          2 |          2 | Algeria        |
|        180 | 757 Rustenburg Avenue         | Skikda       |     483 | Skikda          |          2 |          2 | Algeria        |
|        325 | 1892 Nabereznyje Telny Lane   | Tutuila      |     516 | Tafuna          |          3 |          3 | American Samoa |
|        534 | 486 Ondo Parkway              | Benguela     |      67 | Benguela        |          4 |          4 | Angola         |
|        388 | 368 Hunuco Boulevard          | Namibe       |     360 | Namibe          |          4 |          4 | Angola         |
|        386 | 1368 Maracabo Boulevard       |              |     493 | South Hill      |          5 |          5 | Anguilla       |
|        364 | 1623 Kingstown Drive          | Buenos Aires |      20 | Almirante Brown |          6 |          6 | Argentina      |
|        566 | 1229 Varanasi (Benares) Manor | Buenos Aires |      43 | Avellaneda      |          6 |          6 | Argentina      |
|        327 | 1427 A Corua (La Corua) Place | Buenos Aires |      45 | Baha Blanca     |          6 |          6 | Argentina      |
|         28 | 96 Tafuna Way                 | Crdoba       |     128 | Crdoba          |          6 |          6 | Argentina      |
|        450 | 203 Tambaram Street           | Buenos Aires |     161 | Escobar         |          6 |          6 | Argentina      |
|        536 | 166 Jinchang Street           | Buenos Aires |     165 | Ezeiza          |          6 |          6 | Argentina      |
|         93 | 1926 El Alto Avenue           | Buenos Aires |     289 | La Plata        |          6 |          6 | Argentina      |
+------------+-------------------------------+--------------+---------+-----------------+------------+------------+----------------+
15 rows in set (0.017 sec)

mysql> SELECT adr.address_id, adr.address, adr.district, cit.city_id, cit.city, cit.country_id, cot.country_id, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) ORDER BY cit.city_id LIMIT 15;
+------------+---------------------------+----------------------+---------+--------------------+------------+------------+----------------------+
| address_id | address                   | district             | city_id | city               | country_id | country_id | country              |
+------------+---------------------------+----------------------+---------+--------------------+------------+------------+----------------------+
|         56 | 939 Probolinggo Loop      | Galicia              |       1 | A Corua (La Corua) |         87 |         87 | Spain                |
|        105 | 733 Mandaluyong Place     | Asir                 |       2 | Abha               |         82 |         82 | Saudi Arabia         |
|        457 | 535 Ahmadnagar Manor      | Abu Dhabi            |       3 | Abu Dhabi          |        101 |        101 | United Arab Emirates |
|        491 | 1789 Saint-Denis Parkway  | Coahuila de Zaragoza |       4 | Acua               |         60 |         60 | Mexico               |
|        332 | 663 Baha Blanca Parkway   | Adana                |       5 | Adana              |         97 |         97 | Turkey               |
|        397 | 614 Pak Kret Street       | Addis Abeba          |       6 | Addis Abeba        |         31 |         31 | Ethiopia             |
|        214 | 751 Lima Loop             | Aden                 |       7 | Aden               |        107 |        107 | Yemen                |
|        372 | 230 Urawa Drive           | Andhra Pradesh       |       8 | Adoni              |         44 |         44 | India                |
|        302 | 922 Vila Velha Loop       | Maharashtra          |       9 | Ahmadnagar         |         44 |         44 | India                |
|        580 | 923 Tangail Boulevard     | Tokyo-to             |      10 | Akishima           |         50 |         50 | Japan                |
|        484 | 98 Pyongyang Boulevard    | Ohio                 |      11 | Akron              |        103 |        103 | United States        |
|        102 | 669 Firozabad Loop        | Abu Dhabi            |      12 | al-Ayn             |        101 |        101 | United Arab Emirates |
|         74 | 1124 Buenaventura Drive   | Mekka                |      13 | al-Hawiya          |         82 |         82 | Saudi Arabia         |
|        596 | 1759 Niznekamsk Avenue    | al-Manama            |      14 | al-Manama          |         11 |         11 | Bahrain              |
|        400 | 1152 Citrus Heights Manor | al-Qadarif           |      15 | al-Qadarif         |         89 |         89 | Sudan                |
+------------+---------------------------+----------------------+---------+--------------------+------------+------------+----------------------+
15 rows in set (0.340 sec)

mysql> SELECT adr.address_id, adr.address, adr.district, cit.city, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) WHERE cot.country = 'India';
+------------+------------------------------+----------------+-------------------------+---------+
| address_id | address                      | district       | city                    | country |
+------------+------------------------------+----------------+-------------------------+---------+
|        372 | 230 Urawa Drive              | Andhra Pradesh | Adoni                   | India   |
|        302 | 922 Vila Velha Loop          | Maharashtra    | Ahmadnagar              | India   |
|        179 | 431 Xiangtan Avenue          | Kerala         | Allappuzha (Alleppey)   | India   |
|        229 | 1014 Loja Manor              | Tamil Nadu     | Ambattur                | India   |
|        540 | 949 Allende Lane             | Uttar Pradesh  | Amroha                  | India   |
|        212 | 624 Oshawa Boulevard         | West Bengali   | Balurghat               | India   |
|        418 | 126 Acua Parkway             | West Bengali   | Berhampore (Baharampur) | India   |
|        384 | 97 Mogiljov Lane             | Gujarat        | Bhavnagar               | India   |
|        213 | 43 Dadu Avenue               | Rajasthan      | Bhilwara                | India   |
|        535 | 635 Brest Manor              | Andhra Pradesh | Bhimavaram              | India   |
|         19 | 419 Iligan Lane              | Madhya Pradesh | Bhopal                  | India   |
|        206 | 642 Nador Drive              | Maharashtra    | Bhusawal                | India   |
|        473 | 1257 Guadalajara Street      | Karnataka      | Bijapur                 | India   |
|        171 | 1540 Wroclaw Drive           | Maharashtra    | Chandrapur              | India   |
|        514 | 1747 Rustenburg Place        | Bihar          | Chapra                  | India   |
|        445 | 495 Bhimavaram Lane          | Maharashtra    | Dhule (Dhulia)          | India   |
|        125 | 211 Chiayi Drive             | Uttar Pradesh  | Etawah                  | India   |
|        196 | 9 San Miguel de Tucumn Manor | Uttar Pradesh  | Firozabad               | India   |
|        121 | 1967 Sincelejo Place         | Gujarat        | Gandhinagar             | India   |
|        375 | 1049 Matamoros Parkway       | Karnataka      | Gulbarga                | India   |
|        190 | 435 0 Way                    | West Bengali   | Haldia                  | India   |
|        264 | 1027 Banjul Place            | West Bengali   | Halisahar               | India   |
|        417 | 791 Salinas Street           | Punjab         | Hoshiarpur              | India   |
|        140 | 788 Atinsk Street            | Karnataka      | Hubli-Dharwad           | India   |
|         64 | 81 Hodeida Way               | Rajasthan      | Jaipur                  | India   |
|         36 | 176 Mandaluyong Place        | Uttar Pradesh  | Jhansi                  | India   |
|        228 | 60 Poos de Caldas Street     | Rajasthan      | Jodhpur                 | India   |
|         35 | 33 Gorontalo Way             | West Bengali   | Kamarhati               | India   |
|        497 | 1013 Tabuk Boulevard         | West Bengali   | Kanchrapara             | India   |
|        279 | 1884 Shikarpur Avenue        | Haryana        | Karnal                  | India   |
|        424 | 1948 Bayugan Parkway         | Bihar          | Katihar                 | India   |
|        276 | 1675 Xiangfan Manor          | Tamil Nadu     | Kumbakonam              | India   |
|        321 | 651 Pathankot Loop           | Maharashtra    | Miraj                   | India   |
|         32 | 1425 Shikarpur Manor         | Bihar          | Munger (Monghyr)        | India   |
|         63 | 1213 Ranchi Parkway          | Karnataka      | Mysore                  | India   |
|        156 | 1963 Moscow Place            | Assam          | Nagaon                  | India   |
|        273 | 1519 Ilorin Place            | Kerala         | Palghat (Palakkad)      | India   |
|        305 | 41 El Alto Parkway           | Maharashtra    | Parbhani                | India   |
|         99 | 1697 Tanauan Lane            | Punjab         | Pathankot               | India   |
|        301 | 951 Stara Zagora Manor       | Punjab         | Patiala                 | India   |
|        426 | 1661 Abha Drive              | Tamil Nadu     | Pudukkottai             | India   |
|        139 | 943 Johannesburg Avenue      | Maharashtra    | Pune                    | India   |
|        431 | 1596 Acua Parkway            | Jharkhand      | Purnea (Purnia)         | India   |
|         82 | 936 Salzburg Lane            | Uttar Pradesh  | Rae Bareli              | India   |
|        560 | 1447 Imus Place              | Gujarat        | Rajkot                  | India   |
|        341 | 1920 Weifang Avenue          | Uttar Pradesh  | Rampur                  | India   |
|        363 | 604 Bern Place               | Jharkhand      | Ranchi                  | India   |
|        221 | 866 Shivapuri Manor          | Uttar Pradesh  | Sambhal                 | India   |
|        361 | 45 Aparecida de Goinia Place | Madhya Pradesh | Satna                   | India   |
|        242 | 1964 Gijn Manor              | Karnataka      | Shimoga                 | India   |
|         72 | 57 Arlington Manor           | Madhya Pradesh | Shivapuri               | India   |
|        507 | 1197 Sokoto Boulevard        | West Bengali   | Siliguri (Shiliguri)    | India   |
|        292 | 1993 Tabuk Lane              | Tamil Nadu     | Tambaram                | India   |
|        174 | 1877 Ezhou Lane              | Rajasthan      | Udaipur                 | India   |
|        451 | 1704 Tambaram Manor          | West Bengali   | Uluberia                | India   |
|        235 | 954 Kimchon Place            | West Bengali   | Uttarpara-Kotrung       | India   |
|        408 | 990 Etawah Loop              | Tamil Nadu     | Valparai                | India   |
|        127 | 117 Boa Vista Way            | Uttar Pradesh  | Varanasi (Benares)      | India   |
|        513 | 758 Korolev Parkway          | Andhra Pradesh | Vijayawada              | India   |
|         16 | 808 Bhopal Manor             | Haryana        | Yamuna Nagar            | India   |
+------------+------------------------------+----------------+-------------------------+---------+
60 rows in set (0.054 sec)

mysql> SELECT adr.address_id, adr.address, adr.district, cit.city, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) WHERE cot.country = 'India' ORDER BY cit.city_id;
+------------+------------------------------+----------------+-------------------------+---------+
| address_id | address                      | district       | city                    | country |
+------------+------------------------------+----------------+-------------------------+---------+
|        372 | 230 Urawa Drive              | Andhra Pradesh | Adoni                   | India   |
|        302 | 922 Vila Velha Loop          | Maharashtra    | Ahmadnagar              | India   |
|        179 | 431 Xiangtan Avenue          | Kerala         | Allappuzha (Alleppey)   | India   |
|        229 | 1014 Loja Manor              | Tamil Nadu     | Ambattur                | India   |
|        540 | 949 Allende Lane             | Uttar Pradesh  | Amroha                  | India   |
|        212 | 624 Oshawa Boulevard         | West Bengali   | Balurghat               | India   |
|        418 | 126 Acua Parkway             | West Bengali   | Berhampore (Baharampur) | India   |
|        384 | 97 Mogiljov Lane             | Gujarat        | Bhavnagar               | India   |
|        213 | 43 Dadu Avenue               | Rajasthan      | Bhilwara                | India   |
|        535 | 635 Brest Manor              | Andhra Pradesh | Bhimavaram              | India   |
|         19 | 419 Iligan Lane              | Madhya Pradesh | Bhopal                  | India   |
|        206 | 642 Nador Drive              | Maharashtra    | Bhusawal                | India   |
|        473 | 1257 Guadalajara Street      | Karnataka      | Bijapur                 | India   |
|        171 | 1540 Wroclaw Drive           | Maharashtra    | Chandrapur              | India   |
|        514 | 1747 Rustenburg Place        | Bihar          | Chapra                  | India   |
|        445 | 495 Bhimavaram Lane          | Maharashtra    | Dhule (Dhulia)          | India   |
|        125 | 211 Chiayi Drive             | Uttar Pradesh  | Etawah                  | India   |
|        196 | 9 San Miguel de Tucumn Manor | Uttar Pradesh  | Firozabad               | India   |
|        121 | 1967 Sincelejo Place         | Gujarat        | Gandhinagar             | India   |
|        375 | 1049 Matamoros Parkway       | Karnataka      | Gulbarga                | India   |
|        190 | 435 0 Way                    | West Bengali   | Haldia                  | India   |
|        264 | 1027 Banjul Place            | West Bengali   | Halisahar               | India   |
|        417 | 791 Salinas Street           | Punjab         | Hoshiarpur              | India   |
|        140 | 788 Atinsk Street            | Karnataka      | Hubli-Dharwad           | India   |
|         64 | 81 Hodeida Way               | Rajasthan      | Jaipur                  | India   |
|         36 | 176 Mandaluyong Place        | Uttar Pradesh  | Jhansi                  | India   |
|        228 | 60 Poos de Caldas Street     | Rajasthan      | Jodhpur                 | India   |
|         35 | 33 Gorontalo Way             | West Bengali   | Kamarhati               | India   |
|        497 | 1013 Tabuk Boulevard         | West Bengali   | Kanchrapara             | India   |
|        279 | 1884 Shikarpur Avenue        | Haryana        | Karnal                  | India   |
|        424 | 1948 Bayugan Parkway         | Bihar          | Katihar                 | India   |
|        276 | 1675 Xiangfan Manor          | Tamil Nadu     | Kumbakonam              | India   |
|        321 | 651 Pathankot Loop           | Maharashtra    | Miraj                   | India   |
|         32 | 1425 Shikarpur Manor         | Bihar          | Munger (Monghyr)        | India   |
|         63 | 1213 Ranchi Parkway          | Karnataka      | Mysore                  | India   |
|        156 | 1963 Moscow Place            | Assam          | Nagaon                  | India   |
|        273 | 1519 Ilorin Place            | Kerala         | Palghat (Palakkad)      | India   |
|        305 | 41 El Alto Parkway           | Maharashtra    | Parbhani                | India   |
|         99 | 1697 Tanauan Lane            | Punjab         | Pathankot               | India   |
|        301 | 951 Stara Zagora Manor       | Punjab         | Patiala                 | India   |
|        426 | 1661 Abha Drive              | Tamil Nadu     | Pudukkottai             | India   |
|        139 | 943 Johannesburg Avenue      | Maharashtra    | Pune                    | India   |
|        431 | 1596 Acua Parkway            | Jharkhand      | Purnea (Purnia)         | India   |
|         82 | 936 Salzburg Lane            | Uttar Pradesh  | Rae Bareli              | India   |
|        560 | 1447 Imus Place              | Gujarat        | Rajkot                  | India   |
|        341 | 1920 Weifang Avenue          | Uttar Pradesh  | Rampur                  | India   |
|        363 | 604 Bern Place               | Jharkhand      | Ranchi                  | India   |
|        221 | 866 Shivapuri Manor          | Uttar Pradesh  | Sambhal                 | India   |
|        361 | 45 Aparecida de Goinia Place | Madhya Pradesh | Satna                   | India   |
|        242 | 1964 Gijn Manor              | Karnataka      | Shimoga                 | India   |
|         72 | 57 Arlington Manor           | Madhya Pradesh | Shivapuri               | India   |
|        507 | 1197 Sokoto Boulevard        | West Bengali   | Siliguri (Shiliguri)    | India   |
|        292 | 1993 Tabuk Lane              | Tamil Nadu     | Tambaram                | India   |
|        174 | 1877 Ezhou Lane              | Rajasthan      | Udaipur                 | India   |
|        451 | 1704 Tambaram Manor          | West Bengali   | Uluberia                | India   |
|        235 | 954 Kimchon Place            | West Bengali   | Uttarpara-Kotrung       | India   |
|        408 | 990 Etawah Loop              | Tamil Nadu     | Valparai                | India   |
|        127 | 117 Boa Vista Way            | Uttar Pradesh  | Varanasi (Benares)      | India   |
|        513 | 758 Korolev Parkway          | Andhra Pradesh | Vijayawada              | India   |
|         16 | 808 Bhopal Manor             | Haryana        | Yamuna Nagar            | India   |
+------------+------------------------------+----------------+-------------------------+---------+
60 rows in set (0.055 sec)

mysql> SELECT adr.address_id, adr.address, adr.district, cit.city, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) WHERE cot.country = 'India' ORDER BY cit.city_id DESC;
+------------+------------------------------+----------------+-------------------------+---------+
| address_id | address                      | district       | city                    | country |
+------------+------------------------------+----------------+-------------------------+---------+
|         16 | 808 Bhopal Manor             | Haryana        | Yamuna Nagar            | India   |
|        513 | 758 Korolev Parkway          | Andhra Pradesh | Vijayawada              | India   |
|        127 | 117 Boa Vista Way            | Uttar Pradesh  | Varanasi (Benares)      | India   |
|        408 | 990 Etawah Loop              | Tamil Nadu     | Valparai                | India   |
|        235 | 954 Kimchon Place            | West Bengali   | Uttarpara-Kotrung       | India   |
|        451 | 1704 Tambaram Manor          | West Bengali   | Uluberia                | India   |
|        174 | 1877 Ezhou Lane              | Rajasthan      | Udaipur                 | India   |
|        292 | 1993 Tabuk Lane              | Tamil Nadu     | Tambaram                | India   |
|        507 | 1197 Sokoto Boulevard        | West Bengali   | Siliguri (Shiliguri)    | India   |
|         72 | 57 Arlington Manor           | Madhya Pradesh | Shivapuri               | India   |
|        242 | 1964 Gijn Manor              | Karnataka      | Shimoga                 | India   |
|        361 | 45 Aparecida de Goinia Place | Madhya Pradesh | Satna                   | India   |
|        221 | 866 Shivapuri Manor          | Uttar Pradesh  | Sambhal                 | India   |
|        363 | 604 Bern Place               | Jharkhand      | Ranchi                  | India   |
|        341 | 1920 Weifang Avenue          | Uttar Pradesh  | Rampur                  | India   |
|        560 | 1447 Imus Place              | Gujarat        | Rajkot                  | India   |
|         82 | 936 Salzburg Lane            | Uttar Pradesh  | Rae Bareli              | India   |
|        431 | 1596 Acua Parkway            | Jharkhand      | Purnea (Purnia)         | India   |
|        139 | 943 Johannesburg Avenue      | Maharashtra    | Pune                    | India   |
|        426 | 1661 Abha Drive              | Tamil Nadu     | Pudukkottai             | India   |
|        301 | 951 Stara Zagora Manor       | Punjab         | Patiala                 | India   |
|         99 | 1697 Tanauan Lane            | Punjab         | Pathankot               | India   |
|        305 | 41 El Alto Parkway           | Maharashtra    | Parbhani                | India   |
|        273 | 1519 Ilorin Place            | Kerala         | Palghat (Palakkad)      | India   |
|        156 | 1963 Moscow Place            | Assam          | Nagaon                  | India   |
|         63 | 1213 Ranchi Parkway          | Karnataka      | Mysore                  | India   |
|         32 | 1425 Shikarpur Manor         | Bihar          | Munger (Monghyr)        | India   |
|        321 | 651 Pathankot Loop           | Maharashtra    | Miraj                   | India   |
|        276 | 1675 Xiangfan Manor          | Tamil Nadu     | Kumbakonam              | India   |
|        424 | 1948 Bayugan Parkway         | Bihar          | Katihar                 | India   |
|        279 | 1884 Shikarpur Avenue        | Haryana        | Karnal                  | India   |
|        497 | 1013 Tabuk Boulevard         | West Bengali   | Kanchrapara             | India   |
|         35 | 33 Gorontalo Way             | West Bengali   | Kamarhati               | India   |
|        228 | 60 Poos de Caldas Street     | Rajasthan      | Jodhpur                 | India   |
|         36 | 176 Mandaluyong Place        | Uttar Pradesh  | Jhansi                  | India   |
|         64 | 81 Hodeida Way               | Rajasthan      | Jaipur                  | India   |
|        140 | 788 Atinsk Street            | Karnataka      | Hubli-Dharwad           | India   |
|        417 | 791 Salinas Street           | Punjab         | Hoshiarpur              | India   |
|        264 | 1027 Banjul Place            | West Bengali   | Halisahar               | India   |
|        190 | 435 0 Way                    | West Bengali   | Haldia                  | India   |
|        375 | 1049 Matamoros Parkway       | Karnataka      | Gulbarga                | India   |
|        121 | 1967 Sincelejo Place         | Gujarat        | Gandhinagar             | India   |
|        196 | 9 San Miguel de Tucumn Manor | Uttar Pradesh  | Firozabad               | India   |
|        125 | 211 Chiayi Drive             | Uttar Pradesh  | Etawah                  | India   |
|        445 | 495 Bhimavaram Lane          | Maharashtra    | Dhule (Dhulia)          | India   |
|        514 | 1747 Rustenburg Place        | Bihar          | Chapra                  | India   |
|        171 | 1540 Wroclaw Drive           | Maharashtra    | Chandrapur              | India   |
|        473 | 1257 Guadalajara Street      | Karnataka      | Bijapur                 | India   |
|        206 | 642 Nador Drive              | Maharashtra    | Bhusawal                | India   |
|         19 | 419 Iligan Lane              | Madhya Pradesh | Bhopal                  | India   |
|        535 | 635 Brest Manor              | Andhra Pradesh | Bhimavaram              | India   |
|        213 | 43 Dadu Avenue               | Rajasthan      | Bhilwara                | India   |
|        384 | 97 Mogiljov Lane             | Gujarat        | Bhavnagar               | India   |
|        418 | 126 Acua Parkway             | West Bengali   | Berhampore (Baharampur) | India   |
|        212 | 624 Oshawa Boulevard         | West Bengali   | Balurghat               | India   |
|        540 | 949 Allende Lane             | Uttar Pradesh  | Amroha                  | India   |
|        229 | 1014 Loja Manor              | Tamil Nadu     | Ambattur                | India   |
|        179 | 431 Xiangtan Avenue          | Kerala         | Allappuzha (Alleppey)   | India   |
|        302 | 922 Vila Velha Loop          | Maharashtra    | Ahmadnagar              | India   |
|        372 | 230 Urawa Drive              | Andhra Pradesh | Adoni                   | India   |
+------------+------------------------------+----------------+-------------------------+---------+
60 rows in set (0.052 sec)

mysql> SELECT adr.address_id, adr.address, adr.district, cit.city_id, cit.city, cit.country_id, cot.country_id, cot.country FROM address AS adr RIGHT JOIN city AS cit USING(city_id) RIGHT JOIN country AS cot USING(country_id) ORDER BY cit.city_id LIMIT 15;
+------------+---------------------------+----------------------+---------+--------------------+------------+------------+----------------------+
| address_id | address                   | district             | city_id | city               | country_id | country_id | country              |
+------------+---------------------------+----------------------+---------+--------------------+------------+------------+----------------------+
|         56 | 939 Probolinggo Loop      | Galicia              |       1 | A Corua (La Corua) |         87 |         87 | Spain                |
|        105 | 733 Mandaluyong Place     | Asir                 |       2 | Abha               |         82 |         82 | Saudi Arabia         |
|        457 | 535 Ahmadnagar Manor      | Abu Dhabi            |       3 | Abu Dhabi          |        101 |        101 | United Arab Emirates |
|        491 | 1789 Saint-Denis Parkway  | Coahuila de Zaragoza |       4 | Acua               |         60 |         60 | Mexico               |
|        332 | 663 Baha Blanca Parkway   | Adana                |       5 | Adana              |         97 |         97 | Turkey               |
|        397 | 614 Pak Kret Street       | Addis Abeba          |       6 | Addis Abeba        |         31 |         31 | Ethiopia             |
|        214 | 751 Lima Loop             | Aden                 |       7 | Aden               |        107 |        107 | Yemen                |
|        372 | 230 Urawa Drive           | Andhra Pradesh       |       8 | Adoni              |         44 |         44 | India                |
|        302 | 922 Vila Velha Loop       | Maharashtra          |       9 | Ahmadnagar         |         44 |         44 | India                |
|        580 | 923 Tangail Boulevard     | Tokyo-to             |      10 | Akishima           |         50 |         50 | Japan                |
|        484 | 98 Pyongyang Boulevard    | Ohio                 |      11 | Akron              |        103 |        103 | United States        |
|        102 | 669 Firozabad Loop        | Abu Dhabi            |      12 | al-Ayn             |        101 |        101 | United Arab Emirates |
|         74 | 1124 Buenaventura Drive   | Mekka                |      13 | al-Hawiya          |         82 |         82 | Saudi Arabia         |
|        596 | 1759 Niznekamsk Avenue    | al-Manama            |      14 | al-Manama          |         11 |         11 | Bahrain              |
|        400 | 1152 Citrus Heights Manor | al-Qadarif           |      15 | al-Qadarif         |         89 |         89 | Sudan                |
+------------+---------------------------+----------------------+---------+--------------------+------------+------------+----------------------+
15 rows in set (0.338 sec)

mysql> SELECT COUNT(adr.address_id), adr.address, adr.district, cit.city_id, cit.city, cit.country_id, cot.country_id, cot.country FROM address AS adr RIGHT JOIN city AS cit USING(city_id) RIGHT JOIN country AS cot USING(country_id) ORDER BY cit.city_id LIMIT 15;
+-----------------------+------------------------+----------+---------+-------+------------+------------+-------------+
| COUNT(adr.address_id) | address                | district | city_id | city  | country_id | country_id | country     |
+-----------------------+------------------------+----------+---------+-------+------------+------------+-------------+
|                   603 | 1168 Najafabad Parkway | Kabol    |     251 | Kabul |          1 |          1 | Afghanistan |
+-----------------------+------------------------+----------+---------+-------+------------+------------+-------------+
1 row in set (0.330 sec)

mysql> SELECT COUNT(adr.address_id), adr.address, adr.district, cit.city_id, cit.city, cit.country_id, cot.country_id, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) ORDER BY cit.city_id LIMIT 15;
+-----------------------+------------------------+----------+---------+-------+------------+------------+-------------+
| COUNT(adr.address_id) | address                | district | city_id | city  | country_id | country_id | country     |
+-----------------------+------------------------+----------+---------+-------+------------+------------+-------------+
|                   603 | 1168 Najafabad Parkway | Kabol    |     251 | Kabul |          1 |          1 | Afghanistan |
+-----------------------+------------------------+----------+---------+-------+------------+------------+-------------+
1 row in set (0.314 sec)

mysql> SELECT adr.address_id, adr.address, adr.district, cot.country_id, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) ORDER BY cot.country;
+------------+----------------------------------------+----------------------+------------+---------------------------------------+
| address_id | address                                | district             | country_id | country                               |
+------------+----------------------------------------+----------------------+------------+---------------------------------------+
|        222 | 1168 Najafabad Parkway                 | Kabol                |          1 | Afghanistan                           |
|        446 | 1924 Shimonoseki Drive                 | Batna                |          2 | Algeria                               |
|         73 | 1031 Daugavpils Parkway                | Bchar                |          2 | Algeria                               |
|        180 | 757 Rustenburg Avenue                  | Skikda               |          2 | Algeria                               |
|        325 | 1892 Nabereznyje Telny Lane            | Tutuila              |          3 | American Samoa                        |
|        534 | 486 Ondo Parkway                       | Benguela             |          4 | Angola                                |
|        388 | 368 Hunuco Boulevard                   | Namibe               |          4 | Angola                                |
|        386 | 1368 Maracabo Boulevard                |                      |          5 | Anguilla                              |
|        364 | 1623 Kingstown Drive                   | Buenos Aires         |          6 | Argentina                             |
|        566 | 1229 Varanasi (Benares) Manor          | Buenos Aires         |          6 | Argentina                             |
|        327 | 1427 A Corua (La Corua) Place          | Buenos Aires         |          6 | Argentina                             |
|         28 | 96 Tafuna Way                          | Crdoba               |          6 | Argentina                             |
|        450 | 203 Tambaram Street                    | Buenos Aires         |          6 | Argentina                             |
|        536 | 166 Jinchang Street                    | Buenos Aires         |          6 | Argentina                             |
|         93 | 1926 El Alto Avenue                    | Buenos Aires         |          6 | Argentina                             |
|        111 | 1532 Dzerzinsk Way                     | Buenos Aires         |          6 | Argentina                             |
|        591 | 773 Dallas Manor                       | Buenos Aires         |          6 | Argentina                             |
|        247 | 1483 Pathankot Street                  | Tucumn               |          6 | Argentina                             |
|        336 | 430 Kumbakonam Drive                   | Santa F              |          6 | Argentina                             |
|        410 | 88 Nagaon Manor                        | Buenos Aires         |          6 | Argentina                             |
|        223 | 1244 Allappuzha (Alleppey) Place       | Buenos Aires         |          6 | Argentina                             |
|         45 | 42 Brindisi Place                      | Yerevan              |          7 | Armenia                               |
|          2 | 28 MySQL Boulevard                     | QLD                  |          8 | Australia                             |
|          4 | 1411 Lillydale Drive                   | QLD                  |          8 | Australia                             |
|        177 | 1010 Klerksdorp Way                    | Steiermark           |          9 | Austria                               |
|        163 | 1440 Compton Place                     | North Austria        |          9 | Austria                               |
|        271 | 1587 Loja Manor                        | Salzburg             |          9 | Austria                               |
|        338 | 431 Szkesfehrvr Avenue                 | Baki                 |         10 | Azerbaijan                            |
|        339 | 503 Sogamoso Loop                      | Sumqayit             |         10 | Azerbaijan                            |
|        596 | 1759 Niznekamsk Avenue                 | al-Manama            |         11 | Bahrain                               |
|        337 | 1838 Tabriz Lane                       | Dhaka                |         12 | Bangladesh                            |
|        334 | 1816 Bydgoszcz Loop                    | Dhaka                |         12 | Bangladesh                            |
|         25 | 262 A Corua (La Corua) Parkway         | Dhaka                |         12 | Bangladesh                            |
|        533 | 556 Asuncin Way                        | Mogiljov             |         13 | Belarus                               |
|        148 | 1027 Songkhla Manor                    | Minsk                |         13 | Belarus                               |
|        460 | 659 Gatineau Boulevard                 | La Paz               |         14 | Bolivia                               |
|        436 | 287 Cuautla Boulevard                  | Chuquisaca           |         14 | Bolivia                               |
|        557 | 1407 Pachuca de Soto Place             | Rio Grande do Sul    |         15 | Brazil                                |
|        312 | 1354 Siegen Street                     | Rio de Janeiro       |         15 | Brazil                                |
|        233 | 356 Olomouc Manor                      | Gois                 |         15 | Brazil                                |
|        220 | 1201 Qomsheh Manor                     | Gois                 |         15 | Brazil                                |
|         81 | 1692 Ede Loop                          | So Paulo             |         15 | Brazil                                |
|        403 | 1190 0 Place                           | Rio Grande do Sul    |         15 | Brazil                                |
|        367 | 1163 London Parkway                    | Par                  |         15 | Brazil                                |
|        210 | 1304 s-Hertogenbosch Way               | Santa Catarina       |         15 | Brazil                                |
|        347 | 1293 Nam Dinh Way                      | Roraima              |         15 | Brazil                                |
|        330 | 981 Kumbakonam Place                   | Distrito Federal     |         15 | Brazil                                |
|         96 | 984 Effon-Alaiye Avenue                | Gois                 |         15 | Brazil                                |
|        432 | 259 Ipoh Drive                         | So Paulo             |         15 | Brazil                                |
|        134 | 758 Junan Lane                         | Gois                 |         15 | Brazil                                |
|        315 | 543 Bergamo Avenue                     | Minas Gerais         |         15 | Brazil                                |
|         51 | 686 Garland Manor                      | Cear                 |         15 | Brazil                                |
|        597 | 32 Liaocheng Way                       | Minas Gerais         |         15 | Brazil                                |
|        187 | 1839 Szkesfehrvr Parkway               | Gois                 |         15 | Brazil                                |
|        250 | 829 Grand Prairie Way                  | Paran                |         15 | Brazil                                |
|        130 | 1666 Qomsheh Drive                     | So Paulo             |         15 | Brazil                                |
|        259 | 1338 Zalantun Lane                     | Minas Gerais         |         15 | Brazil                                |
|         78 | 1206 Dos Quebradas Place               | So Paulo             |         15 | Brazil                                |
|        182 | 1891 Rizhao Boulevard                  | So Paulo             |         15 | Brazil                                |
|        359 | 519 Nyeri Manor                        | So Paulo             |         15 | Brazil                                |
|        550 | 1715 Okayama Street                    | So Paulo             |         15 | Brazil                                |
|        448 | 614 Denizli Parkway                    | Rio Grande do Sul    |         15 | Brazil                                |
|        319 | 1957 Yantai Lane                       | So Paulo             |         15 | Brazil                                |
|         43 | 306 Antofagasta Place                  | Esprito Santo        |         15 | Brazil                                |
|        379 | 1133 Rizhao Avenue                     | Pernambuco           |         15 | Brazil                                |
|         95 | 1370 Le Mans Avenue                    | Brunei and Muara     |         16 | Brunei                                |
|        546 | 191 Jos Azueta Parkway                 | Ruse                 |         17 | Bulgaria                              |
|        219 | 1229 Valencia Parkway                  | Haskovo              |         17 | Bulgaria                              |
|        522 | 1768 Udine Loop                        | Battambang           |         18 | Cambodia                              |
|        232 | 754 Valencia Place                     | Phnom Penh           |         18 | Cambodia                              |
|        357 | 1641 Changhwa Place                    | Nord-Ouest           |         19 | Cameroon                              |
|        366 | 114 Jalib al-Shuyukh Manor             | Centre               |         19 | Cameroon                              |
|        481 | 1153 Allende Way                       | Qubec                |         20 | Canada                                |
|        468 | 1844 Usak Avenue                       | Nova Scotia          |         20 | Canada                                |
|          1 | 47 MySakila Drive                      | Alberta              |         20 | Canada                                |
|          3 | 23 Workhaven Lane                      | Alberta              |         20 | Canada                                |
|        193 | 891 Novi Sad Manor                     | Ontario              |         20 | Canada                                |
|        415 | 432 Garden Grove Street                | Ontario              |         20 | Canada                                |
|        441 | 983 Santa F Way                        | British Colombia     |         20 | Canada                                |
|        541 | 195 Ilorin Street                      | Chari-Baguirmi       |         21 | Chad                                  |
|         49 | 1718 Valencia Street                   | Antofagasta          |         22 | Chile                                 |
|        521 | 568 Dhule (Dhulia) Loop                | Coquimbo             |         22 | Chile                                 |
|        469 | 1872 Toulon Loop                       | OHiggins             |         22 | Chile                                 |
|        544 | 183 Haiphong Street                    | Jilin                |         23 | China                                 |
|        500 | 362 Rajkot Lane                        | Gansu                |         23 | China                                 |
|        539 | 1332 Gaziantep Lane                    | Shandong             |         23 | China                                 |
|        201 | 817 Bradford Loop                      | Jiangsu              |         23 | China                                 |
|        265 | 1158 Mandi Bahauddin Parkway           | Shanxi               |         23 | China                                 |
|         68 | 1966 Amroha Avenue                     | Sichuan              |         23 | China                                 |
|        471 | 1322 Mosul Parkway                     | Shandong             |         23 | China                                 |
|        394 | 753 Ilorin Avenue                      | Sichuan              |         23 | China                                 |
|        114 | 804 Elista Drive                       | Hubei                |         23 | China                                 |
|        318 | 1774 Yaound Place                      | Hubei                |         23 | China                                 |
|        215 | 1333 Haldia Street                     | Jilin                |         23 | China                                 |
|        286 | 1308 Sumy Loop                         | Fujian               |         23 | China                                 |
|        558 | 904 Clarksville Drive                  | Zhejiang             |         23 | China                                 |
|        169 | 154 Tallahassee Loop                   | Xinxiang             |         23 | China                                 |
|        142 | 1587 Sullana Lane                      | Inner Mongolia       |         23 | China                                 |
|        389 | 500 Lincoln Parkway                    | Jiangsu              |         23 | China                                 |
|        172 | 475 Atinsk Way                         | Gansu                |         23 | China                                 |
|        600 | 1837 Kaduna Parkway                    | Inner Mongolia       |         23 | China                                 |
|        601 | 844 Bucuresti Place                    | Liaoning             |         23 | China                                 |
|        440 | 722 Bradford Lane                      | Shandong             |         23 | China                                 |
|        288 | 226 Halifax Street                     | Xinxiang             |         23 | China                                 |
|        155 | 1560 Jelets Boulevard                  | Shandong             |         23 | China                                 |
|        427 | 1557 Cape Coral Parkway                | Hubei                |         23 | China                                 |
|        272 | 1762 Paarl Parkway                     | Hunan                |         23 | China                                 |
|        575 | 1052 Pathankot Avenue                  | Sichuan              |         23 | China                                 |
|        133 | 1854 Tieli Street                      | Shandong             |         23 | China                                 |
|         94 | 1952 Chatsworth Drive                  | Guangdong            |         23 | China                                 |
|         41 | 1440 Fukuyama Loop                     | Henan                |         23 | China                                 |
|        173 | 1294 Firozabad Drive                   | Jiangxi              |         23 | China                                 |
|        246 | 1246 Boksburg Parkway                  | Hebei                |         23 | China                                 |
|        501 | 1060 Tandil Lane                       | Shandong             |         23 | China                                 |
|        552 | 390 Wroclaw Way                        | Hainan               |         23 | China                                 |
|        429 | 1269 Botosani Manor                    | Guangdong            |         23 | China                                 |
|        490 | 1909 Dayton Avenue                     | Guangdong            |         23 | China                                 |
|        383 | 686 Donostia-San Sebastin Lane         | Guangdong            |         23 | China                                 |
|        516 | 1574 Goinia Boulevard                  | Heilongjiang         |         23 | China                                 |
|        253 | 1760 Oshawa Manor                      | Tianjin              |         23 | China                                 |
|        307 | 1908 Gaziantep Place                   | Liaoning             |         23 | China                                 |
|        605 | 1325 Fukuyama Street                   | Heilongjiang         |         23 | China                                 |
|        447 | 105 Dzerzinsk Manor                    | Inner Mongolia       |         23 | China                                 |
|        594 | 1464 Kursk Parkway                     | Shandong             |         23 | China                                 |
|        245 | 1103 Bilbays Parkway                   | Hubei                |         23 | China                                 |
|         71 | 1586 Guaruj Place                      | Hunan                |         23 | China                                 |
|        570 | 415 Pune Avenue                        | Shandong             |         23 | China                                 |
|        344 | 1909 Benguela Lane                     | Henan                |         23 | China                                 |
|        277 | 85 San Felipe de Puerto Plata Drive    | Shandong             |         23 | China                                 |
|        489 | 1297 Alvorada Parkway                  | Ningxia              |         23 | China                                 |
|        527 | 1993 0 Loop                            | Liaoning             |         23 | China                                 |
|        158 | 798 Cianjur Avenue                     | Shanxi               |         23 | China                                 |
|        329 | 867 Benin City Avenue                  | Henan                |         23 | China                                 |
|         97 | 832 Nakhon Sawan Manor                 | Inner Mongolia       |         23 | China                                 |
|        520 | 1778 Gijn Manor                        | Hubei                |         23 | China                                 |
|        556 | 346 Cam Ranh Avenue                    | Zhejiang             |         23 | China                                 |
|        239 | 98 Stara Zagora Boulevard              | Valle                |         24 | Colombia                              |
|        124 | 241 Mosul Lane                         | Risaralda            |         24 | Colombia                              |
|        465 | 734 Tanshui Avenue                     | Caquet               |         24 | Colombia                              |
|        184 | 1410 Benin City Parkway                | Risaralda            |         24 | Colombia                              |
|         91 | 1740 Portoviejo Avenue                 | Sucre                |         24 | Colombia                              |
|        495 | 656 Matamoros Drive                    | Boyac                |         24 | Colombia                              |
|        392 | 514 Ife Way                            | Shaba                |         25 | Congo, The Democratic Republic of the |
|        380 | 1519 Santiago de los Caballeros Loop   | East Kasai           |         25 | Congo, The Democratic Republic of the |
|        270 | 682 Halisahar Place                    | Severn Morava        |         26 | Czech Republic                        |
|        442 | 1245 Ibirit Way                        | La Romana            |         27 | Dominican Republic                    |
|        423 | 437 Chungho Drive                      | Puerto Plata         |         27 | Dominican Republic                    |
|        263 | 532 Toulon Street                      | Santiago             |         27 | Dominican Republic                    |
|        595 | 1074 Sanaa Parkway                     | Loja                 |         28 | Ecuador                               |
|        267 | 816 Cayenne Parkway                    | Manab                |         28 | Ecuador                               |
|        499 | 1954 Kowloon and New Kowloon Way       | Chimborazo           |         28 | Ecuador                               |
|        565 | 1741 Hoshiarpur Boulevard              | al-Sharqiya          |         29 | Egypt                                 |
|        237 | 1736 Cavite Place                      | Qina                 |         29 | Egypt                                 |
|        496 | 775 ostka Drive                        | al-Daqahliya         |         29 | Egypt                                 |
|        138 | 765 Southampton Drive                  | al-Qalyubiya         |         29 | Egypt                                 |
|        428 | 1727 Matamoros Place                   | Sawhaj               |         29 | Egypt                                 |
|        123 | 1987 Coacalco de Berriozbal Loop       | al-Qalyubiya         |         29 | Egypt                                 |
|        449 | 1289 Belm Boulevard                    | Tartumaa             |         30 | Estonia                               |
|        397 | 614 Pak Kret Street                    | Addis Abeba          |         31 | Ethiopia                              |
|        322 | 1359 Zhoushan Parkway                  | Streymoyar           |         32 | Faroe Islands                         |
|        303 | 898 Jining Lane                        | Pohjois-Pohjanmaa    |         33 | Finland                               |
|        407 | 1346 Mysore Drive                      | Bretagne             |         34 | France                                |
|        166 | 1740 Le Mans Loop                      | Pays de la Loire     |         34 | France                                |
|        108 | 1386 Yangor Avenue                     | Provence-Alpes-Cte   |         34 | France                                |
|         39 | 391 Callao Drive                       | Midi-Pyrnes          |         34 | France                                |
|         69 | 698 Otsu Street                        | Cayenne              |         35 | French Guiana                         |
|         47 | 1447 Imus Way                          | Tahiti               |         36 | French Polynesia                      |
|         60 | 1668 Saint Louis Place                 | Tahiti               |         36 | French Polynesia                      |
|        590 | 247 Jining Parkway                     | Banjul               |         37 | Gambia                                |
|        118 | 442 Rae Bareli Place                   | Nordrhein-Westfalen  |         38 | Germany                               |
|        453 | 319 Springs Loop                       | Baijeri              |         38 | Germany                               |
|        255 | 1966 Tonghae Street                    | Anhalt Sachsen       |         38 | Germany                               |
|        200 | 1074 Binzhou Manor                     | Baden-Wrttemberg     |         38 | Germany                               |
|        231 | 430 Alessandria Loop                   | Saarland             |         38 | Germany                               |
|        199 | 1792 Valle de la Pascua Place          | Nordrhein-Westfalen  |         38 | Germany                               |
|        205 | 68 Molodetno Manor                     | Nordrhein-Westfalen  |         38 | Germany                               |
|          7 | 692 Joliet Street                      | Attika               |         39 | Greece                                |
|        602 | 1101 Bucuresti Boulevard               | West Greece          |         39 | Greece                                |
|        211 | 850 Salala Loop                        | Kitaa                |         40 | Greenland                             |
|         30 | 18 Duisburg Boulevard                  |                      |         41 | Holy See (Vatican City State)         |
|        294 | 1912 Allende Manor                     | Kowloon and New Kowl |         42 | Hong Kong                             |
|        598 | 42 Fontana Avenue                      | Fejr                 |         43 | Hungary                               |
|        372 | 230 Urawa Drive                        | Andhra Pradesh       |         44 | India                                 |
|        302 | 922 Vila Velha Loop                    | Maharashtra          |         44 | India                                 |
|        179 | 431 Xiangtan Avenue                    | Kerala               |         44 | India                                 |
|        229 | 1014 Loja Manor                        | Tamil Nadu           |         44 | India                                 |
|        540 | 949 Allende Lane                       | Uttar Pradesh        |         44 | India                                 |
|        212 | 624 Oshawa Boulevard                   | West Bengali         |         44 | India                                 |
|        418 | 126 Acua Parkway                       | West Bengali         |         44 | India                                 |
|        384 | 97 Mogiljov Lane                       | Gujarat              |         44 | India                                 |
|        213 | 43 Dadu Avenue                         | Rajasthan            |         44 | India                                 |
|        535 | 635 Brest Manor                        | Andhra Pradesh       |         44 | India                                 |
|         19 | 419 Iligan Lane                        | Madhya Pradesh       |         44 | India                                 |
|        206 | 642 Nador Drive                        | Maharashtra          |         44 | India                                 |
|        473 | 1257 Guadalajara Street                | Karnataka            |         44 | India                                 |
|        171 | 1540 Wroclaw Drive                     | Maharashtra          |         44 | India                                 |
|        514 | 1747 Rustenburg Place                  | Bihar                |         44 | India                                 |
|        445 | 495 Bhimavaram Lane                    | Maharashtra          |         44 | India                                 |
|        125 | 211 Chiayi Drive                       | Uttar Pradesh        |         44 | India                                 |
|        196 | 9 San Miguel de Tucumn Manor           | Uttar Pradesh        |         44 | India                                 |
|        121 | 1967 Sincelejo Place                   | Gujarat              |         44 | India                                 |
|        375 | 1049 Matamoros Parkway                 | Karnataka            |         44 | India                                 |
|        190 | 435 0 Way                              | West Bengali         |         44 | India                                 |
|        264 | 1027 Banjul Place                      | West Bengali         |         44 | India                                 |
|        417 | 791 Salinas Street                     | Punjab               |         44 | India                                 |
|        140 | 788 Atinsk Street                      | Karnataka            |         44 | India                                 |
|         64 | 81 Hodeida Way                         | Rajasthan            |         44 | India                                 |
|         36 | 176 Mandaluyong Place                  | Uttar Pradesh        |         44 | India                                 |
|        228 | 60 Poos de Caldas Street               | Rajasthan            |         44 | India                                 |
|         35 | 33 Gorontalo Way                       | West Bengali         |         44 | India                                 |
|        497 | 1013 Tabuk Boulevard                   | West Bengali         |         44 | India                                 |
|        279 | 1884 Shikarpur Avenue                  | Haryana              |         44 | India                                 |
|        424 | 1948 Bayugan Parkway                   | Bihar                |         44 | India                                 |
|        276 | 1675 Xiangfan Manor                    | Tamil Nadu           |         44 | India                                 |
|        321 | 651 Pathankot Loop                     | Maharashtra          |         44 | India                                 |
|         32 | 1425 Shikarpur Manor                   | Bihar                |         44 | India                                 |
|         63 | 1213 Ranchi Parkway                    | Karnataka            |         44 | India                                 |
|        156 | 1963 Moscow Place                      | Assam                |         44 | India                                 |
|        273 | 1519 Ilorin Place                      | Kerala               |         44 | India                                 |
|        305 | 41 El Alto Parkway                     | Maharashtra          |         44 | India                                 |
|         99 | 1697 Tanauan Lane                      | Punjab               |         44 | India                                 |
|        301 | 951 Stara Zagora Manor                 | Punjab               |         44 | India                                 |
|        426 | 1661 Abha Drive                        | Tamil Nadu           |         44 | India                                 |
|        139 | 943 Johannesburg Avenue                | Maharashtra          |         44 | India                                 |
|        431 | 1596 Acua Parkway                      | Jharkhand            |         44 | India                                 |
|         82 | 936 Salzburg Lane                      | Uttar Pradesh        |         44 | India                                 |
|        560 | 1447 Imus Place                        | Gujarat              |         44 | India                                 |
|        341 | 1920 Weifang Avenue                    | Uttar Pradesh        |         44 | India                                 |
|        363 | 604 Bern Place                         | Jharkhand            |         44 | India                                 |
|        221 | 866 Shivapuri Manor                    | Uttar Pradesh        |         44 | India                                 |
|        361 | 45 Aparecida de Goinia Place           | Madhya Pradesh       |         44 | India                                 |
|        242 | 1964 Gijn Manor                        | Karnataka            |         44 | India                                 |
|         72 | 57 Arlington Manor                     | Madhya Pradesh       |         44 | India                                 |
|        507 | 1197 Sokoto Boulevard                  | West Bengali         |         44 | India                                 |
|        292 | 1993 Tabuk Lane                        | Tamil Nadu           |         44 | India                                 |
|        174 | 1877 Ezhou Lane                        | Rajasthan            |         44 | India                                 |
|        451 | 1704 Tambaram Manor                    | West Bengali         |         44 | India                                 |
|        235 | 954 Kimchon Place                      | West Bengali         |         44 | India                                 |
|        408 | 990 Etawah Loop                        | Tamil Nadu           |         44 | India                                 |
|        127 | 117 Boa Vista Way                      | Uttar Pradesh        |         44 | India                                 |
|        513 | 758 Korolev Parkway                    | Andhra Pradesh       |         44 | India                                 |
|         16 | 808 Bhopal Manor                       | Haryana              |         44 | India                                 |
|        416 | 1445 Carmen Parkway                    | West Java            |         45 | Indonesia                             |
|        243 | 47 Syktyvkar Lane                      | West Java            |         45 | Indonesia                             |
|        333 | 1860 Taguig Loop                       | West Java            |         45 | Indonesia                             |
|        207 | 1688 Nador Lane                        | Sulawesi Utara       |         45 | Indonesia                             |
|        157 | 456 Escobar Way                        | Jakarta Raya         |         45 | Indonesia                             |
|        478 | 1078 Stara Zagora Drive                | Aceh                 |         45 | Indonesia                             |
|        505 | 519 Brescia Parkway                    | East Java            |         45 | Indonesia                             |
|        548 | 1658 Cuman Loop                        | Sumatera Selatan     |         45 | Indonesia                             |
|        120 | 544 Malm Parkway                       | Central Java         |         45 | Indonesia                             |
|        511 | 1152 al-Qatif Lane                     | Kalimantan Barat     |         45 | Indonesia                             |
|        377 | 154 Oshawa Manor                       | East Java            |         45 | Indonesia                             |
|        530 | 1003 Qinhuangdao Street                | West Java            |         45 | Indonesia                             |
|        455 | 1947 Paarl Way                         | Central Java         |         45 | Indonesia                             |
|        463 | 935 Aden Boulevard                     | Central Java         |         45 | Indonesia                             |
|         40 | 334 Munger (Monghyr) Lane              | Markazi              |         46 | Iran                                  |
|         14 | 1531 Sal Drive                         | Esfahan              |         46 | Iran                                  |
|        382 | 220 Hidalgo Drive                      | Kermanshah           |         46 | Iran                                  |
|        373 | 1922 Miraj Way                         | Esfahan              |         46 | Iran                                  |
|        464 | 76 Kermanshah Manor                    | Esfahan              |         46 | Iran                                  |
|        189 | 927 Barcelona Street                   | Chaharmahal va Bakht |         46 | Iran                                  |
|        454 | 956 Nam Dinh Manor                     | Kerman               |         46 | Iran                                  |
|        284 | 600 Bradford Street                    | East Azerbaidzan     |         46 | Iran                                  |
|        585 | 1208 Tama Loop                         | Ninawa               |         47 | Iraq                                  |
|        106 | 659 Vaduz Drive                        | Ha Darom             |         48 | Israel                                |
|        483 | 632 Usolje-Sibirskoje Parkway          | Ha Darom             |         48 | Israel                                |
|        320 | 1542 Lubumbashi Boulevard              | Tel Aviv             |         48 | Israel                                |
|        165 | 97 Shimoga Avenue                      | Tel Aviv             |         48 | Israel                                |
|         37 | 127 Purnea (Purnia) Manor              | Piemonte             |         49 | Italy                                 |
|        444 | 231 Kaliningrad Place                  | Lombardia            |         49 | Italy                                 |
|        314 | 1224 Huejutla de Reyes Boulevard       | Lombardia            |         49 | Italy                                 |
|        504 | 1 Valle de Santiago Avenue             | Apulia               |         49 | Italy                                 |
|        547 | 379 Lublin Parkway                     | Toscana              |         49 | Italy                                 |
|        225 | 1926 Gingoog Street                    | Sisilia              |         49 | Italy                                 |
|        531 | 1986 Sivas Place                       | Friuli-Venezia Giuli |         49 | Italy                                 |
|        580 | 923 Tangail Boulevard                  | Tokyo-to             |         50 | Japan                                 |
|        145 | 928 Jaffna Loop                        | Hiroshima            |         50 | Japan                                 |
|        269 | 446 Kirovo-Tepetsk Lane                | Osaka                |         50 | Japan                                 |
|        198 | 345 Oshawa Boulevard                   | Tokyo-to             |         50 | Japan                                 |
|        304 | 1635 Kuwana Boulevard                  | Hiroshima            |         50 | Japan                                 |
|        525 | 1949 Sanya Street                      | Gumma                |         50 | Japan                                 |
|        244 | 1148 Saarbrcken Parkway                | Fukushima            |         50 | Japan                                 |
|         58 | 1964 Allappuzha (Alleppey) Street      | Yamaguchi            |         50 | Japan                                 |
|        401 | 168 Cianjur Manor                      | Saitama              |         50 | Japan                                 |
|        396 | 767 Pyongyang Drive                    | Osaka                |         50 | Japan                                 |
|        167 | 1287 Xiangfan Boulevard                | Gifu                 |         50 | Japan                                 |
|         83 | 586 Tete Way                           | Kanagawa             |         50 | Japan                                 |
|        553 | 1421 Quilmes Lane                      | Ishikawa             |         50 | Japan                                 |
|        406 | 454 Patiala Lane                       | Fukushima            |         50 | Japan                                 |
|         38 | 61 Tama Street                         | Okayama              |         50 | Japan                                 |
|        537 | 958 Sagamihara Lane                    | Mie                  |         50 | Japan                                 |
|        360 | 619 Hunuco Avenue                      | Shimane              |         50 | Japan                                 |
|        258 | 752 Ondo Loop                          | Miyazaki             |         50 | Japan                                 |
|         57 | 17 Kabul Boulevard                     | Chiba                |         50 | Japan                                 |
|        494 | 591 Sungai Petani Drive                | Okayama              |         50 | Japan                                 |
|        370 | 1565 Tangail Manor                     | Okinawa              |         50 | Japan                                 |
|        409 | 1266 Laredo Parkway                    | Saitama              |         50 | Japan                                 |
|        342 | 124 al-Manama Way                      | Hiroshima            |         50 | Japan                                 |
|        290 | 1336 Benin City Drive                  | Shiga                |         50 | Japan                                 |
|         15 | 1542 Tarlac Parkway                    | Kanagawa             |         50 | Japan                                 |
|          5 | 1913 Hanoi Way                         | Nagasaki             |         50 | Japan                                 |
|         33 | 786 Aurora Avenue                      | Yamaguchi            |         50 | Japan                                 |
|        390 | 102 Chapra Drive                       | Ibaragi              |         50 | Japan                                 |
|        434 | 1404 Taguig Drive                      | Okayama              |         50 | Japan                                 |
|        508 | 496 Celaya Drive                       | Nagano               |         50 | Japan                                 |
|        151 | 1337 Lincoln Parkway                   | Saitama              |         50 | Japan                                 |
|         80 | 602 Paarl Street                       | Pavlodar             |         51 | Kazakstan                             |
|        579 | 521 San Juan Bautista Tuxtepec Place   | Qaraghandy           |         51 | Kazakstan                             |
|        197 | 447 Surakarta Loop                     | Nyanza               |         52 | Kenya                                 |
|        368 | 1658 Jastrzebie-Zdrj Loop              | Central              |         52 | Kenya                                 |
|        238 | 346 Skikda Parkway                     | Hawalli              |         53 | Kuwait                                |
|        352 | 1673 Tangail Drive                     | Daugavpils           |         54 | Latvia                                |
|         27 | 1780 Hino Boulevard                    | Liepaja              |         54 | Latvia                                |
|         61 | 943 Tokat Street                       | Vaduz                |         55 | Liechtenstein                         |
|        563 | 1059 Yuncheng Avenue                   | Vilna                |         56 | Lithuania                             |
|         85 | 320 Baiyin Parkway                     | Mahajanga            |         57 | Madagascar                            |
|        170 | 710 San Felipe del Progreso Avenue     | Lilongwe             |         58 | Malawi                                |
|        175 | 316 Uruapan Street                     | Perak                |         59 | Malaysia                              |
|         62 | 1114 Liepaja Street                    | Sarawak              |         59 | Malaysia                              |
|        311 | 715 So Bernardo do Campo Lane          | Kedah                |         59 | Malaysia                              |
|        491 | 1789 Saint-Denis Parkway               | Coahuila de Zaragoza |         60 | Mexico                                |
|        419 | 397 Sunnyvale Avenue                   | Guanajuato           |         60 | Mexico                                |
|         88 | 125 Citt del Vaticano Boulevard        | Puebla               |         60 | Mexico                                |
|        584 | 1819 Alessandria Loop                  | Campeche             |         60 | Mexico                                |
|        593 | 1402 Zanzibar Boulevard                | Guanajuato           |         60 | Mexico                                |
|        251 | 1473 Changhwa Parkway                  | Mxico                |         60 | Mexico                                |
|        487 | 1785 So Bernardo do Campo Street       | Veracruz             |         60 | Mexico                                |
|        472 | 1447 Chatsworth Place                  | Chihuahua            |         60 | Mexico                                |
|        328 | 479 San Felipe del Progreso Avenue     | Morelos              |         60 | Mexico                                |
|        581 | 186 Skikda Lane                        | Morelos              |         60 | Mexico                                |
|        456 | 814 Simferopol Loop                    | Sinaloa              |         60 | Mexico                                |
|        369 | 817 Laredo Avenue                      | Jalisco              |         60 | Mexico                                |
|        154 | 781 Shimonoseki Drive                  | Michoacn de Ocampo   |         60 | Mexico                                |
|        588 | 966 Asuncin Way                        | Hidalgo              |         60 | Mexico                                |
|        112 | 1002 Ahmadnagar Manor                  | Mxico                |         60 | Mexico                                |
|        587 | 760 Miyakonojo Drive                   | Guerrero             |         60 | Mexico                                |
|        374 | 433 Florencia Street                   | Chihuahua            |         60 | Mexico                                |
|        493 | 184 Mandaluyong Street                 | Baja California Sur  |         60 | Mexico                                |
|        181 | 146 Johannesburg Way                   | Tamaulipas           |         60 | Mexico                                |
|        348 | 785 Vaduz Street                       | Baja California      |         60 | Mexico                                |
|        576 | 1351 Sousse Lane                       | Coahuila de Zaragoza |         60 | Mexico                                |
|        119 | 1107 Nakhon Sawan Avenue               | Mxico                |         60 | Mexico                                |
|        358 | 1698 Southport Loop                    | Hidalgo              |         60 | Mexico                                |
|        278 | 144 South Hill Loop                    | Guanajuato           |         60 | Mexico                                |
|        324 | 1145 Vilnius Manor                     | Mxico                |         60 | Mexico                                |
|        430 | 355 Vitria de Santo Anto Way           | Oaxaca               |         60 | Mexico                                |
|        137 | 261 Saint Louis Way                    | Coahuila de Zaragoza |         60 | Mexico                                |
|        459 | 251 Florencia Drive                    | Michoacn de Ocampo   |         60 | Mexico                                |
|        293 | 86 Higashiosaka Lane                   | Guanajuato           |         60 | Mexico                                |
|        470 | 1088 Ibirit Place                      | Jalisco              |         60 | Mexico                                |
|         42 | 269 Cam Ranh Parkway                   | Chisinau             |         61 | Moldova                               |
|        549 | 454 Qinhuangdao Drive                  | Tadla-Azilal         |         62 | Morocco                               |
|         44 | 671 Graz Street                        | Oriental             |         62 | Morocco                               |
|         26 | 28 Charlotte Amalie Street             | Rabat-Sal-Zammour-Z  |         62 | Morocco                               |
|        262 | 771 Yaound Manor                       | Sofala               |         63 | Mozambique                            |
|        438 | 596 Huixquilucan Place                 | Nampula              |         63 | Mozambique                            |
|        101 | 1599 Plock Drive                       | Tete                 |         63 | Mozambique                            |
|        261 | 51 Laredo Avenue                       | Sagaing              |         64 | Myanmar                               |
|          8 | 1566 Inegl Manor                       | Mandalay             |         64 | Myanmar                               |
|        519 | 962 Tama Loop                          |                      |         65 | Nauru                                 |
|        326 | 470 Boksburg Street                    | Central              |         66 | Nepal                                 |
|        420 | 992 Klerksdorp Loop                    | Utrecht              |         67 | Netherlands                           |
|        141 | 1749 Daxian Place                      | Gelderland           |         67 | Netherlands                           |
|        346 | 1217 Konotop Avenue                    | Gelderland           |         67 | Netherlands                           |
|        479 | 1854 Okara Boulevard                   | Drenthe              |         67 | Netherlands                           |
|        188 | 741 Ambattur Manor                     | Noord-Brabant        |         67 | Netherlands                           |
|         12 | 478 Joliet Way                         | Hamilton             |         68 | New Zealand                           |
|        289 | 1279 Udine Parkway                     | Edo & Delta          |         69 | Nigeria                               |
|        414 | 1936 Lapu-Lapu Parkway                 | Bauchi & Gombe       |         69 | Nigeria                               |
|        291 | 1155 Liaocheng Place                   | Oyo & Osun           |         69 | Nigeria                               |
|         84 | 1888 Kabul Drive                       | Oyo & Osun           |         69 | Nigeria                               |
|        202 | 955 Bamenda Way                        | Ondo & Ekiti         |         69 | Nigeria                               |
|        107 | 1177 Jelets Way                        | Kwara & Kogi         |         69 | Nigeria                               |
|         22 | 320 Brest Avenue                       | Kaduna               |         69 | Nigeria                               |
|        282 | 556 Baybay Manor                       | Oyo & Osun           |         69 | Nigeria                               |
|        160 | 1367 Yantai Manor                      | Ondo & Ekiti         |         69 | Nigeria                               |
|        285 | 1006 Santa Brbara dOeste Manor         | Ondo & Ekiti         |         69 | Nigeria                               |
|        254 | 786 Stara Zagora Way                   | Oyo & Osun           |         69 | Nigeria                               |
|        568 | 1342 Sharja Way                        | Sokoto & Kebbi & Zam |         69 | Nigeria                               |
|        236 | 885 Yingkou Manor                      | Kaduna               |         69 | Nigeria                               |
|        161 | 1386 Nakhon Sawan Boulevard            | Pyongyang-si         |         70 | North Korea                           |
|         13 | 613 Korolev Drive                      | Masqat               |         71 | Oman                                  |
|        503 | 1416 San Juan Bautista Tuxtepec Avenue | Zufar                |         71 | Oman                                  |
|        421 | 966 Arecibo Loop                       | Sind                 |         72 | Pakistan                              |
|        227 | 1820 Maring Parkway                    | Punjab               |         72 | Pakistan                              |
|         24 | 1688 Okara Way                         | Nothwest Border Prov |         72 | Pakistan                              |
|        404 | 734 Bchar Place                        | Punjab               |         72 | Pakistan                              |
|         29 | 934 San Felipe de Puerto Plata Street  | Sind                 |         72 | Pakistan                              |
|        230 | 201 Effon-Alaiye Way                   | Asuncin              |         73 | Paraguay                              |
|        209 | 1679 Antofagasta Street                | Alto Paran           |         73 | Paraguay                              |
|        350 | 1628 Nagareyama Lane                   | Central              |         73 | Paraguay                              |
|        309 | 827 Yuncheng Drive                     | Callao               |         74 | Peru                                  |
|        571 | 1746 Faaa Way                          | Huanuco              |         74 | Peru                                  |
|        126 | 1175 Tanauan Way                       | Lima                 |         74 | Peru                                  |
|        603 | 1103 Quilmes Boulevard                 | Piura                |         74 | Peru                                  |
|         75 | 492 Cam Ranh Street                    | Eastern Visayas      |         75 | Philippines                           |
|        192 | 1166 Changhwa Street                   | Caraga               |         75 | Philippines                           |
|         98 | 152 Kitwe Parkway                      | Caraga               |         75 | Philippines                           |
|        376 | 1061 Ede Avenue                        | Southern Tagalog     |         75 | Philippines                           |
|        393 | 717 Changzhou Lane                     | Southern Tagalog     |         75 | Philippines                           |
|         31 | 217 Botshabelo Place                   | Southern Mindanao    |         75 | Philippines                           |
|        466 | 118 Jaffna Loop                        | Northern Mindanao    |         75 | Philippines                           |
|        260 | 127 Iwakuni Boulevard                  | Central Luzon        |         75 | Philippines                           |
|        586 | 951 Springs Lane                       | Central Mindanao     |         75 | Philippines                           |
|        354 | 953 Hodeida Street                     | Southern Tagalog     |         75 | Philippines                           |
|        248 | 582 Papeete Loop                       | Central Visayas      |         75 | Philippines                           |
|        268 | 1831 Nam Dinh Loop                     | National Capital Reg |         75 | Philippines                           |
|        439 | 1351 Aparecida de Goinia Parkway       | Northern Mindanao    |         75 | Philippines                           |
|        528 | 1176 Southend-on-Sea Manor             | Southern Tagalog     |         75 | Philippines                           |
|         76 | 89 Allappuzha (Alleppey) Manor         | National Capital Reg |         75 | Philippines                           |
|        510 | 48 Maracabo Place                      | Central Luzon        |         75 | Philippines                           |
|        378 | 1191 Tandil Drive                      | Southern Tagalog     |         75 | Philippines                           |
|        240 | 1479 Rustenburg Boulevard              | Southern Tagalog     |         75 | Philippines                           |
|        554 | 947 Trshavn Place                      | Central Luzon        |         75 | Philippines                           |
|        266 | 862 Xintai Lane                        | Cagayan Valley       |         75 | Philippines                           |
|        323 | 1769 Iwaki Lane                        | Kujawsko-Pomorskie   |         76 | Poland                                |
|        578 | 1405 Hagonoy Avenue                    | Slaskie              |         76 | Poland                                |
|        132 | 1050 Garden Grove Avenue               | Slaskie              |         76 | Poland                                |
|        275 | 906 Goinia Way                         | Wielkopolskie        |         76 | Poland                                |
|        506 | 414 Mandaluyong Street                 | Lubelskie            |         76 | Poland                                |
|        577 | 1501 Pangkal Pinang Avenue             | Mazowieckie          |         76 | Poland                                |
|        385 | 1642 Charlotte Amalie Drive            | Slaskie              |         76 | Poland                                |
|        564 | 505 Madiun Boulevard                   | Dolnoslaskie         |         76 | Poland                                |
|        365 | 1009 Zanzibar Lane                     | Arecibo              |         77 | Puerto Rico                           |
|        287 | 1405 Chisinau Place                    | Ponce                |         77 | Puerto Rico                           |
|        234 | 1256 Bislig Boulevard                  | Botosani             |         78 | Romania                               |
|        569 | 1342 Abha Boulevard                    | Bukarest             |         78 | Romania                               |
|        152 | 1952 Pune Lane                         | Saint-Denis          |         79 | Runion                                |
|        402 | 616 Hagonoy Avenue                     | Krasnojarsk          |         80 | Russian Federation                    |
|         59 | 1697 Kowloon and New Kowloon Loop      | Moskova              |         80 | Russian Federation                    |
|        435 | 740 Udaipur Lane                       | Nizni Novgorod       |         80 | Russian Federation                    |
|         21 | 270 Toulon Boulevard                   | Kalmykia             |         80 | Russian Federation                    |
|        110 | 1867 San Juan Bautista Tuxtepec Avenue | Ivanovo              |         80 | Russian Federation                    |
|        226 | 810 Palghat (Palakkad) Boulevard       | Jaroslavl            |         80 | Russian Federation                    |
|        104 | 1913 Kamakura Place                    | Lipetsk              |         80 | Russian Federation                    |
|        306 | 1883 Maikop Lane                       | Kaliningrad          |         80 | Russian Federation                    |
|        515 | 886 Tonghae Place                      | Volgograd            |         80 | Russian Federation                    |
|        183 | 1089 Iwatsuki Avenue                   | Kirov                |         80 | Russian Federation                    |
|        300 | 661 Chisinau Lane                      | Pietari              |         80 | Russian Federation                    |
|        398 | 954 Lapu-Lapu Way                      | Moskova              |         80 | Russian Federation                    |
|        381 | 1618 Olomouc Manor                     | Kurgan               |         80 | Russian Federation                    |
|        316 | 746 Joliet Lane                        | Kursk                |         80 | Russian Federation                    |
|         48 | 1998 Halifax Drive                     | Lipetsk              |         80 | Russian Federation                    |
|        164 | 1623 Baha Blanca Manor                 | Moskova              |         80 | Russian Federation                    |
|        351 | 1157 Nyeri Loop                        | Adygea               |         80 | Russian Federation                    |
|         50 | 46 Pjatigorsk Lane                     | Moscow (City)        |         80 | Russian Federation                    |
|        452 | 207 Cuernavaca Loop                    | Tatarstan            |         80 | Russian Federation                    |
|         52 | 909 Garland Manor                      | Tatarstan            |         80 | Russian Federation                    |
|        195 | 1077 San Felipe de Puerto Plata Place  | Rostov-na-Donu       |         80 | Russian Federation                    |
|        492 | 185 Mannheim Lane                      | Stavropol            |         80 | Russian Federation                    |
|        573 | 1407 Surakarta Manor                   | Moskova              |         80 | Russian Federation                    |
|        131 | 801 Hagonoy Drive                      | Smolensk             |         80 | Russian Federation                    |
|        433 | 1823 Hoshiarpur Lane                   | Komi                 |         80 | Russian Federation                    |
|        355 | 469 Nakhon Sawan Street                | Tuvassia             |         80 | Russian Federation                    |
|        467 | 1621 Tongliao Avenue                   | Irkutsk              |         80 | Russian Federation                    |
|        356 | 1378 Beira Loop                        | Krasnojarsk          |         80 | Russian Federation                    |
|        331 | 1016 Iwakuni Street                    | St George            |         81 | Saint Vincent and the Grenadines      |
|        105 | 733 Mandaluyong Place                  | Asir                 |         82 | Saudi Arabia                          |
|         74 | 1124 Buenaventura Drive                | Mekka                |         82 | Saudi Arabia                          |
|        422 | 289 Santo Andr Manor                   | al-Sharqiya          |         82 | Saudi Arabia                          |
|         53 | 725 Isesaki Place                      | Mekka                |         82 | Saudi Arabia                          |
|        317 | 780 Kimberley Way                      | Tabuk                |         82 | Saudi Arabia                          |
|        461 | 1889 Valparai Way                      | Ziguinchor           |         83 | Senegal                               |
|        362 | 482 Kowloon and New Kowloon Manor      | Bratislava           |         84 | Slovakia                              |
|        129 | 569 Baicheng Lane                      | Gauteng              |         85 | South Africa                          |
|        136 | 898 Belm Manor                         | Free State           |         85 | South Africa                          |
|        561 | 1497 Fengshan Drive                    | KwaZulu-Natal        |         85 | South Africa                          |
|        476 | 270 Tambaram Parkway                   | Gauteng              |         85 | South Africa                          |
|         23 | 1417 Lancaster Avenue                  | Northern Cape        |         85 | South Africa                          |
|        113 | 682 Junan Way                          | North West           |         85 | South Africa                          |
|        437 | 1766 Almirante Brown Street            | KwaZulu-Natal        |         85 | South Africa                          |
|        343 | 1443 Mardan Street                     | Western Cape         |         85 | South Africa                          |
|        412 | 1639 Saarbrcken Drive                  | North West           |         85 | South Africa                          |
|        149 | 999 Sanaa Loop                         | Gauteng              |         85 | South Africa                          |
|         87 | 929 Tallahassee Loop                   | Gauteng              |         85 | South Africa                          |
|         92 | 1942 Ciparay Parkway                   | Cheju                |         86 | South Korea                           |
|        103 | 588 Vila Velha Manor                   | Kyongsangbuk         |         86 | South Korea                           |
|        241 | 647 A Corua (La Corua) Street          | Chollanam            |         86 | South Korea                           |
|        542 | 193 Bhusawal Place                     | Kang-won             |         86 | South Korea                           |
|        249 | 300 Junan Street                       | Kyonggi              |         86 | South Korea                           |
|         56 | 939 Probolinggo Loop                   | Galicia              |         87 | Spain                                 |
|        298 | 44 Najafabad Way                       | Baskimaa             |         87 | Spain                                 |
|        399 | 331 Bydgoszcz Parkway                  | Asturia              |         87 | Spain                                 |
|        474 | 1469 Plock Lane                        | Galicia              |         87 | Spain                                 |
|        555 | 1764 Jalib al-Shuyukh Parkway          | Galicia              |         87 | Spain                                 |
|        413 | 692 Amroha Drive                       | Northern             |         88 | Sri Lanka                             |
|        400 | 1152 Citrus Heights Manor              | al-Qadarif           |         89 | Sudan                                 |
|         54 | 115 Hidalgo Parkway                    | Khartum              |         89 | Sudan                                 |
|         70 | 1150 Kimchon Manor                     | Skne ln              |         90 | Sweden                                |
|         65 | 915 Ponce Place                        | Basel-Stadt          |         91 | Switzerland                           |
|        159 | 185 Novi Sad Place                     | Bern                 |         91 | Switzerland                           |
|        604 | 1331 Usak Boulevard                    | Vaud                 |         91 | Switzerland                           |
|         79 | 1551 Rampur Lane                       | Changhwa             |         92 | Taiwan                                |
|         77 | 1947 Poos de Caldas Boulevard          | Chiayi               |         92 | Taiwan                                |
|        523 | 608 Birgunj Parkway                    | Taipei               |         92 | Taiwan                                |
|        582 | 1568 Celaya Parkway                    | Kaohsiung            |         92 | Taiwan                                |
|        353 | 381 Kabul Way                          | Taipei               |         92 | Taiwan                                |
|         34 | 1668 Anpolis Street                    | Taipei               |         92 | Taiwan                                |
|          9 | 53 Idfu Parkway                        | Nantou               |         92 | Taiwan                                |
|        583 | 1489 Kakamigahara Lane                 | Taipei               |         92 | Taiwan                                |
|        143 | 1029 Dzerzinsk Manor                   | Ynlin                |         92 | Taiwan                                |
|        592 | 1923 Stara Zagora Lane                 | Nantou               |         92 | Taiwan                                |
|        486 | 64 Korla Street                        | Mwanza               |         93 | Tanzania                              |
|        194 | 605 Rio Claro Parkway                  | Tabora               |         93 | Tanzania                              |
|        224 | 1842 Luzinia Boulevard                 | Zanzibar West        |         93 | Tanzania                              |
|        395 | 1337 Mit Ghamr Avenue                  | Nakhon Sawan         |         94 | Thailand                              |
|         46 | 1632 Bislig Avenue                     | Nonthaburi           |         94 | Thailand                              |
|         90 | 870 Ashqelon Loop                      | Songkhla             |         94 | Thailand                              |
|        349 | 1516 Escobar Drive                     | Tongatapu            |         95 | Tonga                                 |
|        340 | 507 Smolensk Loop                      | Sousse               |         96 | Tunisia                               |
|        332 | 663 Baha Blanca Parkway                | Adana                |         97 | Turkey                                |
|        371 | 1912 Emeishan Drive                    | Balikesir            |         97 | Turkey                                |
|        176 | 29 Pyongyang Loop                      | Batman               |         97 | Turkey                                |
|        488 | 698 Jelets Boulevard                   | Denizli              |         97 | Turkey                                |
|        512 | 1269 Ipoh Avenue                       | Eskisehir            |         97 | Turkey                                |
|        485 | 984 Novoterkassk Loop                  | Gaziantep            |         97 | Turkey                                |
|        283 | 457 Tongliao Loop                      | Bursa                |         97 | Turkey                                |
|        147 | 374 Bat Yam Boulevard                  | Kilis                |         97 | Turkey                                |
|        128 | 848 Tafuna Manor                       | Ktahya               |         97 | Turkey                                |
|         17 | 270 Amroha Parkway                     | Osmaniye             |         97 | Turkey                                |
|        524 | 680 A Corua (La Corua) Manor           | Sivas                |         97 | Turkey                                |
|        498 | 319 Plock Parkway                      | Istanbul             |         97 | Turkey                                |
|        168 | 842 Salzburg Lane                      | Adana                |         97 | Turkey                                |
|        572 | 539 Hami Way                           | Tokat                |         97 | Turkey                                |
|        208 | 1215 Pyongyang Parkway                 | Usak                 |         97 | Turkey                                |
|        204 | 387 Mwene-Ditu Drive                   | Ahal                 |         98 | Turkmenistan                          |
|        109 | 454 Nakhon Sawan Boulevard             | Funafuti             |         99 | Tuvalu                                |
|        391 | 1793 Meixian Place                     | Hmelnytskyi          |        100 | Ukraine                               |
|        551 | 182 Nukualofa Drive                    | Sumy                 |        100 | Ukraine                               |
|        135 | 1752 So Leopoldo Parkway               | Taka-Karpatia        |        100 | Ukraine                               |
|        480 | 421 Yaound Street                      | Sumy                 |        100 | Ukraine                               |
|         86 | 927 Baha Blanca Parkway                | Krim                 |        100 | Ukraine                               |
|        191 | 140 Chiayi Parkway                     | Sumy                 |        100 | Ukraine                               |
|        457 | 535 Ahmadnagar Manor                   | Abu Dhabi            |        101 | United Arab Emirates                  |
|        102 | 669 Firozabad Loop                     | Abu Dhabi            |        101 | United Arab Emirates                  |
|        297 | 1192 Tongliao Street                   | Sharja               |        101 | United Arab Emirates                  |
|         89 | 1557 Ktahya Boulevard                  | England              |        102 | United Kingdom                        |
|        146 | 483 Ljubertsy Parkway                  | Scotland             |        102 | United Kingdom                        |
|        256 | 1497 Yuzhou Drive                      | England              |        102 | United Kingdom                        |
|        517 | 548 Uruapan Street                     | Ontario              |        102 | United Kingdom                        |
|        589 | 1584 Ljubertsy Lane                    | England              |        102 | United Kingdom                        |
|         20 | 360 Toulouse Parkway                   | England              |        102 | United Kingdom                        |
|        562 | 869 Shikarpur Way                      | England              |        102 | United Kingdom                        |
|        482 | 808 Naala-Porto Parkway                | England              |        102 | United Kingdom                        |
|        502 | 1515 Korla Way                         | England              |        102 | United Kingdom                        |
|        484 | 98 Pyongyang Boulevard                 | Ohio                 |        103 | United States                         |
|        310 | 913 Coacalco de Berriozbal Loop        | Texas                |        103 | United States                         |
|        100 | 1308 Arecibo Way                       | Georgia              |        103 | United States                         |
|        335 | 587 Benguela Manor                     | Illinois             |        103 | United States                         |
|        543 | 43 Vilnius Manor                       | Colorado             |        103 | United States                         |
|        216 | 660 Jedda Boulevard                    | Washington           |        103 | United States                         |
|        153 | 782 Mosul Street                       | Massachusetts        |        103 | United States                         |
|        532 | 1427 Tabuk Place                       | Florida              |        103 | United States                         |
|         18 | 770 Bydgoszcz Avenue                   | California           |        103 | United States                         |
|        144 | 1666 Beni-Mellal Place                 | Tennessee            |        103 | United States                         |
|        186 | 533 al-Ayn Boulevard                   | California           |        103 | United States                         |
|        405 | 530 Lausanne Lane                      | Texas                |        103 | United States                         |
|        299 | 32 Pudukkottai Lane                    | Ohio                 |        103 | United States                         |
|        425 | 1866 al-Qatif Avenue                   | California           |        103 | United States                         |
|         55 | 1135 Izumisano Parkway                 | California           |        103 | United States                         |
|        599 | 1895 Zhezqazghan Drive                 | California           |        103 | United States                         |
|        567 | 1894 Boa Vista Way                     | Texas                |        103 | United States                         |
|        122 | 333 Goinia Way                         | Texas                |        103 | United States                         |
|        162 | 369 Papeete Way                        | North Carolina       |        103 | United States                         |
|        509 | 786 Matsue Way                         | Illinois             |        103 | United States                         |
|        313 | 1191 Sungai Petani Boulevard           | Missouri             |        103 | United States                         |
|        116 | 793 Cam Ranh Avenue                    | California           |        103 | United States                         |
|         10 | 1795 Santiago de Compostela Way        | Texas                |        103 | United States                         |
|         67 | 1214 Hanoi Way                         | Nebraska             |        103 | United States                         |
|        387 | 401 Sucre Boulevard                    | New Hampshire        |        103 | United States                         |
|        185 | 682 Garden Grove Place                 | Tennessee            |        103 | United States                         |
|        280 | 1980 Kamjanets-Podilskyi Street        | Illinois             |        103 | United States                         |
|        296 | 1936 Cuman Avenue                      | Virginia             |        103 | United States                         |
|        462 | 1485 Bratislava Place                  | Illinois             |        103 | United States                         |
|         66 | 1717 Guadalajara Lane                  | Missouri             |        103 | United States                         |
|        274 | 920 Kumbakonam Loop                    | California           |        103 | United States                         |
|          6 | 1121 Loja Avenue                       | California           |        103 | United States                         |
|        150 | 879 Newcastle Way                      | Michigan             |        103 | United States                         |
|        218 | 226 Brest Manor                        | California           |        103 | United States                         |
|        252 | 1309 Weifang Street                    | Florida              |        103 | United States                         |
|        281 | 1944 Bamenda Way                       | Michigan             |        103 | United States                         |
|        574 | 502 Mandi Bahauddin Parkway            | Anzotegui            |        104 | Venezuela                             |
|        115 | 1378 Alvorada Avenue                   | Distrito Federal     |        104 | Venezuela                             |
|        117 | 1079 Tel Aviv-Jaffa Boulevard          | Sucre                |        104 | Venezuela                             |
|        458 | 138 Caracas Boulevard                  | Zulia                |        104 | Venezuela                             |
|        178 | 1848 Salala Boulevard                  | Miranda              |        104 | Venezuela                             |
|        545 | 163 Augusta-Richmond County Loop       | Carabobo             |        104 | Venezuela                             |
|        295 | 544 Tarsus Boulevard                   | Gurico               |        104 | Venezuela                             |
|        538 | 1817 Livorno Way                       | Khanh Hoa            |        105 | Vietnam                               |
|        203 | 1149 A Corua (La Corua) Boulevard      | Haiphong             |        105 | Vietnam                               |
|        345 | 68 Ponce Parkway                       | Hanoi                |        105 | Vietnam                               |
|        477 | 1786 Salinas Place                     | Nam Ha               |        105 | Vietnam                               |
|        526 | 617 Klerksdorp Place                   | Khanh Hoa            |        105 | Vietnam                               |
|        529 | 600 Purnea (Purnia) Avenue             | Nghe An              |        105 | Vietnam                               |
|        411 | 264 Bhimavaram Manor                   | St Thomas            |        106 | Virgin Islands, U.S.                  |
|        214 | 751 Lima Loop                          | Aden                 |        107 | Yemen                                 |
|        475 | 434 Ourense (Orense) Manor             | Hodeida              |        107 | Yemen                                 |
|        308 | 687 Alessandria Parkway                | Sanaa                |        107 | Yemen                                 |
|        217 | 1001 Miyakonojo Lane                   | Taizz                |        107 | Yemen                                 |
|         11 | 900 Santiago de Compostela Parkway     | Central Serbia       |        108 | Yugoslavia                            |
|        559 | 1917 Kumbakonam Parkway                | Vojvodina            |        108 | Yugoslavia                            |
|        443 | 1836 Korla Parkway                     | Copperbelt           |        109 | Zambia                                |
+------------+----------------------------------------+----------------------+------------+---------------------------------------+
603 rows in set (0.336 sec)

mysql> SELECT adr.address_id, adr.address, adr.district, cit.city, cot.country FROM address AS adr JOIN city AS cit USING(city_id) JOIN country AS cot USING(country_id) ORDER BY cot.country;
+------------+----------------------------------------+----------------------+----------------------------+---------------------------------------+
| address_id | address                                | district             | city                       | country                               |
+------------+----------------------------------------+----------------------+----------------------------+---------------------------------------+
|        222 | 1168 Najafabad Parkway                 | Kabol                | Kabul                      | Afghanistan                           |
|        446 | 1924 Shimonoseki Drive                 | Batna                | Batna                      | Algeria                               |
|         73 | 1031 Daugavpils Parkway                | Bchar                | Bchar                      | Algeria                               |
|        180 | 757 Rustenburg Avenue                  | Skikda               | Skikda                     | Algeria                               |
|        325 | 1892 Nabereznyje Telny Lane            | Tutuila              | Tafuna                     | American Samoa                        |
|        534 | 486 Ondo Parkway                       | Benguela             | Benguela                   | Angola                                |
|        388 | 368 Hunuco Boulevard                   | Namibe               | Namibe                     | Angola                                |
|        386 | 1368 Maracabo Boulevard                |                      | South Hill                 | Anguilla                              |
|        364 | 1623 Kingstown Drive                   | Buenos Aires         | Almirante Brown            | Argentina                             |
|        566 | 1229 Varanasi (Benares) Manor          | Buenos Aires         | Avellaneda                 | Argentina                             |
|        327 | 1427 A Corua (La Corua) Place          | Buenos Aires         | Baha Blanca                | Argentina                             |
|         28 | 96 Tafuna Way                          | Crdoba               | Crdoba                     | Argentina                             |
|        450 | 203 Tambaram Street                    | Buenos Aires         | Escobar                    | Argentina                             |
|        536 | 166 Jinchang Street                    | Buenos Aires         | Ezeiza                     | Argentina                             |
|         93 | 1926 El Alto Avenue                    | Buenos Aires         | La Plata                   | Argentina                             |
|        111 | 1532 Dzerzinsk Way                     | Buenos Aires         | Merlo                      | Argentina                             |
|        591 | 773 Dallas Manor                       | Buenos Aires         | Quilmes                    | Argentina                             |
|        247 | 1483 Pathankot Street                  | Tucumn               | San Miguel de Tucumn       | Argentina                             |
|        336 | 430 Kumbakonam Drive                   | Santa F              | Santa F                    | Argentina                             |
|        410 | 88 Nagaon Manor                        | Buenos Aires         | Tandil                     | Argentina                             |
|        223 | 1244 Allappuzha (Alleppey) Place       | Buenos Aires         | Vicente Lpez               | Argentina                             |
|         45 | 42 Brindisi Place                      | Yerevan              | Yerevan                    | Armenia                               |
|          2 | 28 MySQL Boulevard                     | QLD                  | Woodridge                  | Australia                             |
|          4 | 1411 Lillydale Drive                   | QLD                  | Woodridge                  | Australia                             |
|        177 | 1010 Klerksdorp Way                    | Steiermark           | Graz                       | Austria                               |
|        163 | 1440 Compton Place                     | North Austria        | Linz                       | Austria                               |
|        271 | 1587 Loja Manor                        | Salzburg             | Salzburg                   | Austria                               |
|        338 | 431 Szkesfehrvr Avenue                 | Baki                 | Baku                       | Azerbaijan                            |
|        339 | 503 Sogamoso Loop                      | Sumqayit             | Sumqayit                   | Azerbaijan                            |
|        596 | 1759 Niznekamsk Avenue                 | al-Manama            | al-Manama                  | Bahrain                               |
|        337 | 1838 Tabriz Lane                       | Dhaka                | Dhaka                      | Bangladesh                            |
|        334 | 1816 Bydgoszcz Loop                    | Dhaka                | Jamalpur                   | Bangladesh                            |
|         25 | 262 A Corua (La Corua) Parkway         | Dhaka                | Tangail                    | Bangladesh                            |
|        533 | 556 Asuncin Way                        | Mogiljov             | Mogiljov                   | Belarus                               |
|        148 | 1027 Songkhla Manor                    | Minsk                | Molodetno                  | Belarus                               |
|        460 | 659 Gatineau Boulevard                 | La Paz               | El Alto                    | Bolivia                               |
|        436 | 287 Cuautla Boulevard                  | Chuquisaca           | Sucre                      | Bolivia                               |
|        557 | 1407 Pachuca de Soto Place             | Rio Grande do Sul    | Alvorada                   | Brazil                                |
|        312 | 1354 Siegen Street                     | Rio de Janeiro       | Angra dos Reis             | Brazil                                |
|        233 | 356 Olomouc Manor                      | Gois                 | Anpolis                    | Brazil                                |
|        220 | 1201 Qomsheh Manor                     | Gois                 | Aparecida de Goinia        | Brazil                                |
|         81 | 1692 Ede Loop                          | So Paulo             | Araatuba                   | Brazil                                |
|        403 | 1190 0 Place                           | Rio Grande do Sul    | Bag                        | Brazil                                |
|        367 | 1163 London Parkway                    | Par                  | Belm                       | Brazil                                |
|        210 | 1304 s-Hertogenbosch Way               | Santa Catarina       | Blumenau                   | Brazil                                |
|        347 | 1293 Nam Dinh Way                      | Roraima              | Boa Vista                  | Brazil                                |
|        330 | 981 Kumbakonam Place                   | Distrito Federal     | Braslia                    | Brazil                                |
|         96 | 984 Effon-Alaiye Avenue                | Gois                 | Goinia                     | Brazil                                |
|        432 | 259 Ipoh Drive                         | So Paulo             | Guaruj                     | Brazil                                |
|        134 | 758 Junan Lane                         | Gois                 | guas Lindas de Gois        | Brazil                                |
|        315 | 543 Bergamo Avenue                     | Minas Gerais         | Ibirit                     | Brazil                                |
|         51 | 686 Garland Manor                      | Cear                 | Juazeiro do Norte          | Brazil                                |
|        597 | 32 Liaocheng Way                       | Minas Gerais         | Juiz de Fora               | Brazil                                |
|        187 | 1839 Szkesfehrvr Parkway               | Gois                 | Luzinia                    | Brazil                                |
|        250 | 829 Grand Prairie Way                  | Paran                | Maring                     | Brazil                                |
|        130 | 1666 Qomsheh Drive                     | So Paulo             | Po                         | Brazil                                |
|        259 | 1338 Zalantun Lane                     | Minas Gerais         | Poos de Caldas             | Brazil                                |
|         78 | 1206 Dos Quebradas Place               | So Paulo             | Rio Claro                  | Brazil                                |
|        182 | 1891 Rizhao Boulevard                  | So Paulo             | Santa Brbara dOeste        | Brazil                                |
|        359 | 519 Nyeri Manor                        | So Paulo             | Santo Andr                 | Brazil                                |
|        550 | 1715 Okayama Street                    | So Paulo             | So Bernardo do Campo       | Brazil                                |
|        448 | 614 Denizli Parkway                    | Rio Grande do Sul    | So Leopoldo                | Brazil                                |
|        319 | 1957 Yantai Lane                       | So Paulo             | Sorocaba                   | Brazil                                |
|         43 | 306 Antofagasta Place                  | Esprito Santo        | Vila Velha                 | Brazil                                |
|        379 | 1133 Rizhao Avenue                     | Pernambuco           | Vitria de Santo Anto       | Brazil                                |
|         95 | 1370 Le Mans Avenue                    | Brunei and Muara     | Bandar Seri Begawan        | Brunei                                |
|        546 | 191 Jos Azueta Parkway                 | Ruse                 | Ruse                       | Bulgaria                              |
|        219 | 1229 Valencia Parkway                  | Haskovo              | Stara Zagora               | Bulgaria                              |
|        522 | 1768 Udine Loop                        | Battambang           | Battambang                 | Cambodia                              |
|        232 | 754 Valencia Place                     | Phnom Penh           | Phnom Penh                 | Cambodia                              |
|        357 | 1641 Changhwa Place                    | Nord-Ouest           | Bamenda                    | Cameroon                              |
|        366 | 114 Jalib al-Shuyukh Manor             | Centre               | Yaound                     | Cameroon                              |
|        481 | 1153 Allende Way                       | Qubec                | Gatineau                   | Canada                                |
|        468 | 1844 Usak Avenue                       | Nova Scotia          | Halifax                    | Canada                                |
|          1 | 47 MySakila Drive                      | Alberta              | Lethbridge                 | Canada                                |
|          3 | 23 Workhaven Lane                      | Alberta              | Lethbridge                 | Canada                                |
|        193 | 891 Novi Sad Manor                     | Ontario              | Oshawa                     | Canada                                |
|        415 | 432 Garden Grove Street                | Ontario              | Richmond Hill              | Canada                                |
|        441 | 983 Santa F Way                        | British Colombia     | Vancouver                  | Canada                                |
|        541 | 195 Ilorin Street                      | Chari-Baguirmi       | NDjamna                    | Chad                                  |
|         49 | 1718 Valencia Street                   | Antofagasta          | Antofagasta                | Chile                                 |
|        521 | 568 Dhule (Dhulia) Loop                | Coquimbo             | Coquimbo                   | Chile                                 |
|        469 | 1872 Toulon Loop                       | OHiggins             | Rancagua                   | Chile                                 |
|        544 | 183 Haiphong Street                    | Jilin                | Baicheng                   | China                                 |
|        500 | 362 Rajkot Lane                        | Gansu                | Baiyin                     | China                                 |
|        539 | 1332 Gaziantep Lane                    | Shandong             | Binzhou                    | China                                 |
|        201 | 817 Bradford Loop                      | Jiangsu              | Changzhou                  | China                                 |
|        265 | 1158 Mandi Bahauddin Parkway           | Shanxi               | Datong                     | China                                 |
|         68 | 1966 Amroha Avenue                     | Sichuan              | Daxian                     | China                                 |
|        471 | 1322 Mosul Parkway                     | Shandong             | Dongying                   | China                                 |
|        394 | 753 Ilorin Avenue                      | Sichuan              | Emeishan                   | China                                 |
|        114 | 804 Elista Drive                       | Hubei                | Enshi                      | China                                 |
|        318 | 1774 Yaound Place                      | Hubei                | Ezhou                      | China                                 |
|        215 | 1333 Haldia Street                     | Jilin                | Fuyu                       | China                                 |
|        286 | 1308 Sumy Loop                         | Fujian               | Fuzhou                     | China                                 |
|        558 | 904 Clarksville Drive                  | Zhejiang             | Haining                    | China                                 |
|        169 | 154 Tallahassee Loop                   | Xinxiang             | Hami                       | China                                 |
|        142 | 1587 Sullana Lane                      | Inner Mongolia       | Hohhot                     | China                                 |
|        389 | 500 Lincoln Parkway                    | Jiangsu              | Huaian                     | China                                 |
|        172 | 475 Atinsk Way                         | Gansu                | Jinchang                   | China                                 |
|        600 | 1837 Kaduna Parkway                    | Inner Mongolia       | Jining                     | China                                 |
|        601 | 844 Bucuresti Place                    | Liaoning             | Jinzhou                    | China                                 |
|        440 | 722 Bradford Lane                      | Shandong             | Junan                      | China                                 |
|        288 | 226 Halifax Street                     | Xinxiang             | Korla                      | China                                 |
|        155 | 1560 Jelets Boulevard                  | Shandong             | Laiwu                      | China                                 |
|        427 | 1557 Cape Coral Parkway                | Hubei                | Laohekou                   | China                                 |
|        272 | 1762 Paarl Parkway                     | Hunan                | Lengshuijiang              | China                                 |
|        575 | 1052 Pathankot Avenue                  | Sichuan              | Leshan                     | China                                 |
|        133 | 1854 Tieli Street                      | Shandong             | Liaocheng                  | China                                 |
|         94 | 1952 Chatsworth Drive                  | Guangdong            | Meixian                    | China                                 |
|         41 | 1440 Fukuyama Loop                     | Henan                | Nanyang                    | China                                 |
|        173 | 1294 Firozabad Drive                   | Jiangxi              | Pingxiang                  | China                                 |
|        246 | 1246 Boksburg Parkway                  | Hebei                | Qinhuangdao                | China                                 |
|        501 | 1060 Tandil Lane                       | Shandong             | Rizhao                     | China                                 |
|        552 | 390 Wroclaw Way                        | Hainan               | Sanya                      | China                                 |
|        429 | 1269 Botosani Manor                    | Guangdong            | Shanwei                    | China                                 |
|        490 | 1909 Dayton Avenue                     | Guangdong            | Shaoguan                   | China                                 |
|        383 | 686 Donostia-San Sebastin Lane         | Guangdong            | Shenzhen                   | China                                 |
|        516 | 1574 Goinia Boulevard                  | Heilongjiang         | Suihua                     | China                                 |
|        253 | 1760 Oshawa Manor                      | Tianjin              | Tianjin                    | China                                 |
|        307 | 1908 Gaziantep Place                   | Liaoning             | Tiefa                      | China                                 |
|        605 | 1325 Fukuyama Street                   | Heilongjiang         | Tieli                      | China                                 |
|        447 | 105 Dzerzinsk Manor                    | Inner Mongolia       | Tongliao                   | China                                 |
|        594 | 1464 Kursk Parkway                     | Shandong             | Weifang                    | China                                 |
|        245 | 1103 Bilbays Parkway                   | Hubei                | Xiangfan                   | China                                 |
|         71 | 1586 Guaruj Place                      | Hunan                | Xiangtan                   | China                                 |
|        570 | 415 Pune Avenue                        | Shandong             | Xintai                     | China                                 |
|        344 | 1909 Benguela Lane                     | Henan                | Xinxiang                   | China                                 |
|        277 | 85 San Felipe de Puerto Plata Drive    | Shandong             | Yantai                     | China                                 |
|        489 | 1297 Alvorada Parkway                  | Ningxia              | Yinchuan                   | China                                 |
|        527 | 1993 0 Loop                            | Liaoning             | Yingkou                    | China                                 |
|        158 | 798 Cianjur Avenue                     | Shanxi               | Yuncheng                   | China                                 |
|        329 | 867 Benin City Avenue                  | Henan                | Yuzhou                     | China                                 |
|         97 | 832 Nakhon Sawan Manor                 | Inner Mongolia       | Zalantun                   | China                                 |
|        520 | 1778 Gijn Manor                        | Hubei                | Zaoyang                    | China                                 |
|        556 | 346 Cam Ranh Avenue                    | Zhejiang             | Zhoushan                   | China                                 |
|        239 | 98 Stara Zagora Boulevard              | Valle                | Buenaventura               | Colombia                              |
|        124 | 241 Mosul Lane                         | Risaralda            | Dos Quebradas              | Colombia                              |
|        465 | 734 Tanshui Avenue                     | Caquet               | Florencia                  | Colombia                              |
|        184 | 1410 Benin City Parkway                | Risaralda            | Pereira                    | Colombia                              |
|         91 | 1740 Portoviejo Avenue                 | Sucre                | Sincelejo                  | Colombia                              |
|        495 | 656 Matamoros Drive                    | Boyac                | Sogamoso                   | Colombia                              |
|        392 | 514 Ife Way                            | Shaba                | Lubumbashi                 | Congo, The Democratic Republic of the |
|        380 | 1519 Santiago de los Caballeros Loop   | East Kasai           | Mwene-Ditu                 | Congo, The Democratic Republic of the |
|        270 | 682 Halisahar Place                    | Severn Morava        | Olomouc                    | Czech Republic                        |
|        442 | 1245 Ibirit Way                        | La Romana            | La Romana                  | Dominican Republic                    |
|        423 | 437 Chungho Drive                      | Puerto Plata         | San Felipe de Puerto Plata | Dominican Republic                    |
|        263 | 532 Toulon Street                      | Santiago             | Santiago de los Caballeros | Dominican Republic                    |
|        595 | 1074 Sanaa Parkway                     | Loja                 | Loja                       | Ecuador                               |
|        267 | 816 Cayenne Parkway                    | Manab                | Portoviejo                 | Ecuador                               |
|        499 | 1954 Kowloon and New Kowloon Way       | Chimborazo           | Robamba                    | Ecuador                               |
|        565 | 1741 Hoshiarpur Boulevard              | al-Sharqiya          | Bilbays                    | Egypt                                 |
|        237 | 1736 Cavite Place                      | Qina                 | Idfu                       | Egypt                                 |
|        496 | 775 ostka Drive                        | al-Daqahliya         | Mit Ghamr                  | Egypt                                 |
|        138 | 765 Southampton Drive                  | al-Qalyubiya         | Qalyub                     | Egypt                                 |
|        428 | 1727 Matamoros Place                   | Sawhaj               | Sawhaj                     | Egypt                                 |
|        123 | 1987 Coacalco de Berriozbal Loop       | al-Qalyubiya         | Shubra al-Khayma           | Egypt                                 |
|        449 | 1289 Belm Boulevard                    | Tartumaa             | Tartu                      | Estonia                               |
|        397 | 614 Pak Kret Street                    | Addis Abeba          | Addis Abeba                | Ethiopia                              |
|        322 | 1359 Zhoushan Parkway                  | Streymoyar           | Trshavn                    | Faroe Islands                         |
|        303 | 898 Jining Lane                        | Pohjois-Pohjanmaa    | Oulu                       | Finland                               |
|        407 | 1346 Mysore Drive                      | Bretagne             | Brest                      | France                                |
|        166 | 1740 Le Mans Loop                      | Pays de la Loire     | Le Mans                    | France                                |
|        108 | 1386 Yangor Avenue                     | Provence-Alpes-Cte   | Toulon                     | France                                |
|         39 | 391 Callao Drive                       | Midi-Pyrnes          | Toulouse                   | France                                |
|         69 | 698 Otsu Street                        | Cayenne              | Cayenne                    | French Guiana                         |
|         47 | 1447 Imus Way                          | Tahiti               | Faaa                       | French Polynesia                      |
|         60 | 1668 Saint Louis Place                 | Tahiti               | Papeete                    | French Polynesia                      |
|        590 | 247 Jining Parkway                     | Banjul               | Banjul                     | Gambia                                |
|        118 | 442 Rae Bareli Place                   | Nordrhein-Westfalen  | Duisburg                   | Germany                               |
|        453 | 319 Springs Loop                       | Baijeri              | Erlangen                   | Germany                               |
|        255 | 1966 Tonghae Street                    | Anhalt Sachsen       | Halle/Saale                | Germany                               |
|        200 | 1074 Binzhou Manor                     | Baden-Wrttemberg     | Mannheim                   | Germany                               |
|        231 | 430 Alessandria Loop                   | Saarland             | Saarbrcken                 | Germany                               |
|        199 | 1792 Valle de la Pascua Place          | Nordrhein-Westfalen  | Siegen                     | Germany                               |
|        205 | 68 Molodetno Manor                     | Nordrhein-Westfalen  | Witten                     | Germany                               |
|          7 | 692 Joliet Street                      | Attika               | Athenai                    | Greece                                |
|        602 | 1101 Bucuresti Boulevard               | West Greece          | Patras                     | Greece                                |
|        211 | 850 Salala Loop                        | Kitaa                | Nuuk                       | Greenland                             |
|         30 | 18 Duisburg Boulevard                  |                      | Citt del Vaticano          | Holy See (Vatican City State)         |
|        294 | 1912 Allende Manor                     | Kowloon and New Kowl | Kowloon and New Kowloon    | Hong Kong                             |
|        598 | 42 Fontana Avenue                      | Fejr                 | Szkesfehrvr                | Hungary                               |
|        372 | 230 Urawa Drive                        | Andhra Pradesh       | Adoni                      | India                                 |
|        302 | 922 Vila Velha Loop                    | Maharashtra          | Ahmadnagar                 | India                                 |
|        179 | 431 Xiangtan Avenue                    | Kerala               | Allappuzha (Alleppey)      | India                                 |
|        229 | 1014 Loja Manor                        | Tamil Nadu           | Ambattur                   | India                                 |
|        540 | 949 Allende Lane                       | Uttar Pradesh        | Amroha                     | India                                 |
|        212 | 624 Oshawa Boulevard                   | West Bengali         | Balurghat                  | India                                 |
|        418 | 126 Acua Parkway                       | West Bengali         | Berhampore (Baharampur)    | India                                 |
|        384 | 97 Mogiljov Lane                       | Gujarat              | Bhavnagar                  | India                                 |
|        213 | 43 Dadu Avenue                         | Rajasthan            | Bhilwara                   | India                                 |
|        535 | 635 Brest Manor                        | Andhra Pradesh       | Bhimavaram                 | India                                 |
|         19 | 419 Iligan Lane                        | Madhya Pradesh       | Bhopal                     | India                                 |
|        206 | 642 Nador Drive                        | Maharashtra          | Bhusawal                   | India                                 |
|        473 | 1257 Guadalajara Street                | Karnataka            | Bijapur                    | India                                 |
|        171 | 1540 Wroclaw Drive                     | Maharashtra          | Chandrapur                 | India                                 |
|        514 | 1747 Rustenburg Place                  | Bihar                | Chapra                     | India                                 |
|        445 | 495 Bhimavaram Lane                    | Maharashtra          | Dhule (Dhulia)             | India                                 |
|        125 | 211 Chiayi Drive                       | Uttar Pradesh        | Etawah                     | India                                 |
|        196 | 9 San Miguel de Tucumn Manor           | Uttar Pradesh        | Firozabad                  | India                                 |
|        121 | 1967 Sincelejo Place                   | Gujarat              | Gandhinagar                | India                                 |
|        375 | 1049 Matamoros Parkway                 | Karnataka            | Gulbarga                   | India                                 |
|        190 | 435 0 Way                              | West Bengali         | Haldia                     | India                                 |
|        264 | 1027 Banjul Place                      | West Bengali         | Halisahar                  | India                                 |
|        417 | 791 Salinas Street                     | Punjab               | Hoshiarpur                 | India                                 |
|        140 | 788 Atinsk Street                      | Karnataka            | Hubli-Dharwad              | India                                 |
|         64 | 81 Hodeida Way                         | Rajasthan            | Jaipur                     | India                                 |
|         36 | 176 Mandaluyong Place                  | Uttar Pradesh        | Jhansi                     | India                                 |
|        228 | 60 Poos de Caldas Street               | Rajasthan            | Jodhpur                    | India                                 |
|         35 | 33 Gorontalo Way                       | West Bengali         | Kamarhati                  | India                                 |
|        497 | 1013 Tabuk Boulevard                   | West Bengali         | Kanchrapara                | India                                 |
|        279 | 1884 Shikarpur Avenue                  | Haryana              | Karnal                     | India                                 |
|        424 | 1948 Bayugan Parkway                   | Bihar                | Katihar                    | India                                 |
|        276 | 1675 Xiangfan Manor                    | Tamil Nadu           | Kumbakonam                 | India                                 |
|        321 | 651 Pathankot Loop                     | Maharashtra          | Miraj                      | India                                 |
|         32 | 1425 Shikarpur Manor                   | Bihar                | Munger (Monghyr)           | India                                 |
|         63 | 1213 Ranchi Parkway                    | Karnataka            | Mysore                     | India                                 |
|        156 | 1963 Moscow Place                      | Assam                | Nagaon                     | India                                 |
|        273 | 1519 Ilorin Place                      | Kerala               | Palghat (Palakkad)         | India                                 |
|        305 | 41 El Alto Parkway                     | Maharashtra          | Parbhani                   | India                                 |
|         99 | 1697 Tanauan Lane                      | Punjab               | Pathankot                  | India                                 |
|        301 | 951 Stara Zagora Manor                 | Punjab               | Patiala                    | India                                 |
|        426 | 1661 Abha Drive                        | Tamil Nadu           | Pudukkottai                | India                                 |
|        139 | 943 Johannesburg Avenue                | Maharashtra          | Pune                       | India                                 |
|        431 | 1596 Acua Parkway                      | Jharkhand            | Purnea (Purnia)            | India                                 |
|         82 | 936 Salzburg Lane                      | Uttar Pradesh        | Rae Bareli                 | India                                 |
|        560 | 1447 Imus Place                        | Gujarat              | Rajkot                     | India                                 |
|        341 | 1920 Weifang Avenue                    | Uttar Pradesh        | Rampur                     | India                                 |
|        363 | 604 Bern Place                         | Jharkhand            | Ranchi                     | India                                 |
|        221 | 866 Shivapuri Manor                    | Uttar Pradesh        | Sambhal                    | India                                 |
|        361 | 45 Aparecida de Goinia Place           | Madhya Pradesh       | Satna                      | India                                 |
|        242 | 1964 Gijn Manor                        | Karnataka            | Shimoga                    | India                                 |
|         72 | 57 Arlington Manor                     | Madhya Pradesh       | Shivapuri                  | India                                 |
|        507 | 1197 Sokoto Boulevard                  | West Bengali         | Siliguri (Shiliguri)       | India                                 |
|        292 | 1993 Tabuk Lane                        | Tamil Nadu           | Tambaram                   | India                                 |
|        174 | 1877 Ezhou Lane                        | Rajasthan            | Udaipur                    | India                                 |
|        451 | 1704 Tambaram Manor                    | West Bengali         | Uluberia                   | India                                 |
|        235 | 954 Kimchon Place                      | West Bengali         | Uttarpara-Kotrung          | India                                 |
|        408 | 990 Etawah Loop                        | Tamil Nadu           | Valparai                   | India                                 |
|        127 | 117 Boa Vista Way                      | Uttar Pradesh        | Varanasi (Benares)         | India                                 |
|        513 | 758 Korolev Parkway                    | Andhra Pradesh       | Vijayawada                 | India                                 |
|         16 | 808 Bhopal Manor                       | Haryana              | Yamuna Nagar               | India                                 |
|        416 | 1445 Carmen Parkway                    | West Java            | Cianjur                    | Indonesia                             |
|        243 | 47 Syktyvkar Lane                      | West Java            | Ciomas                     | Indonesia                             |
|        333 | 1860 Taguig Loop                       | West Java            | Ciparay                    | Indonesia                             |
|        207 | 1688 Nador Lane                        | Sulawesi Utara       | Gorontalo                  | Indonesia                             |
|        157 | 456 Escobar Way                        | Jakarta Raya         | Jakarta                    | Indonesia                             |
|        478 | 1078 Stara Zagora Drive                | Aceh                 | Lhokseumawe                | Indonesia                             |
|        505 | 519 Brescia Parkway                    | East Java            | Madiun                     | Indonesia                             |
|        548 | 1658 Cuman Loop                        | Sumatera Selatan     | Pangkal Pinang             | Indonesia                             |
|        120 | 544 Malm Parkway                       | Central Java         | Pemalang                   | Indonesia                             |
|        511 | 1152 al-Qatif Lane                     | Kalimantan Barat     | Pontianak                  | Indonesia                             |
|        377 | 154 Oshawa Manor                       | East Java            | Probolinggo                | Indonesia                             |
|        530 | 1003 Qinhuangdao Street                | West Java            | Purwakarta                 | Indonesia                             |
|        455 | 1947 Paarl Way                         | Central Java         | Surakarta                  | Indonesia                             |
|        463 | 935 Aden Boulevard                     | Central Java         | Tegal                      | Indonesia                             |
|         40 | 334 Munger (Monghyr) Lane              | Markazi              | Arak                       | Iran                                  |
|         14 | 1531 Sal Drive                         | Esfahan              | Esfahan                    | Iran                                  |
|        382 | 220 Hidalgo Drive                      | Kermanshah           | Kermanshah                 | Iran                                  |
|        373 | 1922 Miraj Way                         | Esfahan              | Najafabad                  | Iran                                  |
|        464 | 76 Kermanshah Manor                    | Esfahan              | Qomsheh                    | Iran                                  |
|        189 | 927 Barcelona Street                   | Chaharmahal va Bakht | Shahr-e Kord               | Iran                                  |
|        454 | 956 Nam Dinh Manor                     | Kerman               | Sirjan                     | Iran                                  |
|        284 | 600 Bradford Street                    | East Azerbaidzan     | Tabriz                     | Iran                                  |
|        585 | 1208 Tama Loop                         | Ninawa               | Mosul                      | Iraq                                  |
|        106 | 659 Vaduz Drive                        | Ha Darom             | Ashdod                     | Israel                                |
|        483 | 632 Usolje-Sibirskoje Parkway          | Ha Darom             | Ashqelon                   | Israel                                |
|        320 | 1542 Lubumbashi Boulevard              | Tel Aviv             | Bat Yam                    | Israel                                |
|        165 | 97 Shimoga Avenue                      | Tel Aviv             | Tel Aviv-Jaffa             | Israel                                |
|         37 | 127 Purnea (Purnia) Manor              | Piemonte             | Alessandria                | Italy                                 |
|        444 | 231 Kaliningrad Place                  | Lombardia            | Bergamo                    | Italy                                 |
|        314 | 1224 Huejutla de Reyes Boulevard       | Lombardia            | Brescia                    | Italy                                 |
|        504 | 1 Valle de Santiago Avenue             | Apulia               | Brindisi                   | Italy                                 |
|        547 | 379 Lublin Parkway                     | Toscana              | Livorno                    | Italy                                 |
|        225 | 1926 Gingoog Street                    | Sisilia              | Syrakusa                   | Italy                                 |
|        531 | 1986 Sivas Place                       | Friuli-Venezia Giuli | Udine                      | Italy                                 |
|        580 | 923 Tangail Boulevard                  | Tokyo-to             | Akishima                   | Japan                                 |
|        145 | 928 Jaffna Loop                        | Hiroshima            | Fukuyama                   | Japan                                 |
|        269 | 446 Kirovo-Tepetsk Lane                | Osaka                | Higashiosaka               | Japan                                 |
|        198 | 345 Oshawa Boulevard                   | Tokyo-to             | Hino                       | Japan                                 |
|        304 | 1635 Kuwana Boulevard                  | Hiroshima            | Hiroshima                  | Japan                                 |
|        525 | 1949 Sanya Street                      | Gumma                | Isesaki                    | Japan                                 |
|        244 | 1148 Saarbrcken Parkway                | Fukushima            | Iwaki                      | Japan                                 |
|         58 | 1964 Allappuzha (Alleppey) Street      | Yamaguchi            | Iwakuni                    | Japan                                 |
|        401 | 168 Cianjur Manor                      | Saitama              | Iwatsuki                   | Japan                                 |
|        396 | 767 Pyongyang Drive                    | Osaka                | Izumisano                  | Japan                                 |
|        167 | 1287 Xiangfan Boulevard                | Gifu                 | Kakamigahara               | Japan                                 |
|         83 | 586 Tete Way                           | Kanagawa             | Kamakura                   | Japan                                 |
|        553 | 1421 Quilmes Lane                      | Ishikawa             | Kanazawa                   | Japan                                 |
|        406 | 454 Patiala Lane                       | Fukushima            | Koriyama                   | Japan                                 |
|         38 | 61 Tama Street                         | Okayama              | Kurashiki                  | Japan                                 |
|        537 | 958 Sagamihara Lane                    | Mie                  | Kuwana                     | Japan                                 |
|        360 | 619 Hunuco Avenue                      | Shimane              | Matsue                     | Japan                                 |
|        258 | 752 Ondo Loop                          | Miyazaki             | Miyakonojo                 | Japan                                 |
|         57 | 17 Kabul Boulevard                     | Chiba                | Nagareyama                 | Japan                                 |
|        494 | 591 Sungai Petani Drive                | Okayama              | Okayama                    | Japan                                 |
|        370 | 1565 Tangail Manor                     | Okinawa              | Okinawa                    | Japan                                 |
|        409 | 1266 Laredo Parkway                    | Saitama              | Omiya                      | Japan                                 |
|        342 | 124 al-Manama Way                      | Hiroshima            | Onomichi                   | Japan                                 |
|        290 | 1336 Benin City Drive                  | Shiga                | Otsu                       | Japan                                 |
|         15 | 1542 Tarlac Parkway                    | Kanagawa             | Sagamihara                 | Japan                                 |
|          5 | 1913 Hanoi Way                         | Nagasaki             | Sasebo                     | Japan                                 |
|         33 | 786 Aurora Avenue                      | Yamaguchi            | Shimonoseki                | Japan                                 |
|        390 | 102 Chapra Drive                       | Ibaragi              | Tama                       | Japan                                 |
|        434 | 1404 Taguig Drive                      | Okayama              | Tsuyama                    | Japan                                 |
|        508 | 496 Celaya Drive                       | Nagano               | Ueda                       | Japan                                 |
|        151 | 1337 Lincoln Parkway                   | Saitama              | Urawa                      | Japan                                 |
|         80 | 602 Paarl Street                       | Pavlodar             | Pavlodar                   | Kazakstan                             |
|        579 | 521 San Juan Bautista Tuxtepec Place   | Qaraghandy           | Zhezqazghan                | Kazakstan                             |
|        197 | 447 Surakarta Loop                     | Nyanza               | Kisumu                     | Kenya                                 |
|        368 | 1658 Jastrzebie-Zdrj Loop              | Central              | Nyeri                      | Kenya                                 |
|        238 | 346 Skikda Parkway                     | Hawalli              | Jalib al-Shuyukh           | Kuwait                                |
|        352 | 1673 Tangail Drive                     | Daugavpils           | Daugavpils                 | Latvia                                |
|         27 | 1780 Hino Boulevard                    | Liepaja              | Liepaja                    | Latvia                                |
|         61 | 943 Tokat Street                       | Vaduz                | Vaduz                      | Liechtenstein                         |
|        563 | 1059 Yuncheng Avenue                   | Vilna                | Vilnius                    | Lithuania                             |
|         85 | 320 Baiyin Parkway                     | Mahajanga            | Mahajanga                  | Madagascar                            |
|        170 | 710 San Felipe del Progreso Avenue     | Lilongwe             | Lilongwe                   | Malawi                                |
|        175 | 316 Uruapan Street                     | Perak                | Ipoh                       | Malaysia                              |
|         62 | 1114 Liepaja Street                    | Sarawak              | Kuching                    | Malaysia                              |
|        311 | 715 So Bernardo do Campo Lane          | Kedah                | Sungai Petani              | Malaysia                              |
|        491 | 1789 Saint-Denis Parkway               | Coahuila de Zaragoza | Acua                       | Mexico                                |
|        419 | 397 Sunnyvale Avenue                   | Guanajuato           | Allende                    | Mexico                                |
|         88 | 125 Citt del Vaticano Boulevard        | Puebla               | Atlixco                    | Mexico                                |
|        584 | 1819 Alessandria Loop                  | Campeche             | Carmen                     | Mexico                                |
|        593 | 1402 Zanzibar Boulevard                | Guanajuato           | Celaya                     | Mexico                                |
|        251 | 1473 Changhwa Parkway                  | Mxico                | Coacalco de Berriozbal     | Mexico                                |
|        487 | 1785 So Bernardo do Campo Street       | Veracruz             | Coatzacoalcos              | Mexico                                |
|        472 | 1447 Chatsworth Place                  | Chihuahua            | Cuauhtmoc                  | Mexico                                |
|        328 | 479 San Felipe del Progreso Avenue     | Morelos              | Cuautla                    | Mexico                                |
|        581 | 186 Skikda Lane                        | Morelos              | Cuernavaca                 | Mexico                                |
|        456 | 814 Simferopol Loop                    | Sinaloa              | El Fuerte                  | Mexico                                |
|        369 | 817 Laredo Avenue                      | Jalisco              | Guadalajara                | Mexico                                |
|        154 | 781 Shimonoseki Drive                  | Michoacn de Ocampo   | Hidalgo                    | Mexico                                |
|        588 | 966 Asuncin Way                        | Hidalgo              | Huejutla de Reyes          | Mexico                                |
|        112 | 1002 Ahmadnagar Manor                  | Mxico                | Huixquilucan               | Mexico                                |
|        587 | 760 Miyakonojo Drive                   | Guerrero             | Jos Azueta                 | Mexico                                |
|        374 | 433 Florencia Street                   | Chihuahua            | Jurez                      | Mexico                                |
|        493 | 184 Mandaluyong Street                 | Baja California Sur  | La Paz                     | Mexico                                |
|        181 | 146 Johannesburg Way                   | Tamaulipas           | Matamoros                  | Mexico                                |
|        348 | 785 Vaduz Street                       | Baja California      | Mexicali                   | Mexico                                |
|        576 | 1351 Sousse Lane                       | Coahuila de Zaragoza | Monclova                   | Mexico                                |
|        119 | 1107 Nakhon Sawan Avenue               | Mxico                | Nezahualcyotl              | Mexico                                |
|        358 | 1698 Southport Loop                    | Hidalgo              | Pachuca de Soto            | Mexico                                |
|        278 | 144 South Hill Loop                    | Guanajuato           | Salamanca                  | Mexico                                |
|        324 | 1145 Vilnius Manor                     | Mxico                | San Felipe del Progreso    | Mexico                                |
|        430 | 355 Vitria de Santo Anto Way           | Oaxaca               | San Juan Bautista Tuxtepec | Mexico                                |
|        137 | 261 Saint Louis Way                    | Coahuila de Zaragoza | Torren                     | Mexico                                |
|        459 | 251 Florencia Drive                    | Michoacn de Ocampo   | Uruapan                    | Mexico                                |
|        293 | 86 Higashiosaka Lane                   | Guanajuato           | Valle de Santiago          | Mexico                                |
|        470 | 1088 Ibirit Place                      | Jalisco              | Zapopan                    | Mexico                                |
|         42 | 269 Cam Ranh Parkway                   | Chisinau             | Chisinau                   | Moldova                               |
|        549 | 454 Qinhuangdao Drive                  | Tadla-Azilal         | Beni-Mellal                | Morocco                               |
|         44 | 671 Graz Street                        | Oriental             | Nador                      | Morocco                               |
|         26 | 28 Charlotte Amalie Street             | Rabat-Sal-Zammour-Z  | Sal                        | Morocco                               |
|        262 | 771 Yaound Manor                       | Sofala               | Beira                      | Mozambique                            |
|        438 | 596 Huixquilucan Place                 | Nampula              | Naala-Porto                | Mozambique                            |
|        101 | 1599 Plock Drive                       | Tete                 | Tete                       | Mozambique                            |
|        261 | 51 Laredo Avenue                       | Sagaing              | Monywa                     | Myanmar                               |
|          8 | 1566 Inegl Manor                       | Mandalay             | Myingyan                   | Myanmar                               |
|        519 | 962 Tama Loop                          |                      | Yangor                     | Nauru                                 |
|        326 | 470 Boksburg Street                    | Central              | Birgunj                    | Nepal                                 |
|        420 | 992 Klerksdorp Loop                    | Utrecht              | Amersfoort                 | Netherlands                           |
|        141 | 1749 Daxian Place                      | Gelderland           | Apeldoorn                  | Netherlands                           |
|        346 | 1217 Konotop Avenue                    | Gelderland           | Ede                        | Netherlands                           |
|        479 | 1854 Okara Boulevard                   | Drenthe              | Emmen                      | Netherlands                           |
|        188 | 741 Ambattur Manor                     | Noord-Brabant        | s-Hertogenbosch            | Netherlands                           |
|         12 | 478 Joliet Way                         | Hamilton             | Hamilton                   | New Zealand                           |
|        289 | 1279 Udine Parkway                     | Edo & Delta          | Benin City                 | Nigeria                               |
|        414 | 1936 Lapu-Lapu Parkway                 | Bauchi & Gombe       | Deba Habe                  | Nigeria                               |
|        291 | 1155 Liaocheng Place                   | Oyo & Osun           | Effon-Alaiye               | Nigeria                               |
|         84 | 1888 Kabul Drive                       | Oyo & Osun           | Ife                        | Nigeria                               |
|        202 | 955 Bamenda Way                        | Ondo & Ekiti         | Ikerre                     | Nigeria                               |
|        107 | 1177 Jelets Way                        | Kwara & Kogi         | Ilorin                     | Nigeria                               |
|         22 | 320 Brest Avenue                       | Kaduna               | Kaduna                     | Nigeria                               |
|        282 | 556 Baybay Manor                       | Oyo & Osun           | Ogbomosho                  | Nigeria                               |
|        160 | 1367 Yantai Manor                      | Ondo & Ekiti         | Ondo                       | Nigeria                               |
|        285 | 1006 Santa Brbara dOeste Manor         | Ondo & Ekiti         | Owo                        | Nigeria                               |
|        254 | 786 Stara Zagora Way                   | Oyo & Osun           | Oyo                        | Nigeria                               |
|        568 | 1342 Sharja Way                        | Sokoto & Kebbi & Zam | Sokoto                     | Nigeria                               |
|        236 | 885 Yingkou Manor                      | Kaduna               | Zaria                      | Nigeria                               |
|        161 | 1386 Nakhon Sawan Boulevard            | Pyongyang-si         | Pyongyang                  | North Korea                           |
|         13 | 613 Korolev Drive                      | Masqat               | Masqat                     | Oman                                  |
|        503 | 1416 San Juan Bautista Tuxtepec Avenue | Zufar                | Salala                     | Oman                                  |
|        421 | 966 Arecibo Loop                       | Sind                 | Dadu                       | Pakistan                              |
|        227 | 1820 Maring Parkway                    | Punjab               | Mandi Bahauddin            | Pakistan                              |
|         24 | 1688 Okara Way                         | Nothwest Border Prov | Mardan                     | Pakistan                              |
|        404 | 734 Bchar Place                        | Punjab               | Okara                      | Pakistan                              |
|         29 | 934 San Felipe de Puerto Plata Street  | Sind                 | Shikarpur                  | Pakistan                              |
|        230 | 201 Effon-Alaiye Way                   | Asuncin              | Asuncin                    | Paraguay                              |
|        209 | 1679 Antofagasta Street                | Alto Paran           | Ciudad del Este            | Paraguay                              |
|        350 | 1628 Nagareyama Lane                   | Central              | San Lorenzo                | Paraguay                              |
|        309 | 827 Yuncheng Drive                     | Callao               | Callao                     | Peru                                  |
|        571 | 1746 Faaa Way                          | Huanuco              | Hunuco                     | Peru                                  |
|        126 | 1175 Tanauan Way                       | Lima                 | Lima                       | Peru                                  |
|        603 | 1103 Quilmes Boulevard                 | Piura                | Sullana                    | Peru                                  |
|         75 | 492 Cam Ranh Street                    | Eastern Visayas      | Baybay                     | Philippines                           |
|        192 | 1166 Changhwa Street                   | Caraga               | Bayugan                    | Philippines                           |
|         98 | 152 Kitwe Parkway                      | Caraga               | Bislig                     | Philippines                           |
|        376 | 1061 Ede Avenue                        | Southern Tagalog     | Cabuyao                    | Philippines                           |
|        393 | 717 Changzhou Lane                     | Southern Tagalog     | Cavite                     | Philippines                           |
|         31 | 217 Botshabelo Place                   | Southern Mindanao    | Davao                      | Philippines                           |
|        466 | 118 Jaffna Loop                        | Northern Mindanao    | Gingoog                    | Philippines                           |
|        260 | 127 Iwakuni Boulevard                  | Central Luzon        | Hagonoy                    | Philippines                           |
|        586 | 951 Springs Lane                       | Central Mindanao     | Iligan                     | Philippines                           |
|        354 | 953 Hodeida Street                     | Southern Tagalog     | Imus                       | Philippines                           |
|        248 | 582 Papeete Loop                       | Central Visayas      | Lapu-Lapu                  | Philippines                           |
|        268 | 1831 Nam Dinh Loop                     | National Capital Reg | Mandaluyong                | Philippines                           |
|        439 | 1351 Aparecida de Goinia Parkway       | Northern Mindanao    | Ozamis                     | Philippines                           |
|        528 | 1176 Southend-on-Sea Manor             | Southern Tagalog     | Santa Rosa                 | Philippines                           |
|         76 | 89 Allappuzha (Alleppey) Manor         | National Capital Reg | Taguig                     | Philippines                           |
|        510 | 48 Maracabo Place                      | Central Luzon        | Talavera                   | Philippines                           |
|        378 | 1191 Tandil Drive                      | Southern Tagalog     | Tanauan                    | Philippines                           |
|        240 | 1479 Rustenburg Boulevard              | Southern Tagalog     | Tanza                      | Philippines                           |
|        554 | 947 Trshavn Place                      | Central Luzon        | Tarlac                     | Philippines                           |
|        266 | 862 Xintai Lane                        | Cagayan Valley       | Tuguegarao                 | Philippines                           |
|        323 | 1769 Iwaki Lane                        | Kujawsko-Pomorskie   | Bydgoszcz                  | Poland                                |
|        578 | 1405 Hagonoy Avenue                    | Slaskie              | Czestochowa                | Poland                                |
|        132 | 1050 Garden Grove Avenue               | Slaskie              | Jastrzebie-Zdrj            | Poland                                |
|        275 | 906 Goinia Way                         | Wielkopolskie        | Kalisz                     | Poland                                |
|        506 | 414 Mandaluyong Street                 | Lubelskie            | Lublin                     | Poland                                |
|        577 | 1501 Pangkal Pinang Avenue             | Mazowieckie          | Plock                      | Poland                                |
|        385 | 1642 Charlotte Amalie Drive            | Slaskie              | Tychy                      | Poland                                |
|        564 | 505 Madiun Boulevard                   | Dolnoslaskie         | Wroclaw                    | Poland                                |
|        365 | 1009 Zanzibar Lane                     | Arecibo              | Arecibo                    | Puerto Rico                           |
|        287 | 1405 Chisinau Place                    | Ponce                | Ponce                      | Puerto Rico                           |
|        234 | 1256 Bislig Boulevard                  | Botosani             | Botosani                   | Romania                               |
|        569 | 1342 Abha Boulevard                    | Bukarest             | Bucuresti                  | Romania                               |
|        152 | 1952 Pune Lane                         | Saint-Denis          | Saint-Denis                | Runion                                |
|        402 | 616 Hagonoy Avenue                     | Krasnojarsk          | Atinsk                     | Russian Federation                    |
|         59 | 1697 Kowloon and New Kowloon Loop      | Moskova              | Balaiha                    | Russian Federation                    |
|        435 | 740 Udaipur Lane                       | Nizni Novgorod       | Dzerzinsk                  | Russian Federation                    |
|         21 | 270 Toulon Boulevard                   | Kalmykia             | Elista                     | Russian Federation                    |
|        110 | 1867 San Juan Bautista Tuxtepec Avenue | Ivanovo              | Ivanovo                    | Russian Federation                    |
|        226 | 810 Palghat (Palakkad) Boulevard       | Jaroslavl            | Jaroslavl                  | Russian Federation                    |
|        104 | 1913 Kamakura Place                    | Lipetsk              | Jelets                     | Russian Federation                    |
|        306 | 1883 Maikop Lane                       | Kaliningrad          | Kaliningrad                | Russian Federation                    |
|        515 | 886 Tonghae Place                      | Volgograd            | Kamyin                     | Russian Federation                    |
|        183 | 1089 Iwatsuki Avenue                   | Kirov                | Kirovo-Tepetsk             | Russian Federation                    |
|        300 | 661 Chisinau Lane                      | Pietari              | Kolpino                    | Russian Federation                    |
|        398 | 954 Lapu-Lapu Way                      | Moskova              | Korolev                    | Russian Federation                    |
|        381 | 1618 Olomouc Manor                     | Kurgan               | Kurgan                     | Russian Federation                    |
|        316 | 746 Joliet Lane                        | Kursk                | Kursk                      | Russian Federation                    |
|         48 | 1998 Halifax Drive                     | Lipetsk              | Lipetsk                    | Russian Federation                    |
|        164 | 1623 Baha Blanca Manor                 | Moskova              | Ljubertsy                  | Russian Federation                    |
|        351 | 1157 Nyeri Loop                        | Adygea               | Maikop                     | Russian Federation                    |
|         50 | 46 Pjatigorsk Lane                     | Moscow (City)        | Moscow                     | Russian Federation                    |
|        452 | 207 Cuernavaca Loop                    | Tatarstan            | Nabereznyje Telny          | Russian Federation                    |
|         52 | 909 Garland Manor                      | Tatarstan            | Niznekamsk                 | Russian Federation                    |
|        195 | 1077 San Felipe de Puerto Plata Place  | Rostov-na-Donu       | Novoterkassk               | Russian Federation                    |
|        492 | 185 Mannheim Lane                      | Stavropol            | Pjatigorsk                 | Russian Federation                    |
|        573 | 1407 Surakarta Manor                   | Moskova              | Serpuhov                   | Russian Federation                    |
|        131 | 801 Hagonoy Drive                      | Smolensk             | Smolensk                   | Russian Federation                    |
|        433 | 1823 Hoshiarpur Lane                   | Komi                 | Syktyvkar                  | Russian Federation                    |
|        355 | 469 Nakhon Sawan Street                | Tuvassia             | Teboksary                  | Russian Federation                    |
|        467 | 1621 Tongliao Avenue                   | Irkutsk              | Usolje-Sibirskoje          | Russian Federation                    |
|        356 | 1378 Beira Loop                        | Krasnojarsk          | Zeleznogorsk               | Russian Federation                    |
|        331 | 1016 Iwakuni Street                    | St George            | Kingstown                  | Saint Vincent and the Grenadines      |
|        105 | 733 Mandaluyong Place                  | Asir                 | Abha                       | Saudi Arabia                          |
|         74 | 1124 Buenaventura Drive                | Mekka                | al-Hawiya                  | Saudi Arabia                          |
|        422 | 289 Santo Andr Manor                   | al-Sharqiya          | al-Qatif                   | Saudi Arabia                          |
|         53 | 725 Isesaki Place                      | Mekka                | Jedda                      | Saudi Arabia                          |
|        317 | 780 Kimberley Way                      | Tabuk                | Tabuk                      | Saudi Arabia                          |
|        461 | 1889 Valparai Way                      | Ziguinchor           | Ziguinchor                 | Senegal                               |
|        362 | 482 Kowloon and New Kowloon Manor      | Bratislava           | Bratislava                 | Slovakia                              |
|        129 | 569 Baicheng Lane                      | Gauteng              | Boksburg                   | South Africa                          |
|        136 | 898 Belm Manor                         | Free State           | Botshabelo                 | South Africa                          |
|        561 | 1497 Fengshan Drive                    | KwaZulu-Natal        | Chatsworth                 | South Africa                          |
|        476 | 270 Tambaram Parkway                   | Gauteng              | Johannesburg               | South Africa                          |
|         23 | 1417 Lancaster Avenue                  | Northern Cape        | Kimberley                  | South Africa                          |
|        113 | 682 Junan Way                          | North West           | Klerksdorp                 | South Africa                          |
|        437 | 1766 Almirante Brown Street            | KwaZulu-Natal        | Newcastle                  | South Africa                          |
|        343 | 1443 Mardan Street                     | Western Cape         | Paarl                      | South Africa                          |
|        412 | 1639 Saarbrcken Drive                  | North West           | Rustenburg                 | South Africa                          |
|        149 | 999 Sanaa Loop                         | Gauteng              | Soshanguve                 | South Africa                          |
|         87 | 929 Tallahassee Loop                   | Gauteng              | Springs                    | South Africa                          |
|         92 | 1942 Ciparay Parkway                   | Cheju                | Cheju                      | South Korea                           |
|        103 | 588 Vila Velha Manor                   | Kyongsangbuk         | Kimchon                    | South Korea                           |
|        241 | 647 A Corua (La Corua) Street          | Chollanam            | Naju                       | South Korea                           |
|        542 | 193 Bhusawal Place                     | Kang-won             | Tonghae                    | South Korea                           |
|        249 | 300 Junan Street                       | Kyonggi              | Uijongbu                   | South Korea                           |
|         56 | 939 Probolinggo Loop                   | Galicia              | A Corua (La Corua)         | Spain                                 |
|        298 | 44 Najafabad Way                       | Baskimaa             | Donostia-San Sebastin      | Spain                                 |
|        399 | 331 Bydgoszcz Parkway                  | Asturia              | Gijn                       | Spain                                 |
|        474 | 1469 Plock Lane                        | Galicia              | Ourense (Orense)           | Spain                                 |
|        555 | 1764 Jalib al-Shuyukh Parkway          | Galicia              | Santiago de Compostela     | Spain                                 |
|        413 | 692 Amroha Drive                       | Northern             | Jaffna                     | Sri Lanka                             |
|        400 | 1152 Citrus Heights Manor              | al-Qadarif           | al-Qadarif                 | Sudan                                 |
|         54 | 115 Hidalgo Parkway                    | Khartum              | Omdurman                   | Sudan                                 |
|         70 | 1150 Kimchon Manor                     | Skne ln              | Malm                       | Sweden                                |
|         65 | 915 Ponce Place                        | Basel-Stadt          | Basel                      | Switzerland                           |
|        159 | 185 Novi Sad Place                     | Bern                 | Bern                       | Switzerland                           |
|        604 | 1331 Usak Boulevard                    | Vaud                 | Lausanne                   | Switzerland                           |
|         79 | 1551 Rampur Lane                       | Changhwa             | Changhwa                   | Taiwan                                |
|         77 | 1947 Poos de Caldas Boulevard          | Chiayi               | Chiayi                     | Taiwan                                |
|        523 | 608 Birgunj Parkway                    | Taipei               | Chungho                    | Taiwan                                |
|        582 | 1568 Celaya Parkway                    | Kaohsiung            | Fengshan                   | Taiwan                                |
|        353 | 381 Kabul Way                          | Taipei               | Hsichuh                    | Taiwan                                |
|         34 | 1668 Anpolis Street                    | Taipei               | Lungtan                    | Taiwan                                |
|          9 | 53 Idfu Parkway                        | Nantou               | Nantou                     | Taiwan                                |
|        583 | 1489 Kakamigahara Lane                 | Taipei               | Tanshui                    | Taiwan                                |
|        143 | 1029 Dzerzinsk Manor                   | Ynlin                | Touliu                     | Taiwan                                |
|        592 | 1923 Stara Zagora Lane                 | Nantou               | Tsaotun                    | Taiwan                                |
|        486 | 64 Korla Street                        | Mwanza               | Mwanza                     | Tanzania                              |
|        194 | 605 Rio Claro Parkway                  | Tabora               | Tabora                     | Tanzania                              |
|        224 | 1842 Luzinia Boulevard                 | Zanzibar West        | Zanzibar                   | Tanzania                              |
|        395 | 1337 Mit Ghamr Avenue                  | Nakhon Sawan         | Nakhon Sawan               | Thailand                              |
|         46 | 1632 Bislig Avenue                     | Nonthaburi           | Pak Kret                   | Thailand                              |
|         90 | 870 Ashqelon Loop                      | Songkhla             | Songkhla                   | Thailand                              |
|        349 | 1516 Escobar Drive                     | Tongatapu            | Nukualofa                  | Tonga                                 |
|        340 | 507 Smolensk Loop                      | Sousse               | Sousse                     | Tunisia                               |
|        332 | 663 Baha Blanca Parkway                | Adana                | Adana                      | Turkey                                |
|        371 | 1912 Emeishan Drive                    | Balikesir            | Balikesir                  | Turkey                                |
|        176 | 29 Pyongyang Loop                      | Batman               | Batman                     | Turkey                                |
|        488 | 698 Jelets Boulevard                   | Denizli              | Denizli                    | Turkey                                |
|        512 | 1269 Ipoh Avenue                       | Eskisehir            | Eskisehir                  | Turkey                                |
|        485 | 984 Novoterkassk Loop                  | Gaziantep            | Gaziantep                  | Turkey                                |
|        283 | 457 Tongliao Loop                      | Bursa                | Inegl                      | Turkey                                |
|        147 | 374 Bat Yam Boulevard                  | Kilis                | Kilis                      | Turkey                                |
|        128 | 848 Tafuna Manor                       | Ktahya               | Ktahya                     | Turkey                                |
|         17 | 270 Amroha Parkway                     | Osmaniye             | Osmaniye                   | Turkey                                |
|        524 | 680 A Corua (La Corua) Manor           | Sivas                | Sivas                      | Turkey                                |
|        498 | 319 Plock Parkway                      | Istanbul             | Sultanbeyli                | Turkey                                |
|        168 | 842 Salzburg Lane                      | Adana                | Tarsus                     | Turkey                                |
|        572 | 539 Hami Way                           | Tokat                | Tokat                      | Turkey                                |
|        208 | 1215 Pyongyang Parkway                 | Usak                 | Usak                       | Turkey                                |
|        204 | 387 Mwene-Ditu Drive                   | Ahal                 | Ashgabat                   | Turkmenistan                          |
|        109 | 454 Nakhon Sawan Boulevard             | Funafuti             | Funafuti                   | Tuvalu                                |
|        391 | 1793 Meixian Place                     | Hmelnytskyi          | Kamjanets-Podilskyi        | Ukraine                               |
|        551 | 182 Nukualofa Drive                    | Sumy                 | Konotop                    | Ukraine                               |
|        135 | 1752 So Leopoldo Parkway               | Taka-Karpatia        | Mukateve                   | Ukraine                               |
|        480 | 421 Yaound Street                      | Sumy                 | ostka                      | Ukraine                               |
|         86 | 927 Baha Blanca Parkway                | Krim                 | Simferopol                 | Ukraine                               |
|        191 | 140 Chiayi Parkway                     | Sumy                 | Sumy                       | Ukraine                               |
|        457 | 535 Ahmadnagar Manor                   | Abu Dhabi            | Abu Dhabi                  | United Arab Emirates                  |
|        102 | 669 Firozabad Loop                     | Abu Dhabi            | al-Ayn                     | United Arab Emirates                  |
|        297 | 1192 Tongliao Street                   | Sharja               | Sharja                     | United Arab Emirates                  |
|         89 | 1557 Ktahya Boulevard                  | England              | Bradford                   | United Kingdom                        |
|        146 | 483 Ljubertsy Parkway                  | Scotland             | Dundee                     | United Kingdom                        |
|        256 | 1497 Yuzhou Drive                      | England              | London                     | United Kingdom                        |
|        517 | 548 Uruapan Street                     | Ontario              | London                     | United Kingdom                        |
|        589 | 1584 Ljubertsy Lane                    | England              | Southampton                | United Kingdom                        |
|         20 | 360 Toulouse Parkway                   | England              | Southend-on-Sea            | United Kingdom                        |
|        562 | 869 Shikarpur Way                      | England              | Southport                  | United Kingdom                        |
|        482 | 808 Naala-Porto Parkway                | England              | Stockport                  | United Kingdom                        |
|        502 | 1515 Korla Way                         | England              | York                       | United Kingdom                        |
|        484 | 98 Pyongyang Boulevard                 | Ohio                 | Akron                      | United States                         |
|        310 | 913 Coacalco de Berriozbal Loop        | Texas                | Arlington                  | United States                         |
|        100 | 1308 Arecibo Way                       | Georgia              | Augusta-Richmond County    | United States                         |
|        335 | 587 Benguela Manor                     | Illinois             | Aurora                     | United States                         |
|        543 | 43 Vilnius Manor                       | Colorado             | Aurora                     | United States                         |
|        216 | 660 Jedda Boulevard                    | Washington           | Bellevue                   | United States                         |
|        153 | 782 Mosul Street                       | Massachusetts        | Brockton                   | United States                         |
|        532 | 1427 Tabuk Place                       | Florida              | Cape Coral                 | United States                         |
|         18 | 770 Bydgoszcz Avenue                   | California           | Citrus Heights             | United States                         |
|        144 | 1666 Beni-Mellal Place                 | Tennessee            | Clarksville                | United States                         |
|        186 | 533 al-Ayn Boulevard                   | California           | Compton                    | United States                         |
|        405 | 530 Lausanne Lane                      | Texas                | Dallas                     | United States                         |
|        299 | 32 Pudukkottai Lane                    | Ohio                 | Dayton                     | United States                         |
|        425 | 1866 al-Qatif Avenue                   | California           | El Monte                   | United States                         |
|         55 | 1135 Izumisano Parkway                 | California           | Fontana                    | United States                         |
|        599 | 1895 Zhezqazghan Drive                 | California           | Garden Grove               | United States                         |
|        567 | 1894 Boa Vista Way                     | Texas                | Garland                    | United States                         |
|        122 | 333 Goinia Way                         | Texas                | Grand Prairie              | United States                         |
|        162 | 369 Papeete Way                        | North Carolina       | Greensboro                 | United States                         |
|        509 | 786 Matsue Way                         | Illinois             | Joliet                     | United States                         |
|        313 | 1191 Sungai Petani Boulevard           | Missouri             | Kansas City                | United States                         |
|        116 | 793 Cam Ranh Avenue                    | California           | Lancaster                  | United States                         |
|         10 | 1795 Santiago de Compostela Way        | Texas                | Laredo                     | United States                         |
|         67 | 1214 Hanoi Way                         | Nebraska             | Lincoln                    | United States                         |
|        387 | 401 Sucre Boulevard                    | New Hampshire        | Manchester                 | United States                         |
|        185 | 682 Garden Grove Place                 | Tennessee            | Memphis                    | United States                         |
|        280 | 1980 Kamjanets-Podilskyi Street        | Illinois             | Peoria                     | United States                         |
|        296 | 1936 Cuman Avenue                      | Virginia             | Roanoke                    | United States                         |
|        462 | 1485 Bratislava Place                  | Illinois             | Rockford                   | United States                         |
|         66 | 1717 Guadalajara Lane                  | Missouri             | Saint Louis                | United States                         |
|        274 | 920 Kumbakonam Loop                    | California           | Salinas                    | United States                         |
|          6 | 1121 Loja Avenue                       | California           | San Bernardino             | United States                         |
|        150 | 879 Newcastle Way                      | Michigan             | Sterling Heights           | United States                         |
|        218 | 226 Brest Manor                        | California           | Sunnyvale                  | United States                         |
|        252 | 1309 Weifang Street                    | Florida              | Tallahassee                | United States                         |
|        281 | 1944 Bamenda Way                       | Michigan             | Warren                     | United States                         |
|        574 | 502 Mandi Bahauddin Parkway            | Anzotegui            | Barcelona                  | Venezuela                             |
|        115 | 1378 Alvorada Avenue                   | Distrito Federal     | Caracas                    | Venezuela                             |
|        117 | 1079 Tel Aviv-Jaffa Boulevard          | Sucre                | Cuman                      | Venezuela                             |
|        458 | 138 Caracas Boulevard                  | Zulia                | Maracabo                   | Venezuela                             |
|        178 | 1848 Salala Boulevard                  | Miranda              | Ocumare del Tuy            | Venezuela                             |
|        545 | 163 Augusta-Richmond County Loop       | Carabobo             | Valencia                   | Venezuela                             |
|        295 | 544 Tarsus Boulevard                   | Gurico               | Valle de la Pascua         | Venezuela                             |
|        538 | 1817 Livorno Way                       | Khanh Hoa            | Cam Ranh                   | Vietnam                               |
|        203 | 1149 A Corua (La Corua) Boulevard      | Haiphong             | Haiphong                   | Vietnam                               |
|        345 | 68 Ponce Parkway                       | Hanoi                | Hanoi                      | Vietnam                               |
|        477 | 1786 Salinas Place                     | Nam Ha               | Nam Dinh                   | Vietnam                               |
|        526 | 617 Klerksdorp Place                   | Khanh Hoa            | Nha Trang                  | Vietnam                               |
|        529 | 600 Purnea (Purnia) Avenue             | Nghe An              | Vinh                       | Vietnam                               |
|        411 | 264 Bhimavaram Manor                   | St Thomas            | Charlotte Amalie           | Virgin Islands, U.S.                  |
|        214 | 751 Lima Loop                          | Aden                 | Aden                       | Yemen                                 |
|        475 | 434 Ourense (Orense) Manor             | Hodeida              | Hodeida                    | Yemen                                 |
|        308 | 687 Alessandria Parkway                | Sanaa                | Sanaa                      | Yemen                                 |
|        217 | 1001 Miyakonojo Lane                   | Taizz                | Taizz                      | Yemen                                 |
|         11 | 900 Santiago de Compostela Parkway     | Central Serbia       | Kragujevac                 | Yugoslavia                            |
|        559 | 1917 Kumbakonam Parkway                | Vojvodina            | Novi Sad                   | Yugoslavia                            |
|        443 | 1836 Korla Parkway                     | Copperbelt           | Kitwe                      | Zambia                                |
+------------+----------------------------------------+----------------------+----------------------------+---------------------------------------+
603 rows in set (0.327 sec)

mysql> exit
