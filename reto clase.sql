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

drop table trabajadores;
use retoclase;
insert into trabajadores (codigoTrabajador, nombreTrabajador, edad, departamento, salario, añoContrato)
values ("", "Ana Martínez","34", "Ventas", "3500", "2019"),
("", "Carlos Gómez","28", "IT", "5200", "2021"),
("", "Javier López","41", "Finanzas", "4000", "2018"),
("", "Carmen Torres","38", "Recursos Humanos", "4500", "2022"),
("", "Alejandro Ruiz", "45", "IT", "7800", "2016"),
("", "Claudia Perez", "27", "Marketing", "3200", "2020");

select nombretrabajador, edad, salario from trabajadores;
select * from trabajadores where salario>4000;
select * from trabajadores where  departamento= "ventas";
select * from trabajadores where edad between 30 and 49;
select * from trabajadores where añoContrato > 2020; 
