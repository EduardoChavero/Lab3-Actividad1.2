/* EJEMPLO RELACION 1:N
	Tenemos 2 tablas para el manejo del consumo de los medidores de agua
	Tabla Consumo: incluye la informacion del consumo de cada usuario por cada mes.
	Tabla Usuario: incluye la informacion detallada del usuario.
	Se relacionan por el numero de DNI del cliente, el cual puede existir solo un cliente con ese DNI, pero varias cargas de consumo del mismo.
*/

create database consumo_agua

use consumo_agua

create table usuario(
	NRO_MEDIDOR BIGINT NOT NULL PRIMARY KEY,
	DNI_TITULAR VARCHAR(10) NOT NULL UNIQUE,
	DOMICILIO VARCHAR(50) NOT NULL,
	CODIGO_POSTAL INT NOT NULL
)
	
create table consumo(
	NRO_REGISTRO BIGINT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DNI_TITULAR  VARCHAR(10) FOREIGN KEY REFERENCES usuario(DNI_TITULAR),
	FECHA_LECTURA DATE NOT NULL CHECK (FECHA_LECTURA < getdate()),
	CONSUMO_CM3 REAL NOT NULL CHECK(CONSUMO_CM3 > 0 )   
)