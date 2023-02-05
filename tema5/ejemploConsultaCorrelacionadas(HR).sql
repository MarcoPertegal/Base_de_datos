--Seleccionar el nombre del pdepartamento, el nomnbrecompleto del empledado
--y su salario, para el empleado que cobrea más de cada departamnto
SELECT department_name, first_name, last_name, salary
FROM departments d1 JOIN employees USING (department_id)
WHERE salary >= ALL (
					SELECT salary
					FROM employees JOIN departments d2 USING (department_id)
					WHERE d1.department_name = d2.department_name);