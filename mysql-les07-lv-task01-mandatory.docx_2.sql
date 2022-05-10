-- ---------------------------------------------------
-- Second session in MySQL console
-- ---------------------------------------------------

mysql> USE education_db;
Database changed
mysql> SELECT * FROM students;
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
+----+-----------+----------+-----------+
11 rows in set (0.00 sec)

mysql> SELECT * FROM students;
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

mysql> -- befor rollbac
mysql> SELECT * FROM students;
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

mysql> -- after rollback
mysql> SELECT * FROM students;
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

mysql> EXIT;
