create database ejemplo1;
use ejemplo1;
create table clientes(
id_cliente int auto_increment primary key,
nombreCliente varchar(100) not null,
emailCliente varchar(100) unique
);

create table perfiles(
idPerfil int auto_increment primary key,
id_clienteFk int unique, 
direccion varchar(100),
fecharegistro date,
foreign key (id_clienteFk) references clientes(id_cliente)
);


create table clientes1(
id_cliente int auto_increment primary key,
nombreCliente varchar(100) not null,
emailCliente varchar(100) unique
);

create table perfiles1(
id_cliente int primary key, 
direccion varchar(100),
fecharegistro date,
foreign key (id_cliente) references clientes1(id_cliente)
);

drop database ejemplo1;

use ejemplo1;

#DML

#insert

/* insert into (nombre tabla) (campos) values (valor1,valor2,valor3)
insert into (nombreTabla) values values (valor1, valor2, valor3) */

describe mascota;
insert into mascota (idMascota, nombreMascota, raza, generoMascota, tipoMascota, fechaCreacion)
values ("", "Katia","Criolla", "Hembra", "Gato", "2025-09-22");

insert into Mascota

insert into Mascota values values (" ", "Betita","Criolla", "Hembra", "Gato", "2025-09-21");


select * from mascota;

describe cliente;

insert into cliente
values (" 10132569252", "Sara", "Sophya", "Cortes", "Angulo", "301-296-2994", "saracortes134@gmail.com"),
(" 6451002545", "Karol", "Tatiana", "Rojas", "Rojas", "320*569-9632", "karoltrr@gmail.com"),
("145810125 ", "Ameli", "Tania", "Aguirre", "Cires", "356-154-5484", "ameli1234@gmail.com");

