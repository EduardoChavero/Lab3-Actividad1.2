/* EJEMPLO RELACION 1:1
	Tenemos 2 tablas para el manejo del consumo de los medidores de agua
	Tabla medidor: incluye la informacion del medidor.
	Tabla Usuario: incluye la informacion detallada del usuario.
	Ambas se relacionan con el Nro de Medidor, el cual solo puede existir 1 registro en cada tabla. Cada medidor solo tiene un usuario posible.
*/

create database consumo_agua

use consumo_agua


create table medidor(
	NRO_MEDIDOR BIGINT NOT NULL PRIMARY KEY,
	MARCA VARCHAR (20) NULL,
	NRO_SERIE VARCHAR(20) NOT NULL
)


create table usuario(
	NRO_MEDIDOR BIGINT NOT NULL  PRIMARY KEY FOREIGN KEY REFERENCES medidor(NRO_MEDIDOR),
	DNI_TITULAR VARCHAR(10) NOT NULL UNIQUE,
	DOMICILIO VARCHAR(50) NOT NULL,
	CODIGO_POSTAL INT NOT NULL
)
