DB [datatypes]> CREATE TABLE TestVarchars(TestVarchar VARCHAR(15));
Query OK, 0 rows affected (0.146 sec)

DB [datatypes]> INSERT INTO TestVarchars VALUES ('TESKTS'), ('NAKAMAIS TEKSTS'), ('abc'), ('insert 123');
Query OK, 4 rows affected (0.066 sec)
Records: 4  Duplicates: 0  Warnings: 0

DB [datatypes]> INSERT INTO TestVarchars VALUES (YEAR(NOW())), (CURDATE()), (CONCAT('abc',123,2.34)), ('Empty');
Query OK, 4 rows affected (0.016 sec)
Records: 4  Duplicates: 0  Warnings: 0

DB [datatypes]> SELECT * FROM TestVarchars;
+-----------------+
| TestVarchar     |
+-----------------+
| TESKTS          |
| NAKAMAIS TEKSTS |
| abc             |
| insert 123      |
| 2022            |
| 2022-04-24      |
| abc1232.34      |
| Empty           |
+-----------------+
8 rows in set (0.006 sec)

DB [datatypes]> INSERT INTO TestVarchars VALUES ('sun'), ('six'), ('see'), ('sea');
Query OK, 4 rows affected (0.015 sec)
Records: 4  Duplicates: 0  Warnings: 0

DB [datatypes]> SELECT * FROM TestVarchars;
+-----------------+
| TestVarchar     |
+-----------------+
| TESKTS          |
| NAKAMAIS TEKSTS |
| abc             |
| insert 123      |
| 2022            |
| 2022-04-24      |
| abc1232.34      |
| Empty           |
| sun             |
| six             |
| see             |
| sea             |
+-----------------+
12 rows in set (0.003 sec)

DB [datatypes]> SELECT TestVarchar FROM TestVarchars WHERE TestVarchar LIKE 's%';
+-------------+
| TestVarchar |
+-------------+
| sun         |
| six         |
| see         |
| sea         |
+-------------+
4 rows in set (0.008 sec)

DB [datatypes]> SELECT TestVarchar FROM TestVarchars WHERE TestVarchar LIKE '2%';
+-------------+
| TestVarchar |
+-------------+
| 2022        |
| 2022-04-24  |
+-------------+
2 rows in set (0.006 sec)

DB [datatypes]> SELECT TestVarchar FROM TestVarchars WHERE TestVarchar LIKE '_b%';
+-------------+
| TestVarchar |
+-------------+
| abc         |
| abc1232.34  |
+-------------+
2 rows in set (0.007 sec)

DB [datatypes]> SHOW SCHEMAS;
+--------------------+
| Database           |
+--------------------+
| datatypes      |
| Employees          |
| employees          |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
6 rows in set (0.014 sec)

DB [datatypes]> USE Employees
Database changed
DB [Employees]> SELECT * FROM Employees;
ERROR 1146 (42S02): Table 'Employees.Employees' doesn't exist
DB [Employees]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| datatypes      |
| Employees          |
| employees          |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
6 rows in set (0.004 sec)

DB [Employees]> SHOW TABLES;
Empty set (0.003 sec)

DB [Employees]> DROP SCHEMA IF EXISTS Employees;
Query OK, 0 rows affected (0.187 sec)

DB [(none)]> SHOW SCHEMAS;
+--------------------+
| Database           |
+--------------------+
| datatypes      |
| employees          |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
5 rows in set (0.004 sec)

DB [(none)]> USE employees;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
DB [employees]> SHOW TABLES;
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set (0.004 sec)

DB [employees]> SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'a%';
ERROR 1054 (42S22): Unknown column 'employeeNumber' in 'field list'
DB [employees]> DESCRIBE employees;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_no     | int(11)       | NO   | PRI | NULL    |       |
| birth_date | date          | NO   |     | NULL    |       |
| first_name | varchar(14)   | NO   |     | NULL    |       |
| last_name  | varchar(16)   | NO   |     | NULL    |       |
| gender     | enum('M','F') | NO   |     | NULL    |       |
| hire_date  | date          | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
6 rows in set (0.022 sec)

