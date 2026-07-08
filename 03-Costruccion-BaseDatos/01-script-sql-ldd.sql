/*Construcción de base de datos 
con SQL-LDD (CREATE, ALTER, DROP)*/

-- Crear una base de datos
CREATE DATABASE empresa_patito;
GO

-- Utlizar la base de Datos
USE empresa_patito;
GO

-- Crear tabla
CREATE TABLE alumno(
    alumno_id INT,
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25)
);
GO

INSERT INTO alumno VALUES(1, 'Domingo', 'Sarabia', 'Mendez', '1942-03-14', 'domingo@domingo.com');
INSERT INTO alumno VALUES(1, 'Patricio', 'Pineda', 'Robles', '1912-05-14', 'patricio@patito.com');

SELECT * FROM alumno;

-- Eliminar Tabla
DROP TABLE alumno;

-- Restricciones
-- Primary Key V1
CREATE TABLE alumno(
    alumno_id INT PRIMARY KEY,
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25)
);
GO

DROP TABLE alumno;
GO

-- Primary Key V2

CREATE TABLE alumno(
    alumno_id INT NOT NULL CONSTRAINT pk_alumno PRIMARY KEY(alumno_id),
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25)
);
GO

INSERT INTO alumno VALUES(1, 'Domingo', 'Sarabia', 'Mendez', '1942-03-14', 'domingo@domingo.com');
INSERT INTO alumno VALUES(2, 'Patricio', 'Pineda', 'Robles', '1912-05-14', 'patricio@patito.com');

SELECT * FROM alumno;

-- Primary Key V3
CREATE TABLE alumno(
    alumno_id INT NOT NULL,
    nombre VARCHAR(30),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(25),
    CONSTRAINT pk_alumno PRIMARY KEY(alumno_id)
);
GO

INSERT INTO alumno VALUES(1, 'Domingo', 'Sarabia', 'Mendez', '1942-03-14', 'domingo@domingo.com');
INSERT INTO alumno VALUES(2, 'Patricio', 'Pineda', 'Robles', '1912-05-14', 'patricio@patito.com');

SELECT * FROM alumno;

-- Primary Key con IDENTITY
CREATE TABLE categoria(
    categoria_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    activo bit NOT NULL
);
GO    

INSERT INTO categoria VALUES ('Carnes Frias', 1);

INSERT INTO categoria VALUES ('Carnes Frias', 1)

DROP TABLE categoria;
-- forma 1
CREATE TABLE categoria(
    categoria_id INT IDENTITY(1,1) CONSTRAINT pk_categoria PRIMARY KEY (categoria_id),
    nombre VARCHAR(25) NOT NULL UNIQUE,
    activo bit NOT NULL
);
GO    

INSERT INTO categoria VALUES ('Carnes Frias', 1);

INSERT INTO categoria VALUES ('Carnes Frias', 1)

-- FORMA 2
CREATE TABLE categoria(
    categoria_id INT IDENTITY(1,1) CONSTRAINT pk_categoria PRIMARY KEY (categoria_id),
    nombre VARCHAR(25) NOT NULL CONSTRAINT uq_categoria_nombre UNIQUE,
    activo bit NOT NULL
);
GO    

INSERT INTO categoria VALUES ('Carnes Frias', 1);

INSERT INTO categoria VALUES ('Carnes Frias', 1)

-- forma 3

CREATE TABLE categoria(
    categoria_id INT IDENTITY(1,1),
    nombre VARCHAR(25) NOT NULL UNIQUE,
    activo bit NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (categoria_id),
    CONSTRAINT uq_categoria_nombre UNIQUE(nombre)
);
GO    

INSERT INTO categoria VALUES ('Carnes Frias', 1);

INSERT INTO categoria VALUES ('Carnes Frias', 1)