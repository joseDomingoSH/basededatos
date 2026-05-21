-- Crear base de datos pruebag1

-- Permite crear una base de datos (SQL - LDD)
CREATE DATABASE prueba1;

-- Utilizar la base de datos
USE prueba1;

-- Crear una tabla (SQL - LDD)
CREATE TABLE alumno (
id INT NOT NULL,
nombre VARCHAR(20) NOT NULL,
edad INT NOT NULL,
matricula INT NOT NULL,
direccion VARCHAR(30) NULL,
CONSTRAINT pk_alumno
PRIMARY KEY (id),
CONSTRAINT unique_matricula
UNIQUE (matricula)
);

-- Agregar dos alumnos (SQL - LMD) 
INSERT INTO alumno (id, nombre, edad, matricula, direccion)
values (1, 'ARCADIA', 48, 123456, 'Calle Libres #35'),
       (2, 'NARNIA', 18, 126545, 'Conocido Los Alamos');

-- Seleccionar los alumnos (SQL - LMD)
SELECT * FROM alumno;

-- Cambiar el nombre de arcadia a monico (SQL - LMD)
UPDATE alumno SET nombre = 'MONICO' WHERE id = 1;
