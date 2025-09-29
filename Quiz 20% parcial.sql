#RETO
create database retoclase;

create table trabajadores (
codigoTrabajador int auto_increment primary key,
nombreTrabajador varchar(100) not null,
edad int,
departamento varchar(100),
salario varchar (100), 
añoContrato date
);

create table departamento 
drop table trabajadores;
use retoclase;
insert into trabajadores (codigoTrabajador, nombreTrabajador, edad, departamento, salario, añoContrato)
values ("", "Ana Martínez","34", "Ventas", "3500", "2019-01-23"),
("", "Carlos Gómez","28", "IT", "5200", "2021-05-21"),
("", "Javier López","41", "Finanzas", "4000", "2018-12-02"),
("", "Carmen Torres","38", "Recursos Humanos", "4500", "2022-06-03"),
("", "Alejandro Ruiz", "45", "IT", "7800", "2016-02-03"),
("", "Claudia Perez", "27", "Marketing", "3200", "2020-03-01");

drop database retoclase;

select nombretrabajador, edad, salario from trabajadores;
select * from trabajadores where salario>4000;
select * from trabajadores where  departamento= "ventas";
select * from trabajadores where edad between 30 and 49;
select * from trabajadores where añoContrato >= 2020-01-01; 

select departamento, count(*) as "departamento" 
from trabajadores,
group by departamento
having count(*);

select avg(salario) as "salario" from trabajadores;
select * from trabajadores where nombreTrabajador like "A%" or like "C%";
select nombreTrabajador, max(salario) as "salarioMaximo"
from trabajadores
group by nombreTrabajador
having max(Salario); 





create database reto2;

use reto2;

create table empleado (
codigoEmpleado int auto_increment primary key,
nombreEmpleado varchar(100) not null,
fechaNacimiento int,
fechaActual timestamp default current_timestamp,
salario varchar (100), 
añoContrato date,
area varchar (100),
codigoDepartamentoFk int,
foreign key (codigoDepartamentoFk) references departamento(codigoDepartamento)
);

drop table empleado;

create table departamento ( 
codigoDepartamento int auto_increment primary key,
nombreDepartamento varchar(100) not null,
correo varchar(100)
);

drop table departamento;

insert into empleado (codigoEmpleado, nombreEmpleado, fechaNacimiento,fechaActual, salario, añoContrato, area, codigoDepartamentoFk)
values ("", "Ana Martínez","1990-06-03","", "3500", "2019-01-23", "Marketing", 1),
("", "Carlos Gómez","1986-03-09", "", "5200", "2021-05-21", "IT", 2),
("", "Javier López","1968-02-06", "", "4000", "2018-12-02", "IT", 2),
("", "Carmen Torres","2000-01-06", "", "4500", "2022-06-03", "finanzas", 3),
("", "Alejandro Ruiz", "1999-04-13", "", "7800", "2016-02-03", "Recursos Humanos", 4);

insert into departamento (codigoDepartamento, nombreDepartamento, correo)
values ("", "Marketing","marketing@gmail.com"),
("", "IT","item@gmail.com"),
("", "Finanzas","finanzas@gmail.com"),
("", "Recursos Humanos", "recursoshumanos@gmail.com");
select*from departamento;
describe departamento;
select * from empleado;
/*Subconsultas y consultas multitabla
escalares un solo valor
de fila: un registro (fila) completo
de tabla: devuelve varios registro(varias tablas)
*/

select nombreEmpleado, salario 
from empleado
where salario=(select max(salario) from empleado); 

select codigoDepartamento, nombreDepartamento
from departamento
where codigoDepartamento in (select nombreDepartamento from departamento where nombreDepartamento= "It");

select e.nombreEmpleado as "Empleado" , d.nombreDepartamento as "Departamento"
from empleado e
inner join departamento d on e.codigoDepartamentoFk= d.codigoDepartemento;

select nombreEmpleado, salario 
from empleado
where salario > (select avg(salario) from empleado); 

select nombreEmpleado, salario 
from empleado
where salario < (select max(salario) from empleado where salario= (select max(salario) from empleado));




