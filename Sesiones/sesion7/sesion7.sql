create database if not exists AndresRamirez;

use AndresRamirez;

# Consultar antes de eliminar
select * from users where Occupation = 20;
# Eliminar registros consultados
delete from users where Occupation = 20;

# Insertar
insert into users 
(`UserID`, `Gender`, `Age`, `Occupation`, `Zip-Code`)
values (7000, 'M', 18, 0, 45060);
# Insertando varios en mismo query
insert into users 
(`UserID`, `Gender`, `Age`, `Occupation`, `Zip-Code`)
values (7001, 'M', 18, 0, 45060), (7002, 'M', 18, 0, 45060);
# Consultar registro insertado
select * from users where `Zip-Code` = 45066;

# Actualizar campos
update users set `Zip-Code` = 45066, Occupation = 15 where `Zip-Code` = 45060;