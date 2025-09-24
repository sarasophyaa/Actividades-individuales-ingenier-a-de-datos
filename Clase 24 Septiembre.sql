/* Consultas especificas*/
#alias
describe mascota;
select idMascota as " Codigo  Masocta",  nombreMascota as "Nombre Mascota" from mascota;

#Condiciones operadores lógicos and or y not operadores de comparacion < > <= >=

select * from cliente where nombreCliente1= "Sara";

#diferente != <>
select * from cliente where nombreCliente1<> "Sara";

#mayor que (solo numerico)
select * from mascota where edadMascota> 3;
#menor que (solo numerico)
select * from mascota where edadMascot< 3;

#mayor o menor igual (solo numerico)
select * from mascota where edadMascota >= 3;

#between and
select * from mascota where edadMascota between 2 and 5;

/*patron like patrones de texto campos var char texto comodines
% -> representa cero uno o muchos caracteres
_ -> representa un solo caracter
empiecen por cierto caracter like xxxx%
terminen en cierto caracter like %xxxxx
contenga ciertos caracteres like  like %xxxx%
not like que no cotenga
*/

select * from mascota where nombreMascota like "Ka%";

select * from mascota where nombreMascota like "%tia";

select * from mascota where nombreMascota like "%tia%";

select * from mascota where nombreMascota like "%a%";

select * from mascota where nombreMascota like "K_a";

#in valor in (valo1r, valor2, valor3...)
select * from mascota where nombreMascota in (3,4,5,6);
select * from mascota where nombreMascota in ("katia", "betita");

# And or not *from nombreTabla wher valor=valorcomparacion

select * from mascota where nombreMascota= "katia" and raza = "perro";
select * from mascota where nombreMascota= "katia" or raza = "perro";
select * from mascota where not nombreMascota= "Katia";

#ordenar asc desc selct campo1, campo2 from nombreTabla order by campoOrdenar asc/desc
select  c. cliente from cliente c
;

#agrupar
/* selecto * from columna, funcionagregacion () from tabla by campo*/