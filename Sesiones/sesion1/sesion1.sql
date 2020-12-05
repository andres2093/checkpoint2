-- Mostrar las bases de datos
show databases;
# Seleccionar una base de datos
use tienda;
-- Mostrar las tablas de la db
show tables;
-- Estructura de tabla
describe empleado;
-- Crear base de datos
create schema AndresRamirez;
-- Consultar datos de tabla
select * from empleado;
-- Consultar datos de tabla con filtro
select * from empleado where apellido_paterno = "Risom";

select * from empleado where id_puesto >= 100 and id_puesto <= 200;

select * from empleado where id_puesto = 100 or id_puesto = 200 or id_puesto = 300;

select * from empleado where id_puesto in(100, 200, 300);

# RETO
-- ¿Cuál es el nombre de los empleados con el puesto 4?
-- ¿Qué puestos tienen un salario mayor a $10,000?
-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
-- ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
select * from venta where id_articulo in(135, 963) and id_empleado in (835, 369);

select * from venta where (id_articulo  = 135 or id_articulo = 963) 
and (id_empleado = 835 or id_empleado = 369);

-- top 5 de puestos por salarios
select * from puesto order by salario desc limit 5;