DB [employees]> SELECT emp_no, last_name, first_name FROM employees WHERE first_name LIKE 'a%';
+--------+------------------+-------------+
| emp_no | last_name        | first_name  |
+--------+------------------+-------------+
|  10006 | Preusig          | Anneke      |
|  10033 | Merlo            | Arif        |
|  10035 | Chappelet        | Alain       |
|  10036 | Portugali        | Adamantios  |
|  10039 | Brender          | Alejandro   |
|  10059 | McAlpine         | Alejandro   |

| 499907 | Garnham          | Arnd        |
| 499924 | Swan             | Angus       |
| 499930 | Beerel           | Ayakannu    |
| 499952 | Lindqvist        | Aron        |
+--------+------------------+-------------+
22039 rows in set (5.395 sec)

DB [employees]> SELECT emp_no, last_name, first_name FROM employees WHERE last_name LIKE '%on';
+--------+-------------+----------------+
| emp_no | last_name   | first_name     |
+--------+-------------+----------------+
|  10095 | Morton      | Hilari         |
|  10100 | Haraldson   | Hironobu       |

| 499846 | Ranon       | Bezalel        |
| 499923 | Melton      | Sergi          |
| 499962 | Dalton      | Yongqiao       |
+--------+-------------+----------------+
7065 rows in set (4.160 sec)

DB [employees]> SELECT emp_no, last_name, first_name FROM employees WHERE last_name LIKE '%on%';
+--------+----------------+----------------+
| emp_no | last_name      | first_name     |
+--------+----------------+----------------+
|  10023 | Montemayor     | Bojan          |
|  10063 | Leonhardt      | Gino           |
|  10078 | Mondadori      | Danel          |
|  10095 | Morton         | Hilari         |
|  10100 | Haraldson      | Hironobu       |
|  10108 | Giveon         | Lunjin         |
|  10119 | Peltason       | Domenick       |

| 499758 | Montresor      | Guoxiang       |
| 499789 | Jonsson        | Chuanti        |
| 499802 | Vrecion        | Eckart         |
| 499813 | Maccarone      | Aiman          |
| 499814 | Wielonsky      | Georgi         |
| 499846 | Ranon          | Bezalel        |
| 499852 | Coney          | JiYoung        |
| 499902 | Wuwongse       | Aloke          |
| 499923 | Melton         | Sergi          |
| 499925 | Hardjono       | Tuval          |
| 499962 | Dalton         | Yongqiao       |
+--------+----------------+----------------+
18601 rows in set (4.488 sec)

DB [employees]> SELECT emp_no, last_name, first_name FROM employees WHERE first_name LIKE 'T_m';
Empty set (3.532 sec)

DB [employees]> SELECT emp_no, last_name, first_name FROM employees WHERE last_name NOT LIKE 'B%';
+--------+------------------+----------------+
| emp_no | last_name        | first_name     |
+--------+------------------+----------------+
|  10001 | Facello          | Georgi         |
|  10002 | Simmel           | Bezalel        |
|  10004 | Koblick          | Chirstian      |
|  10005 | Maliniak         | Kyoichi        |
|  10006 | Preusig          | Anneke         |
|  10007 | Zielinski        | Tzvetan        |



| 499976 | Felder           | Guozhong       |
| 499977 | Weisert          | Martial        |
| 499978 | Kuzuoka          | Chiranjit      |
| 499979 | Waleschkowski    | Prasadram      |
| 499980 | Usery            | Gino           |
| 499981 | Mitina           | Yunming        |
| 499982 | Pleszkun         | Mohammed       |
| 499983 | Juneja           | Uri            |
| 499984 | Rodham           | Kaijung        |
| 499985 | Lukaszewicz      | Gila           |
| 499986 | Ranta            | Nathan         |
| 499987 | Dusink           | Rimli          |
| 499988 | Kleiser          | Bangqing       |
| 499989 | Lindqvist        | Keiichiro      |
| 499990 | Kohling          | Khaled         |
| 499991 | Sichman          | Pohua          |
| 499992 | Salverda         | Siamak         |
| 499993 | Mullainathan     | DeForest       |
| 499994 | Argence          | Navin          |
| 499995 | Lichtner         | Dekang         |
| 499997 | Lenart           | Berhard        |
| 499999 | Tsukuda          | Sachin         |
+--------+------------------+----------------+
271230 rows in set (8.065 sec)

