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

DROP TABLE categoria;
GO
----------------------------------------------------------------------------------------
-- RESTRICCIÓN CHECK
---- PRIMERA FORMA DE CONSTRUCCIÓN
CREATE TABLE producto(
    producto_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL UNIQUE,
    precio DECIMAL(10,2) NOT NULL CHECK(precio>0.0),
    existencia INT NOT NULL CHECK(existencia>0 AND existencia<=100),
    activo BIT NOT NULL DEFAULT 1
);
GO
DROP TABLE producto;
GO
---------------------------------------------------------------------------------------
---- SEGUNDA FORMA DE CONSTRUCCIÓN(Restricciones por columna)
CREATE TABLE producto(
    producto_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_producto PRIMARY KEY(producto_id),
    nombre VARCHAR(20) NOT NULL
    CONSTRAINT uq_producto_nombre UNIQUE(nombre),
    precio DECIMAL(10,2) NOT NULL
    CONSTRAINT ck_producto_precio CHECK(precio>0.0),
    existencia INT NOT NULL
    CONSTRAINT ck_producto_existencia CHECK(existencia BETWEEN 1 AND 100),
    tipo CHAR(1) NOT NULL
    CONSTRAINT ck_producto_tipo CHECK(tipo='R' OR tipo='P'),
    activo BIT NOT NULL
    CONSTRAINT df_producto_activo DEFAULT 1
);
GO

DROP TABLE producto;
---------------------------------------------------------------------------------
---- TERCERA FORMA DE CONSTRUCCIÓN DE RESTRICCIONES CHECK (Al final de la tabla)
CREATE TABLE producto(
    producto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL,
    tipo CHAR(1) NOT NULL,
    activo BIT NOT NULL
    CONSTRAINT df_producto_activo DEFAULT 1,
    CONSTRAINT pk_producto PRIMARY KEY(producto_id),
    CONSTRAINT uq_producto_nombre UNIQUE(nombre),
    CONSTRAINT ck_producto_precio CHECK(precio>0.0),
    CONSTRAINT ck_producto_existencia CHECK(existencia BETWEEN 1 AND 100),
    CONSTRAINT ck_producto_tipo CHECK(tipo IN ('R','P'))
);
GO

-------------------------------------------------------------------------------------
INSERT INTO producto VALUES ('Pitufo', 450, 98, DEFAULT);

INSERT INTO producto VALUES ('Quemadita', 12, 89, DEFAULT);

INSERT INTO producto(nombre, existencia, precio) VALUES ('Pantera Rosa', 76, 123);

INSERT INTO producto(nombre, existencia, precio) VALUES ('Pantera Rosa', 76, 123);

TRUNCATE TABLE producto;

SELECT * FROM producto;

-------------------------------------------------------------------------------------
-- RESTRICCIÓN FOREIGN KEY
---- SEGUNDA FORMA DE CONSTRUCCIÓN DE RESTRICCIONES FOREIGN KEY (Con Columna) (FORMA NORMAL 2)
CREATE DATABASE empresa_yoda;
GO

USE empresa_yoda;
GO

CREATE TABLE categoria(
    categoria_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_categoria PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
    CONSTRAINT uq_categoria_nombre UNIQUE,
    activo BIT NOT NULL
    CONSTRAINT df_categoria_activo DEFAULT 1
);
GO
---- FORMA NORMAL 3
CREATE TABLE producto(
    producto_id INT NOT NULL IDENTITY(1,1),
    fabricante_id CHAR(3) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    existencia INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    activo BIT NOT NULL
    CONSTRAINT df_producto_activo DEFAULT 1,
    categoria_id INT NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY(producto_id, fabricante_id),
    CONSTRAINT uq_producto_nombre UNIQUE(nombre),
    CONSTRAINT ck_producto_existencia CHECK(existencia>0),
    CONSTRAINT ck_producto_precio CHECK(precio BETWEEN 1 AND 10000),
    CONSTRAINT fk_producto_categoria FOREIGN KEY(categoria_id) REFERENCES categoria(categoria_id)
);
GO

INSERT INTO categoria(nombre) 
VALUES('front end'), ('back end'), ('cloud');

SELECT * FROM categoria;

INSERT INTO producto()
VALUES(1,'ff1','Tailwind', 987.34, 45, DEFAULT, 1);

INSERT INTO producto()
VALUES(2,'ff2','Bootstrap', 567.8, 24, 0, 1);

INSERT INTO producto()
VALUES(1,'ff3','aws', 34.5, 12, DEFAULT,3);

-------------------------------------------------------------------------------------

CREATE TABLE proveedor(
    proveedor_id INT NOT NULL
    CONSTRAINT pk_proveedor PRIMARY KEY(),
    empresa VARCHAR(30) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    limite_credito DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
    contacto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    apellido_paterno VARCHAR(20) NOT NULL,
    apellido_materno VARCHAR(20),
    telefono VARCHAR(10) NOT NULL,
    proveedor_id INT NULL,
    CONSTRAINT pk_contacto_proveedor PRIMARY KEY(contacto_id),
    CONSTRAINT fk_contacto_proveedor FOREIGN KEY(proveedor_id) REFERENCES proveedor(proveedor_id)
    ON DELETE CASCADE -- si se elimina un proveedor, se eliminan sus contactos
    ON UPDATE CASCADE
);
GO

