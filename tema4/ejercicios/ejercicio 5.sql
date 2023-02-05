--1
SELECT product_name
FROM products JOIN order_details USING(product_id)
			JOIN orders USING(order_id)
			JOIN shippers ON (ship_via = shipper_id)
WHERE company_name IN('United Package');

--2
SELECT product_name, category_name
FROM categories JOIN products USING (category_id)
				JOIN order_details USING (product_id)
				JOIN orders USING (order_id)
WHERE TO_CHAR(order_date, 'mm') IN('07');

--3
SELECT company_name
FROM customers;

--4
SELECT first_name
FROM employees e JOIN orders USING (employee_id)
				JOIN customers c USING (customer_id)
WHERE c.country IN ('Brazil');

--5
SELECT product_name, category_name
FROM categories JOIN products USING (category_id)
				JOIN order_details USING (product_id)
				JOIN orders USING (order_id)
				JOIN employees USING (employee_id)
WHERE first_name = 'Janet' AND last_name = 'Leverling';

--6
/*Selecciona el nombre de aquellos productos que hallan sido enviados en el 
mes de febrero por la compañia de transportes Speedy Express con destino Brasil, ordenando
la salida por orden alfabético.
*/
SELECT product_name
FROM products JOIN order_details USING (product_id)
			JOIN orders USING (order_id)
			JOIN shippers ON (ship_via = shipper_id)
WHERE TO_CHAR(shipped_date, 'mm')IN('02')
	AND company_name IN ('Speedy Express')
	AND ship_country IN ('Brazil')
ORDER BY ASC;
