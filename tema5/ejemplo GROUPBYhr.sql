--Listar el número de empleados que tiene cada departamento
--HAY un departamento que no tiene ningun empleqado por lo que no sale, para eso se usa el join lateral
--aun asi no sale pq estoy en local y eso lo modifco liusmi
SELECT department_name,COUNT(employee_id)--COUNT(*)
FROM employees JOIN departments USING(department_id)
GROUP BY department_name;