create database BD_TechNova;
use BD_TechNova;
drop database BD_TechNova;
CREATE TABLE Departamento (
id_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DECIMAL(12,2) CHECK (presupuesto > 0)
);
CREATE TABLE Empleado (
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
cargo VARCHAR(50),
salario DECIMAL(10,2) CHECK (salario > 0),
id_departamento INT,
fecha_ingreso DATE,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);
CREATE TABLE Proyecto (
id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
fecha_inicio DATE,
presupuesto DECIMAL(12,2),
id_departamento INT,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);
CREATE TABLE Asignacion (
id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
id_empleado INT,
id_proyecto INT,
horas_trabajadas INT CHECK (horas_trabajadas >= 0),
FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

insert into Departamento (id_Departamento, nombre, presupuesto) values 
("","Ventas", 500000000),
("","Finanzas", 455000000),
("","Diseño", 357000000),
("","Recursos Humanos", 28000000),
("","Marketing", 655000000);

select*from departamento;
insert into Empleado (id_empleado,nombre,cargo,salario,id_departamento ,fecha_ingreso) values 
("","Martin Martinez","Gerente Financiera",7000000,2, 2022-05-16),
("","Flor Flores", "Gerente Marketing", 8000000,5, 2023-03-19),
("","Ricardo Rojas", "Vendedor", 2500000,1,2021-03-05),
("","Linda Linares", "Psicologa", 5000000, 4, 2025-01-31),
("","Sergio Rodriguez", "Analista Financiero", 4000000,2,2019-02-14);

insert into proyecto (id_proyecto, nombre,fecha_inicio,presupuesto,id_departamento) values 
("","Activar Finanzas", 2025-10-02, 10000000,2),
("","Mente para el trabajador", 2025-11-11, 6000000, 4),
("","Redes como aliados", 2025-10-21, 7000000, 5),
("","Aumentar comosiones", 2025-11-12, 5000000, 1),
("","Renovar diseños", 2025-10-23, 8000000, 3);


insert into asignacion (id_asignacion, id_Empleado,id_proyecto,horas_trabajadas) values 
("",1, 1, 6),
("",2, 4, 4),
("",3, 3 , 7),
("",4, 2, 8),
("",5, 5, 7);

#Punto 13
#Creación tabla auditoria 

create table auditoria( id_audioria int auto_increment primary key, 
id_empleado int,
id_Departamento int,
total_empleados int,
fecha_auditoria timestamp);

alter table auditoria add column cargo varchar(50);
alter table auditoria add column salario varchar(50);
alter table empleado drop column fecha_ingreso;
alter table empleado add column fecha_ingreso timestamp;

DELIMITER $$ 
CREATE TRIGGER Auditorias
AFTER INSERT 
ON EMPLEADO
BEGIN
    INSERT INTO AuditoriaEmpl (id_empleado, id_departamento, cargo, salario, total_empleados, fecha_auditoria,)
    VALUES     (new.id_empleado, new.id_departamento, new.cargo, new.salario, (SELECT COUNT(*) FROM Empleado WHERE id_departamento = NEW.id_departamento)
    );
END;

DELIMITER ;

##Procedimiento 

DELIMITER $$
CREATE PROCEDURE altasRecientes()
begin 
select*from AuditoriaEmpl 
order by fecha_auditoria DESC
end;

DELIMITER ;


#PRUEBA
INSERT INTO Empleado (nombre, id_departamento,cargo,salario) VALUES ('Camila Torres',1,"Diseñadora",4600000);
INSERT INTO Empleado (nombre, id_departamento,cargo,salario)VALUES ('Juan Pérez', 1,"Ingeniero",3200000);
INSERT INTO Empleado(nombre, id_departamento,cargo,salario) VALUES ('Laura Gómez', 2, "Analista", 5200000);


select*from empleado;
