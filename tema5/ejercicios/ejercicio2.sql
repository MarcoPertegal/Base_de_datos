SELECT *
FROM shippers

--1
SELECT COUNT(order_id)
FROM employees JOIN orders USING (employee_id)
ORDER BY first_name
HAVING COUNT(order_id) BETWEEN 100 AND 150;

--2
SELECT company_name
FROM shippers LEFT JOIN orders ON (shipper_id = ship_via)
WHERE order_id IS NULL;

--3
SELECT category_name, MAX(num)
FROM(
	SELECT COUNT DISTINCT(product_name) AS "num"
	FROM products JOIN categories USING (category_id)
	ORDER BY category_name
) d;

--4
SELECT product_name, SUM((unit_price*25)/100) AS "ganancia"
FROM products JOIN categories USING (category_id)
GROUP BY ganan

--5
SELECT c.company_name 
FROM customers c JOIN orders USING (customer_id)
			JOIN shippers s ON(ship_via = shipper_id)
WHERE s.company_name = 'United Package';




SELECT * 
FROM products
