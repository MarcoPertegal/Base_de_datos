SELECT *
from vuelo
order by salida
offset 25 --esto ignora los 25 primeros resultados
limit 5;

SELECT *
from vuelo
order by random()
limit 25;


SELECT *
from vuelo
order by salida
--offset (n-1)*s
offset 29*25
limit 25;
--no aparece nada pq se ha excedido el número de elemntos

s=25
n=29

--La media de descuento de la tabla vuelo
SELECT ROUND(AVG(COALESCE(descuento, 0)),2)
FROM vuelo;

--descuentos distintos dentro de la tabla vuelo
SELECT COUNT(DISTINCT descuento)
FROM vuelo;

