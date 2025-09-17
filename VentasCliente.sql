create database VentasPedido; 
use VentasPedido;

CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombreCliente VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    email VARCHAR(100)
);
describe cliente;
alter table cliente add telefono varchar(15) not null;
alter table cliente drop column direccionCliente;
alter table cliente add emailCliente varchar(50) unique;

create table  pedido(
idPedido int auto_increment primary key,
idClienteFk int,
fechaPedido date,
totalPedido decimal (10,2),
foreign key (idClienteFk) references cliente(idCliente)
);


create table usuario(
idUsuario int auto_increment primary key, 
nombreUser varchar(50) not null,
email varchar(50) unique
);

alter table cliente add idUsuarioFk int;
alter table cliente
add constraint Fkusuariocliente
foreign key (idUsuarioFk)
references usuario(idUsuario);

describe usuario