
--1
SELECT company_name, contact_name
FROM customers JOIN orders USING (customer_id)

--2
SELECT count(order_id)
FROM orders JOIN shippers ON (ship_via = shipper_id)		
WHERE company_name IN('Federal Shipping', 'United Package')

--3
SELECT product_name
FROM products JOIN order_details USING (product_id)
			JOIN orders USING (order_id)
WHERE shipped_date IS NOT null

--4
SELECT SUM(unit_price*quantity)
FROM order_details JOIN orders USING (order_id)
WHERE TO_CHAR (shipped_date, 'YY') IN ('96')

--5
SELECT contact_name, first_name
FROM customers JOIN orders USING (customer_id)
			JOIN employees USING (employee_id)
WHERE DATEDIFF(shipped_date, required_date) < 20;

--6 
/*Selecciona todos los nombres de compañías que hallan enviado productos en julio y 
agosto del 96, con un precio de más de 50 euros la unidad y cuyo país de destino empiece 
por "B" o por "S".*/
SELECT DISTINCT company_name, ship_country
FROM shippers JOIN orders ON (shipper_id = ship_via)
			JOIN order_details o USING (order_id)
			JOIN products p USING (product_id)
WHERE TO_CHAR(shipped_date, 'mm/yy') IN ('07/96', '08/96')
	AND p.unit_price > 50
	AND ship_country ILIKE 'B%';
