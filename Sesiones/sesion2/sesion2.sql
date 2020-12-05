use tienda;
-- Buscar con LIKE
select * from empleado where nombre like "M%";
select * from empleado where nombre like "%a";
select * from empleado where nombre like "M%a";
select * from empleado where nombre like "%ti%";
select * from empleado where nombre like "M_losa";

# Reto 1
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
select count(nombre) from articulo where nombre like "%Pasta%";
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select * from articulo where nombre like "%-%";

SELECT (1 + 7) * (10 / (6 - 4));

-- Promedio
select round(avg(precio), 1) from articulo;
-- Contar
select count(precio) from articulo;
-- Maximo
select max(precio) from articulo;
-- Minimo
select min(precio) from articulo;
-- Suma
select sum(precio) from articulo;

# Reto 2
-- ¿Cuál es el promedio de salario de los puestos?
-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
select count(nombre) from articulo where nombre like "%Pasta%";
-- ¿Cuál es el salario mínimo y máximo?
select min(salario), max(salario) from puesto;
-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
select sum(salario) from puesto where id_puesto > (
select max(id_puesto) - 5 from puesto);

select id_puesto from puesto order by id_puesto desc limit 5;
select sum(salario) from puesto where id_puesto in(1000, 999, 998, 997, 996);

select sum(salario) from 
(select * from puesto order by id_puesto desc limit 5) ultimos_puestos;

select nombre, avg(precio) as total
from articulo group by nombre;

select nombre, count(*) as cantidad
from articulo
group by nombre
order by cantidad desc;

select nombre, min(salario) as menor, max(salario) as mayor
from puesto
group by nombre;

# Reto 3
-- ¿Cuántos registros hay por cada uno de los puestos?
select nombre, count(*) as cantidad 
from puesto 
group by nombre 
order by cantidad desc;
-- ¿Cuánto dinero se paga en total por puesto?
select nombre, round(sum(salario), 2) as total 
from puesto 
group by nombre order by total desc;
-- ¿Cuál es el número total de ventas por vendedor?
select id_empleado, count(*) as ventas
from venta
group by id_empleado order by ventas desc;
-- ¿Cuál es el número total de ventas por artículo?
select id_articulo, count(*) as ventas
from venta
group by id_articulo order by ventas desc;

# EJ

select id_puesto from puesto where nombre like 'Junior Executive';

select nombre from empleado where id_puesto in(
select id_puesto from puesto where nombre like 'Junior Executive'
);

select clave, id_articulo, count(*) as cantidad
from venta
group by clave, id_articulo
order by clave;

select id_articulo, min(cantidad), max(cantidad)
from(
	select clave, id_articulo, count(*) as cantidad
	from venta
	group by clave, id_articulo
	order by clave
) as nombreTemporal
group by id_articulo;