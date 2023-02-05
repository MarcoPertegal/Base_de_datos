--Muestrame provincia y añño y que porcentage supone la cantidad de mujeres sobre el stotal de habitantes 
-- :: numeric cambia el tipo de dato
SELECT *, (hombres+ mujeres) AS "total",
		ROUND((mujeres::numeric / (hombres + mujeres))*100, 2) 
			AS "% Mujeres"
FROM demografia_basica;