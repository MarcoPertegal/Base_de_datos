--Seleccionar el nombre, apellidos y gasto total de aquellos clientes que 
--gastaron menos que la media de gasto por cliente
SELECT nombre, apellido1, apellido2, 
		SUM(COALESCE(precio * (1 - (descuento::numeric/100)),precio))
FROM cliente JOIN reserva USING (id_cliente)
		JOIN vuelo USING (id_vuelo)
GROUP BY nombre, apellido1, apellido2
HAVING SUM(COALESCE(precio * (1 - (descuento::numeric/100)),precio)
			) < (SELECT AVG(gasto_total)
					FROM (SELECT id_cliente,
								SUM(COALESCE(precio * (1 - (descuento::numeric/100)),precio)) as "gasto_total"
							FROM reserva JOIN vuelo USING (id_vuelo)
							GROUP BY id_cliente
						 ) d					
				);
	
	

