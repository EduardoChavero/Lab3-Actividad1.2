/* EJEMPLO RELACION 1:N
	Tenemos 2 tablas para el manejo del consumo de los medidores de agua
	Tabla Consumos: incluye la informacion del consumo de cada usuario por cada mes.
	Tabla Usuario: incluye la informacion detallada del usuario.
	Tabla medidor: Incluye los datos del medidor.
	La tabla consumo contiene registros mes a mes, por lo que se puede repetir tanto el cliente como el nro de medidor.
*/

create database consumo_agua
go
use consumo_agua
go

create table medidor(
	NRO_MEDIDOR BIGINT NOT NULL PRIMARY KEY,
	MARCA VARCHAR (20) NULL,
	NRO_SERIE VARCHAR(20) NOT NULL
)

create table usuario(
	NRO_MEDIDOR BIGINT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES medidor(NRO_MEDIDOR),
	DNI_TITULAR VARCHAR(10) NOT NULL UNIQUE,
	DOMICILIO VARCHAR(50) NOT NULL,
	CODIGO_POSTAL INT NOT NULL
)
	
create table consumo(
	NRO_REGISTRO BIGINT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DNI_TITULAR VARCHAR(10) FOREIGN KEY REFERENCES usuario(DNI_TITULAR),
	NRO_MEDIDOR BIGINT NOT NULL FOREIGN KEY REFERENCES medidor(NRO_MEDIDOR),
	FECHA_LECTURA DATE NOT NULL CHECK (FECHA_LECTURA < getdate()),
	CONSUMO_CM3 REAL NOT NULL CHECK(CONSUMO_CM3 > 0 )   
)