INSERT INTO proveedor 
VALUES(1, 'patito de hukke', NULL, 67888.00),
      (2, 'Bimbo', NULL, 5678.01),
      (3, 'Dulces Domingo', NULL, 6789.01),
      (4, 'Drugs Kevin', NULL, 6785.01);

INSERT INTO contacto_proveedor()
VALUES('Soyla', 'Vaca', 'del Corral', '122242334', 2),
      ('Carmen', 'se perdio', 'la cadenita', '122242334', 2),
      ('Juanito', 'Dulce', 'Terruño', '5678901234', 2),
      ('Laura', 'No esta', 'Comiendo', '6789012345', 1);
GO

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

SELECT * FROM proveedor WHERE proveedor_id=2;
DELETE FROM proveedor WHERE proveedor_id=2;

UPDATE proveedor
SET proveedor_id=10
WHERE proveedor_id=2;

DROP TABLE contacto_proveedor;
DROP TABLE proveedor;
GO

---- Integridad Referencial ON DELETE Y ON UPDATE SET NULL
CREATE TABLE proveedor(
    proveedor_id INT NOT NULL
    CONSTRAINT pk_proveedor PRIMARY KEY(),
    empresa VARCHAR(30) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    limite_credito DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
    contacto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    apellido_paterno VARCHAR(20) NOT NULL,
    apellido_materno VARCHAR(20),
    telefono VARCHAR(10) NOT NULL,
    proveedor_id INT NULL,
    CONSTRAINT pk_contacto_proveedor PRIMARY KEY(contacto_id),
    CONSTRAINT fk_contacto_proveedor FOREIGN KEY(proveedor_id) REFERENCES proveedor(proveedor_id)
    ON DELETE SET NULL -- si se elimina un proveedor, se eliminan sus contactos
    ON UPDATE SET NULL
);
GO

INSERT INTO proveedor 
VALUES(1, 'patito de hukke', NULL, 67888.00),
      (2, 'Bimbo', NULL, 5678.01),
      (3, 'Dulces Domingo', NULL, 6789.01),
      (4, 'Drugs Kevin', NULL, 6785.01);

INSERT INTO contacto_proveedor()
VALUES('Soyla', 'Vaca', 'del Corral', '122242334', 2),
      ('Carmen', 'se perdio', 'la cadenita', '122242334', 2),
      ('Juanito', 'Dulce', 'Terruño', '5678901234', 2),
      ('Laura', 'No esta', 'Comiendo', '6789012345', 1);
GO

SELECT * FROM proveedor
AS p INNER JOIN contacto_proveedor AS cp
ON p.proveedor_id=cp.proveedor_id;

DELETE FROM proveedor WHERE proveedor_id=2;

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

SELECT * FROM proveedor
AS p RIGHT JOIN contacto_proveedor AS cp
ON p.proveedor_id=cp.proveedor_id;

----INTEGRIDAD REFERENCIAL ON DELETE Y ON UPDATE SET DEFAULT

CREATE TABLE proveedor(
    proveedor_id INT NOT NULL
    CONSTRAINT pk_proveedor PRIMARY KEY(),
    empresa VARCHAR(30) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    limite_credito DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
    contacto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
    apellido_paterno VARCHAR(20) NOT NULL,
    apellido_materno VARCHAR(20),
    telefono VARCHAR(10) NOT NULL,
    proveedor_id INT NULL
    CONSTRAINT df_contacto_proveedor_proveedor_id DEFAULT 0,
    CONSTRAINT pk_contacto_proveedor PRIMARY KEY(contacto_id),
    CONSTRAINT fk_contacto_proveedor FOREIGN KEY(proveedor_id) REFERENCES proveedor(proveedor_id)
    ON DELETE SET DEFAULT -- si se elimina un proveedor, se eliminan sus contactos
    ON UPDATE SET DEFAULT
);
GO

INSERT INTO proveedor 
VALUES(1, 'patito de hukke', NULL, 67888.00),
      (2, 'Bimbo', NULL, 5678.01),
      (3, 'Dulces Domingo', NULL, 6789.01),
      (4, 'Drugs Kevin', NULL, 6785.01),
      (0, 'Todas Mias', 'Engañifas', 666.69);
      

INSERT INTO contacto_proveedor()
VALUES('Soyla', 'Vaca', 'del Corral', '122242334', 2),
      ('Carmen', 'se perdio', 'la cadenita', '122242334', 2),
      ('Juanito', 'Dulce', 'Terruño', '5678901234', 2),
      ('Laura', 'No esta', 'Comiendo', '6789012345', 1);
GO

SELECT * FROM proveedor
AS p INNER JOIN contacto_proveedor AS cp
ON p.proveedor_id=cp.proveedor_id;

DELETE FROM proveedor WHERE proveedor_id=2;

UPDATE contacto_proveedor
SET proveedor_id = 3
WHERE proveedor_id = 0;

UPDATE proveedor
SET proveedor_id = 6
WHERE proveedor_id = 3;

-- TODO: Realizar Ejercicio completo de construccion de un diagrama Relacional,
-- aplicando las restricciones y se continua con ALTER y DROP