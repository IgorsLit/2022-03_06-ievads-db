USE sakila;

SELECT * FROM city, country;
-- pirmai pilsetai visi valsti analogiski CROSS JOIN, Dekarta reizinajums
SELECT * FROM city AS ct CROSS JOIN country AS cntr WHERE ct.city_id = 1; 

SELECT country.country, city.country_id 
FROM country INNER JOIN city;

SELECT co.country_id AS country_coid, 
       co.country AS country_coid, 
       ct.country_id AS city_coid
FROM country AS co INNER JOIN city ct
USING(country_id);
-- lauku nosaukumi sakrit divas tabulas

SELECT co.country_id AS country_coid, 
       -- co.country AS country_name, 
       ct.country_id AS city_coid,
       ct.city, co.country
FROM country AS co INNER JOIN city ct
ON co.country_id = ct.country_id;

SELECT co.country_id AS country_coid, 
       -- co.country AS country_name, 
       ct.country_id AS city_coid,
       ct.city, co.country
FROM country AS co INNER JOIN city ct
WHERE co.country_id = ct.country_id
ORDER BY co.country_id;

SELECT * FROM city WHERE country_id = 2;

SELECT * FROM country WHERE country_id = 2;

SELECT co.country_id AS country_coid, 
       -- co.country AS country_name, 
       ct.country_id AS city_coid,
       ct.city, co.country
FROM country AS co, city ct
WHERE co.country_id = ct.country_id
ORDER BY co.country_id;

SELECT co.country_id AS country_coid, 
       co.country AS country_name, 
       ct.country_id AS city_coid, adr.address
FROM country AS co INNER JOIN city ct
USING(country_id)
INNER JOIN address as adr
USING(city_id)
ORDER BY co.country_id;

CREATE SCHEMA 10lesjoins;
USE 10lesjoins;
CREATE TABLE country_copy SELECT * FROM sakila.country;
SELECT max(country_copy.country_id) FROM country_copy;
INSERT INTO country_copy VALUES (110, 'nezinama', '2022-05-31');

CREATE TABLE city_copy SELECT * FROM sakila.city;

SELECT co.country_id AS country_coid, 
       co.country AS country_name, 
       ct.country_id AS city_coid 
FROM country_copy AS co INNER JOIN city_copy ct
USING(country_id)
WHERE country_id > 105
ORDER BY co.country_id;

-- LEFT OUTER JOIN
SELECT co.country_id AS country_coid, 
       co.country AS country_name, 
       ct.country_id AS city_coid, 
       city, ct.last_update
FROM country_copy AS co LEFT OUTER JOIN city_copy AS ct
USING(country_id)
WHERE country_id > 105
ORDER BY co.country_id DESC;

SELECT count(*)
FROM country_copy AS co LEFT OUTER JOIN city_copy AS ct
USING(country_id)
WHERE ct.country_id is NULL
ORDER BY co.country_id DESC;

SELECT * FROM country_copy WHERE country_id = 109;
SELECT * FROM country_copy WHERE country_id = 108;

-- apvienot divus vaicajumus
SELECT * FROM country_copy WHERE country_id = 109
UNION ALL
SELECT * FROM country_copy WHERE country_id = 108;

-- ar dublikatu
SELECT * FROM country_copy WHERE country_id IN (108, 109)
UNION ALL
SELECT * FROM country_copy WHERE country_id = 108;

-- izsledzot duplikatu
SELECT * FROM country_copy WHERE country_id IN (108, 109)
UNION 
SELECT * FROM country_copy WHERE country_id = 108;