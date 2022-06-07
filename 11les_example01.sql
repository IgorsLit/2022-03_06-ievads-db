USE employees;

-- SELECT * FROM dept_manager;
SELECT * FROM depatments WHERE dept_no = (SELECT dept_no FROM dept_manager WHERE emp_no = 110085);

-- vairak ierakstu b'us k'l'uda
SELECT * FROM depatments WHERE dept_no = (SELECT dept_no FROM dept_manager WHERE emp_no > 110085);
SHOW ERRORS;

DESCRIBE dept_manager;

-- Koleracijas apak'svaicajums
USE classicmodels;
SELECT customerNumber, sum(priceEach * quantityOrdered) AS total_peer_order
FROM orderdetails AS od JOIN orders AS o USING (orderNumber)
GROUP BY customerNumber;

-- VIEW 
DROP VIEW amount_per_customerNumber_vw;
CREATE VIEW amount_per_customerNumber_vw AS
SELECT customerNumber, customerName, sum(priceEach * quantityOrdered) AS total_peer_order
FROM orderdetails AS od JOIN orders AS o USING (orderNumber)
JOIN customers USING (customerNumber)
GROUP BY customerNumber, customerName;    
-- !!! GROUP BY j'abut abiem laukiem, tapec ka agregatfunkcija atgriezz vienu bet ir vairaki ieraksti laukiem customerNumber, customerName

SELECT * FROM amount_per_customerNumber_vw;

-- VIEW2
DROP VIEW amount_per_customerNumber_vw;
CREATE VIEW amount_per_customerNumber_vw AS
SELECT customerNumber, customerName, YEAR(orderDate) AS order_year, sum(priceEach * quantityOrdered) AS total_peer_order
FROM orderdetails AS od JOIN orders AS o USING (orderNumber)
JOIN customers USING (customerNumber)
GROUP BY customerNumber, customerName, YEAR(orderDate);

SELECT * FROM amount_per_customerNumber_vw AS oute WHERE order_year = 2005
AND total_per_order > (SELECT total_per_order FROM amount_per_customerNumber_vw WHERE customerNumber = oute.customerNumber and
order_year = 2004);