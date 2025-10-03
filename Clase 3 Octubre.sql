
/* modificaciones update sintaxis:
update nombreTabla set campo=valor, campo1=valor1 where condicion*/
describe mascota;
select*from mascota;
update mascota set nombreMascota="motas" where idMascota=1;

select * from cliente;
describe cliente;
update mascota set nombreMascota="motas", raza="Esfinge"  where idMascota=1;

update mascota set raza="Esfinge"  where idMascota=1 or idMascota=2;

/* delete eliminar
sintaxis: delete from nombreTabla where condicion begin rollback commit
Reglas ACID atomicidad, consistecncia, aislamiento, durabilidad*/

delete from cliente where documentoCliente=0;

start transaction; 
delete from cliente where documentoCliente=565495;
commit;

/*revertir*/

start transaction;
delete from cliente where documentoCliente=565495;
rollback;

show variables like "autocommit";

/* Ver los commits*/

show processlist;
select * from information_schema.innodb_trx;

show binary logs;

/*views - triggers procedimientos almacenados
create view nombreVista as select campos from tabla where condicion;
select * from nombreVista
*/
create view vistaMascota as select m.nombreMascota as "Nombre Mascota",
m.raza as "tipo Mascota" from mascota m;

select * from vistaMascota;

create view vistaCliente as select c.documentoCliente as "Cliente" , m.codigoMascota as "Codigo animal"
from cliente c
inner join m Codigo animal on c.documentoClienFk= m.documentoCliente;