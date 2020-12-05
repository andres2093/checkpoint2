# Seleccionar base de datos
use tienda;
# Mostrar llaves
show keys from venta;
# Inner join
select * from empleado e
join puesto p
on e.id_puesto = p.id_puesto;
# Left join
select * from puesto p
left join empleado e
on e.id_puesto = p.id_puesto;
# Right join
select * from empleado e
right join puesto p
on e.id_puesto = p.id_puesto;

# Reto 1
# ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT clave, nombre, apellido_paterno
FROM venta AS v
JOIN empleado AS e
  ON v.id_empleado = e.id_empleado
ORDER BY clave;
# ¿Cuál es el nombre de los artículos que se han vendido?
SELECT clave, nombre
FROM venta AS v
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
ORDER BY clave;
# ¿Cuál es el total de cada venta?
select clave, round(sum(precio), 2) as total from venta v
join articulo a
on v.id_articulo = a.id_articulo
group by clave
order by clave;

# Crear vista
create view AndresRamirez as
(select v.clave, v.fecha, a.nombre as producto, a.precio,
concat(e.nombre, ' ', e.apellido_paterno) as empleado
from venta v
join empleado e
on v.id_empleado = e.id_empleado
join articulo a
on v.id_articulo = a.id_articulo);

# Consultar vista
select * from AndresRamirez;
# Consultar vista con group by y funciones
select clave, round(sum(precio), 2) as total
from AndresRamirez
group by clave;

# Reto 2
# Obtener el puesto de un empleado.
select e.nombre
from empleado e
join puesto p
on e.id_puesto = p.id_puesto;
# Saber qué artículos ha vendido cada empleado.
select v.clave, e.nombre as empleado, a.nombre articulo
from venta v
join empleado e
on v.id_empleado = e.id_empleado
join articulo a
on v.id_articulo = a.id_articulo
order by v.clave;
# Saber qué puesto ha tenido más ventas.
create view AndresRamirez3 as
(select p.nombre, count(v.clave) as total
from venta v
join empleado e
on v.id_empleado = e.id_empleado
join puesto p
on e.id_puesto = p.id_puesto
group by p.nombre);

select * from AndresRamirez3 order by total desc limit 1;

/*
Comentarios
en 
multi-linea
*/

use classicmodels;