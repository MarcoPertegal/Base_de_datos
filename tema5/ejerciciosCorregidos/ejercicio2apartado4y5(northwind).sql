
--4
SELECT category_name, product_name, 0.25*SUM(od.unit_price * quantity * (1-discount)) as "Beneficio"
FROM order_details od JOIN products USING(product_id)
					JOIN categories USING (category_id)
GROUP BY category_name, product_name;

--5
SELECT DISTINCT customers.*
FROM customers JOIN orders USING (customer_id)
WHERE customer_id NOT IN(
						SELECT DISTINCT customer_id
						FROM orders JOIN shippers s ON (shipper_id = ship_via)
						WHERE s.company_name != 'United Package');