DB [employees]> EXIT;
Welcome to the DB monitor.  Commands end with ; or \g.
Your DB connection id is 32
Server version: 10.5.15-DB-0+deb11u1 Raspbian 11

Copyright (c) 2000, 2018, Oracle, DB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

DB [(none)]> USE sakila
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

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
23 rows in set (0.004 sec)

DB [sakila]> DESCRIBE film;
+----------------------+---------------------------------------------------------------------+------+-----+---------------------+-------------------------------+
| Field                | Type                                                                | Null | Key | Default             | Extra                         |
+----------------------+---------------------------------------------------------------------+------+-----+---------------------+-------------------------------+
| film_id              | smallint(5) unsigned                                                | NO   | PRI | NULL                | auto_increment                |
| title                | varchar(255)                                                        | NO   | MUL | NULL                |                               |
| description          | text                                                                | YES  |     | NULL                |                               |
| release_year         | year(4)                                                             | YES  |     | NULL                |                               |
| language_id          | tinyint(3) unsigned                                                 | NO   | MUL | NULL                |                               |
| original_language_id | tinyint(3) unsigned                                                 | YES  | MUL | NULL                |                               |
| rental_duration      | tinyint(3) unsigned                                                 | NO   |     | 3                   |                               |
| rental_rate          | decimal(4,2)                                                        | NO   |     | 4.99                |                               |
| length               | smallint(5) unsigned                                                | YES  |     | NULL                |                               |
| replacement_cost     | decimal(5,2)                                                        | NO   |     | 19.99               |                               |
| rating               | enum('G','PG','PG-13','R','NC-17')                                  | YES  |     | G                   |                               |
| special_features     | set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') | YES  |     | NULL                |                               |
| last_update          | timestamp                                                           | NO   |     | current_timestamp() | on update current_timestamp() |
+----------------------+---------------------------------------------------------------------+------+-----+---------------------+-------------------------------+
13 rows in set (0.019 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP '^(A|B|C)' ORDER BY title;
+---------+-----------------------------+--------------+
| film_id | title                       | release_year |
+---------+-----------------------------+--------------+
|       1 | ACADEMY DINOSAUR            |         2006 |
|       2 | ACE GOLDFINGER              |         2006 |
|       3 | ADAPTATION HOLES            |         2006 |
|       4 | AFFAIR PREJUDICE            |         2006 |
|       5 | AFRICAN EGG                 |         2006 |
|       6 | AGENT TRUMAN                |         2006 |
|       7 | AIRPLANE SIERRA             |         2006 |
|       8 | AIRPORT POLLOCK             |         2006 |
|       9 | ALABAMA DEVIL               |         2006 |
|      10 | ALADDIN CALENDAR            |         2006 |
|      11 | ALAMO VIDEOTAPE             |         2006 |
|      12 | ALASKA PHANTOM              |         2006 |
|      13 | ALI FOREVER                 |         2006 |
|      14 | ALICE FANTASIA              |         2006 |
|      15 | ALIEN CENTER                |         2006 |
|      16 | ALLEY EVOLUTION             |         2006 |
|      17 | ALONE TRIP                  |         2006 |
|      18 | ALTER VICTORY               |         2006 |
|      19 | AMADEUS HOLY                |         2006 |
|      20 | AMELIE HELLFIGHTERS         |         2006 |
|      21 | AMERICAN CIRCUS             |         2006 |
|      22 | AMISTAD MIDSUMMER           |         2006 |
|      23 | ANACONDA CONFESSIONS        |         2006 |
|      24 | ANALYZE HOOSIERS            |         2006 |
|      25 | ANGELS LIFE                 |         2006 |
|      26 | ANNIE IDENTITY              |         2006 |
|      27 | ANONYMOUS HUMAN             |         2006 |
|      28 | ANTHEM LUKE                 |         2006 |
|      29 | ANTITRUST TOMATOES          |         2006 |
|      30 | ANYTHING SAVANNAH           |         2006 |
|      31 | APACHE DIVINE               |         2006 |
|      32 | APOCALYPSE FLAMINGOS        |         2006 |
|      33 | APOLLO TEEN                 |         2006 |
|      34 | ARABIA DOGMA                |         2006 |
|      35 | ARACHNOPHOBIA ROLLERCOASTER |         2006 |
|      36 | ARGONAUTS TOWN              |         2006 |
|      37 | ARIZONA BANG                |         2006 |
|      38 | ARK RIDGEMONT               |         2006 |
|      39 | ARMAGEDDON LOST             |         2006 |
|      40 | ARMY FLINTSTONES            |         2006 |
|      41 | ARSENIC INDEPENDENCE        |         2006 |
|      42 | ARTIST COLDBLOODED          |         2006 |
|      43 | ATLANTIS CAUSE              |         2006 |
|      44 | ATTACKS HATE                |         2006 |
|      45 | ATTRACTION NEWTON           |         2006 |
|      46 | AUTUMN CROW                 |         2006 |
|      47 | BABY HALL                   |         2006 |
|      48 | BACKLASH UNDEFEATED         |         2006 |
|      49 | BADMAN DAWN                 |         2006 |
|      50 | BAKED CLEOPATRA             |         2006 |
|      51 | BALLOON HOMEWARD            |         2006 |
|      52 | BALLROOM MOCKINGBIRD        |         2006 |
|      53 | BANG KWAI                   |         2006 |
|      54 | BANGER PINOCCHIO            |         2006 |
|      55 | BARBARELLA STREETCAR        |         2006 |
|      56 | BAREFOOT MANCHURIAN         |         2006 |
|      57 | BASIC EASY                  |         2006 |
|      58 | BEACH HEARTBREAKERS         |         2006 |
|      59 | BEAR GRACELAND              |         2006 |
|      60 | BEAST HUNCHBACK             |         2006 |
|      61 | BEAUTY GREASE               |         2006 |
|      62 | BED HIGHBALL                |         2006 |
|      63 | BEDAZZLED MARRIED           |         2006 |
|      64 | BEETHOVEN EXORCIST          |         2006 |
|      65 | BEHAVIOR RUNAWAY            |         2006 |
|      66 | BENEATH RUSH                |         2006 |
|      67 | BERETS AGENT                |         2006 |
|      68 | BETRAYED REAR               |         2006 |
|      69 | BEVERLY OUTLAW              |         2006 |
|      70 | BIKINI BORROWERS            |         2006 |
|      71 | BILKO ANONYMOUS             |         2006 |
|      72 | BILL OTHERS                 |         2006 |
|      73 | BINGO TALENTED              |         2006 |
|      74 | BIRCH ANTITRUST             |         2006 |
|      75 | BIRD INDEPENDENCE           |         2006 |
|      76 | BIRDCAGE CASPER             |         2006 |
|      77 | BIRDS PERDITION             |         2006 |
|      78 | BLACKOUT PRIVATE            |         2006 |
|      79 | BLADE POLISH                |         2006 |
|      80 | BLANKET BEVERLY             |         2006 |
|      81 | BLINDNESS GUN               |         2006 |
|      82 | BLOOD ARGONAUTS             |         2006 |
|      83 | BLUES INSTINCT              |         2006 |
|      84 | BOILED DARES                |         2006 |
|      85 | BONNIE HOLOCAUST            |         2006 |
|      86 | BOOGIE AMELIE               |         2006 |
|      87 | BOONDOCK BALLROOM           |         2006 |
|      88 | BORN SPINAL                 |         2006 |
|      89 | BORROWERS BEDAZZLED         |         2006 |
|      90 | BOULEVARD MOB               |         2006 |
|      91 | BOUND CHEAPER               |         2006 |
|      92 | BOWFINGER GABLES            |         2006 |
|      93 | BRANNIGAN SUNRISE           |         2006 |
|      94 | BRAVEHEART HUMAN            |         2006 |
|      95 | BREAKFAST GOLDFINGER        |         2006 |
|      96 | BREAKING HOME               |         2006 |
|      97 | BRIDE INTRIGUE              |         2006 |
|      98 | BRIGHT ENCOUNTERS           |         2006 |
|      99 | BRINGING HYSTERICAL         |         2006 |
|     100 | BROOKLYN DESERT             |         2006 |
|     101 | BROTHERHOOD BLANKET         |         2006 |
|     102 | BUBBLE GROSSE               |         2006 |
|     103 | BUCKET BROTHERHOOD          |         2006 |
|     104 | BUGSY SONG                  |         2006 |
|     105 | BULL SHAWSHANK              |         2006 |
|     106 | BULWORTH COMMANDMENTS       |         2006 |
|     107 | BUNCH MINDS                 |         2006 |
|     108 | BUTCH PANTHER               |         2006 |
|     109 | BUTTERFLY CHOCOLAT          |         2006 |
|     110 | CABIN FLASH                 |         2006 |
|     111 | CADDYSHACK JEDI             |         2006 |
|     112 | CALENDAR GUNFIGHT           |         2006 |
|     113 | CALIFORNIA BIRDS            |         2006 |
|     114 | CAMELOT VACATION            |         2006 |
|     115 | CAMPUS REMEMBER             |         2006 |
|     116 | CANDIDATE PERDITION         |         2006 |
|     117 | CANDLES GRAPES              |         2006 |
|     118 | CANYON STOCK                |         2006 |
|     119 | CAPER MOTIONS               |         2006 |
|     120 | CARIBBEAN LIBERTY           |         2006 |
|     121 | CAROL TEXAS                 |         2006 |
|     122 | CARRIE BUNCH                |         2006 |
|     123 | CASABLANCA SUPER            |         2006 |
|     124 | CASPER DRAGONFLY            |         2006 |
|     125 | CASSIDY WYOMING             |         2006 |
|     126 | CASUALTIES ENCINO           |         2006 |
|     127 | CAT CONEHEADS               |         2006 |
|     128 | CATCH AMISTAD               |         2006 |
|     129 | CAUSE DATE                  |         2006 |
|     130 | CELEBRITY HORN              |         2006 |
|     131 | CENTER DINOSAUR             |         2006 |
|     132 | CHAINSAW UPTOWN             |         2006 |
|     133 | CHAMBER ITALIAN             |         2006 |
|     134 | CHAMPION FLATLINERS         |         2006 |
|     135 | CHANCE RESURRECTION         |         2006 |
|     136 | CHAPLIN LICENSE             |         2006 |
|     137 | CHARADE DUFFEL              |         2006 |
|     138 | CHARIOTS CONSPIRACY         |         2006 |
|     139 | CHASING FIGHT               |         2006 |
|     140 | CHEAPER CLYDE               |         2006 |
|     141 | CHICAGO NORTH               |         2006 |
|     142 | CHICKEN HELLFIGHTERS        |         2006 |
|     143 | CHILL LUCK                  |         2006 |
|     144 | CHINATOWN GLADIATOR         |         2006 |
|     145 | CHISUM BEHAVIOR             |         2006 |
|     146 | CHITTY LOCK                 |         2006 |
|     147 | CHOCOLAT HARRY              |         2006 |
|     148 | CHOCOLATE DUCK              |         2006 |
|     149 | CHRISTMAS MOONSHINE         |         2006 |
|     150 | CIDER DESIRE                |         2006 |
|     151 | CINCINATTI WHISPERER        |         2006 |
|     152 | CIRCUS YOUTH                |         2006 |
|     153 | CITIZEN SHREK               |         2006 |
|     154 | CLASH FREDDY                |         2006 |
|     155 | CLEOPATRA DEVIL             |         2006 |
|     156 | CLERKS ANGELS               |         2006 |
|     157 | CLOCKWORK PARADISE          |         2006 |
|     158 | CLONES PINOCCHIO            |         2006 |
|     159 | CLOSER BANG                 |         2006 |
|     160 | CLUB GRAFFITI               |         2006 |
|     161 | CLUE GRAIL                  |         2006 |
|     162 | CLUELESS BUCKET             |         2006 |
|     163 | CLYDE THEORY                |         2006 |
|     164 | COAST RAINBOW               |         2006 |
|     165 | COLDBLOODED DARLING         |         2006 |
|     166 | COLOR PHILADELPHIA          |         2006 |
|     167 | COMA HEAD                   |         2006 |
|     168 | COMANCHEROS ENEMY           |         2006 |
|     169 | COMFORTS RUSH               |         2006 |
|     170 | COMMAND DARLING             |         2006 |
|     171 | COMMANDMENTS EXPRESS        |         2006 |
|     172 | CONEHEADS SMOOCHY           |         2006 |
|     173 | CONFESSIONS MAGUIRE         |         2006 |
|     174 | CONFIDENTIAL INTERVIEW      |         2006 |
|     175 | CONFUSED CANDLES            |         2006 |
|     176 | CONGENIALITY QUEST          |         2006 |
|     177 | CONNECTICUT TRAMP           |         2006 |
|     178 | CONNECTION MICROCOSMOS      |         2006 |
|     179 | CONQUERER NUTS              |         2006 |
|     180 | CONSPIRACY SPIRIT           |         2006 |
|     181 | CONTACT ANONYMOUS           |         2006 |
|     182 | CONTROL ANTHEM              |         2006 |
|     183 | CONVERSATION DOWNHILL       |         2006 |
|     184 | CORE SUIT                   |         2006 |
|     185 | COWBOY DOOM                 |         2006 |
|     186 | CRAFT OUTFIELD              |         2006 |
|     187 | CRANES RESERVOIR            |         2006 |
|     188 | CRAZY HOME                  |         2006 |
|     189 | CREATURES SHAKESPEARE       |         2006 |
|     190 | CREEPERS KANE               |         2006 |
|     191 | CROOKED FROGMEN             |         2006 |
|     192 | CROSSING DIVORCE            |         2006 |
|     193 | CROSSROADS CASUALTIES       |         2006 |
|     194 | CROW GREASE                 |         2006 |
|     195 | CROWDS TELEMARK             |         2006 |
|     196 | CRUELTY UNFORGIVEN          |         2006 |
|     197 | CRUSADE HONEY               |         2006 |
|     198 | CRYSTAL BREAKING            |         2006 |
|     199 | CUPBOARD SINNERS            |         2006 |
|     200 | CURTAIN VIDEOTAPE           |         2006 |
|     201 | CYCLONE FAMILY              |         2006 |
+---------+-----------------------------+--------------+
201 rows in set (0.129 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP '^a';
+---------+-----------------------------+--------------+
| film_id | title                       | release_year |
+---------+-----------------------------+--------------+
|       1 | ACADEMY DINOSAUR            |         2006 |
|       2 | ACE GOLDFINGER              |         2006 |
|       3 | ADAPTATION HOLES            |         2006 |
|       4 | AFFAIR PREJUDICE            |         2006 |
|       5 | AFRICAN EGG                 |         2006 |
|       6 | AGENT TRUMAN                |         2006 |
|       7 | AIRPLANE SIERRA             |         2006 |
|       8 | AIRPORT POLLOCK             |         2006 |
|       9 | ALABAMA DEVIL               |         2006 |
|      10 | ALADDIN CALENDAR            |         2006 |
|      11 | ALAMO VIDEOTAPE             |         2006 |
|      12 | ALASKA PHANTOM              |         2006 |
|      13 | ALI FOREVER                 |         2006 |
|      14 | ALICE FANTASIA              |         2006 |
|      15 | ALIEN CENTER                |         2006 |
|      16 | ALLEY EVOLUTION             |         2006 |
|      17 | ALONE TRIP                  |         2006 |
|      18 | ALTER VICTORY               |         2006 |
|      19 | AMADEUS HOLY                |         2006 |
|      20 | AMELIE HELLFIGHTERS         |         2006 |
|      21 | AMERICAN CIRCUS             |         2006 |
|      22 | AMISTAD MIDSUMMER           |         2006 |
|      23 | ANACONDA CONFESSIONS        |         2006 |
|      24 | ANALYZE HOOSIERS            |         2006 |
|      25 | ANGELS LIFE                 |         2006 |
|      26 | ANNIE IDENTITY              |         2006 |
|      27 | ANONYMOUS HUMAN             |         2006 |
|      28 | ANTHEM LUKE                 |         2006 |
|      29 | ANTITRUST TOMATOES          |         2006 |
|      30 | ANYTHING SAVANNAH           |         2006 |
|      31 | APACHE DIVINE               |         2006 |
|      32 | APOCALYPSE FLAMINGOS        |         2006 |
|      33 | APOLLO TEEN                 |         2006 |
|      34 | ARABIA DOGMA                |         2006 |
|      35 | ARACHNOPHOBIA ROLLERCOASTER |         2006 |
|      36 | ARGONAUTS TOWN              |         2006 |
|      37 | ARIZONA BANG                |         2006 |
|      38 | ARK RIDGEMONT               |         2006 |
|      39 | ARMAGEDDON LOST             |         2006 |
|      40 | ARMY FLINTSTONES            |         2006 |
|      41 | ARSENIC INDEPENDENCE        |         2006 |
|      42 | ARTIST COLDBLOODED          |         2006 |
|      43 | ATLANTIS CAUSE              |         2006 |
|      44 | ATTACKS HATE                |         2006 |
|      45 | ATTRACTION NEWTON           |         2006 |
|      46 | AUTUMN CROW                 |         2006 |
+---------+-----------------------------+--------------+
46 rows in set (0.054 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP BINARY '^a';
Empty set (0.050 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP BINARY '^A';
+---------+-----------------------------+--------------+
| film_id | title                       | release_year |
+---------+-----------------------------+--------------+
|       1 | ACADEMY DINOSAUR            |         2006 |
|       2 | ACE GOLDFINGER              |         2006 |
|       3 | ADAPTATION HOLES            |         2006 |
|       4 | AFFAIR PREJUDICE            |         2006 |
|       5 | AFRICAN EGG                 |         2006 |
|       6 | AGENT TRUMAN                |         2006 |
|       7 | AIRPLANE SIERRA             |         2006 |
|       8 | AIRPORT POLLOCK             |         2006 |
|       9 | ALABAMA DEVIL               |         2006 |
|      10 | ALADDIN CALENDAR            |         2006 |
|      11 | ALAMO VIDEOTAPE             |         2006 |
|      12 | ALASKA PHANTOM              |         2006 |
|      13 | ALI FOREVER                 |         2006 |
|      14 | ALICE FANTASIA              |         2006 |
|      15 | ALIEN CENTER                |         2006 |
|      16 | ALLEY EVOLUTION             |         2006 |
|      17 | ALONE TRIP                  |         2006 |
|      18 | ALTER VICTORY               |         2006 |
|      19 | AMADEUS HOLY                |         2006 |
|      20 | AMELIE HELLFIGHTERS         |         2006 |
|      21 | AMERICAN CIRCUS             |         2006 |
|      22 | AMISTAD MIDSUMMER           |         2006 |
|      23 | ANACONDA CONFESSIONS        |         2006 |
|      24 | ANALYZE HOOSIERS            |         2006 |
|      25 | ANGELS LIFE                 |         2006 |
|      26 | ANNIE IDENTITY              |         2006 |
|      27 | ANONYMOUS HUMAN             |         2006 |
|      28 | ANTHEM LUKE                 |         2006 |
|      29 | ANTITRUST TOMATOES          |         2006 |
|      30 | ANYTHING SAVANNAH           |         2006 |
|      31 | APACHE DIVINE               |         2006 |
|      32 | APOCALYPSE FLAMINGOS        |         2006 |
|      33 | APOLLO TEEN                 |         2006 |
|      34 | ARABIA DOGMA                |         2006 |
|      35 | ARACHNOPHOBIA ROLLERCOASTER |         2006 |
|      36 | ARGONAUTS TOWN              |         2006 |
|      37 | ARIZONA BANG                |         2006 |
|      38 | ARK RIDGEMONT               |         2006 |
|      39 | ARMAGEDDON LOST             |         2006 |
|      40 | ARMY FLINTSTONES            |         2006 |
|      41 | ARSENIC INDEPENDENCE        |         2006 |
|      42 | ARTIST COLDBLOODED          |         2006 |
|      43 | ATLANTIS CAUSE              |         2006 |
|      44 | ATTACKS HATE                |         2006 |
|      45 | ATTRACTION NEWTON           |         2006 |
|      46 | AUTUMN CROW                 |         2006 |
+---------+-----------------------------+--------------+
46 rows in set (0.056 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP 'F$';
+---------+------------------+--------------+
| film_id | title            | release_year |
+---------+------------------+--------------+
|     281 | ENCINO ELF       |         2006 |
|     355 | GHOSTBUSTERS ELF |         2006 |
|     440 | HUNGER ROOF      |         2006 |
|     959 | WARLOCK WEREWOLF |         2006 |
+---------+------------------+--------------+
4 rows in set (0.068 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP 'f$';
+---------+------------------+--------------+
| film_id | title            | release_year |
+---------+------------------+--------------+
|     281 | ENCINO ELF       |         2006 |
|     355 | GHOSTBUSTERS ELF |         2006 |
|     440 | HUNGER ROOF      |         2006 |
|     959 | WARLOCK WEREWOLF |         2006 |
+---------+------------------+--------------+
4 rows in set (0.050 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP 'ford';
+---------+----------------+--------------+
| film_id | title          | release_year |
+---------+----------------+--------------+
|     371 | GOSFORD DONNIE |         2006 |
+---------+----------------+--------------+
1 row in set (0.058 sec)

DB [sakila]> SELECT film_id, title, release_year FROM film WHERE title REGEXP '^.{10}$';
+---------+------------+--------------+
| film_id | title      | release_year |
+---------+------------+--------------+
|      17 | ALONE TRIP |         2006 |
|      57 | BASIC EASY |         2006 |
|     104 | BUGSY SONG |         2006 |
|     129 | CAUSE DATE |         2006 |
|     143 | CHILL LUCK |         2006 |
|     161 | CLUE GRAIL |         2006 |
|     188 | CRAZY HOME |         2006 |
|     213 | DATE SPEED |         2006 |
|     217 | DAZED PUNK |         2006 |
|     240 | DOLLS RAGE |         2006 |
|     248 | DOZEN LION |         2006 |
|     259 | DUCK RACER |         2006 |
|     262 | DUMBO LUST |         2006 |
|     268 | EARLY HOME |         2006 |
|     278 | ELF MURDER |         2006 |
|     281 | ENCINO ELF |         2006 |
|     284 | ENEMY ODDS |         2006 |
|     321 | FLASH WARS |         2006 |
|     341 | FROST HEAD |         2006 |
|     365 | GOLD RIVER |         2006 |
|     387 | GUN BONNIE |         2006 |
|     407 | HAWK CHILL |         2006 |
|     429 | HONEY TIES |         2006 |
|     436 | HOURS RAGE |         2006 |
|     448 | IDAHO LOVE |         2006 |
|     451 | IGBY MAKER |         2006 |
|     474 | JADE BUNCH |         2006 |
|     476 | JASON TRAP |         2006 |
|     478 | JAWS HARRY |         2006 |
|     500 | KISS GLORY |         2006 |
|     506 | LADY STAGE |         2006 |
|     524 | LION UNCUT |         2006 |
|     527 | LOLA AGENT |         2006 |
|     541 | LUKE MUMMY |         2006 |
|     559 | MARRIED GO |         2006 |
|     560 | MARS ROMAN |         2006 |
|     561 | MASK PEACH |         2006 |
|     577 | MILE MULAN |         2006 |
|     585 | MOB DUFFEL |         2006 |
|     588 | MODEL FISH |         2006 |
|     595 | MOON BUNCH |         2006 |
|     604 | MULAN MOON |         2006 |
|     644 | OSCAR GOLD |         2006 |
|     653 | PANIC CLUB |         2006 |
|     683 | PITY BOUND |         2006 |
|     687 | POCUS PULP |         2006 |
|     706 | QUEEN LUKE |         2006 |
|     710 | RAGE GAMES |         2006 |
|     721 | REDS POCUS |         2006 |
|     741 | ROMAN PUNK |         2006 |
|     743 | ROOM ROMAN |         2006 |
|     772 | SEA VIRGIN |         2006 |
|     808 | SLING LUKE |         2006 |
|     810 | SLUMS DUCK |         2006 |
|     823 | SOUTH WAIT |         2006 |
|     826 | SPEED SUIT |         2006 |
|     836 | SQUAD FISH |         2006 |
|     848 | STONE FIRE |         2006 |
|     850 | STORY SIDE |         2006 |
|     861 | SUIT WALLS |         2006 |
|     870 | SWARM GOLD |         2006 |
|     952 | WAGON JAWS |         2006 |
|     953 | WAIT CIDER |         2006 |
|     960 | WARS PLUTO |         2006 |
|     992 | WRATH MILE |         2006 |
|     997 | YOUTH KICK |         2006 |
+---------+------------+--------------+
66 rows in set (0.065 sec)

DB [sakila]> EXIT;
