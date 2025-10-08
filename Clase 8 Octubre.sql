
/* sintaxis procedimientos relacionados
DELIMITER $$
CREATE VIEWS PROCEDURE nombreProcedimiento (parametros (in)(out))
begin
-- setencias lógica
end $$
DELIMITER;

INVOCAR PROCEDIMIENTO 
CALL nombreProcedimiento(argumentos)
*/
use bdmascotas;
##Parámetros de entrada
USE 
DELIMITER $$
create procedure ClienteMascota(in idMas int)
begin
select nombreMascota from Mascota 
where idMas= idMascota;
end $$
DELIMITER ;
call ClienteMascota(2);

##pARAMETROS DE SALIDA
DELIMITER $$
create procedure IdMasc(in idMasc int)
begin
select Idmascota from Mascota ;
end $$
DELIMITER ;
call IdMasc(2);

Delimiter $$ 
create procedure ConsularRegistrarMascot (in idMascota int,
in nombreMascota varchar(50) ,
in raza varchar(25), 
in generoMascota varchar(25) ,
in tipoMascota varchar(25),
in fechaCreacion timestamp)

begin 
declare v_nombre varchar(50);
#Validar si elempleado existe
select nombreMascota into v_nombre
from Mascota
where nombremasc=nombreMascota
limit 1;
#Si no existe registrar

  if v_nombre is null then 
insert into Mascota  values (  idMascota ,nombreMascota ,raza , generoMascota ,tipoMascota,fechaCreacion );
select "Mascota registrada" as mensaje;

 else 
select concat("La mascota", nombreMascota, "Ya existe")as mensaje;
select * from Mascota where nombreMascota= v_nombre;
end if ;
end$$
DELIMITER ;
call ConsularRegistrarMascot(3, "mora","Criolla", "Hembra","perro", 2025-09-22);

select*from mascota


/*funciones UDF
create function nombreFuncion(parametros)
return tipoDato
begin
-- Logica de la funcion 
  return valor;
end;
*/

#Funcion calcular el aumento del salario 
DELIMITER $$
create function 