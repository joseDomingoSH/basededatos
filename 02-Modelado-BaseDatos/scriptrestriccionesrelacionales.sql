-------------------------------------------------------------------
-- Se crea Base de datos bdconstraint
CREATE DATABASE bdconstraint;
GO

USE bdconstraint;
GO

-- Crear tabla paciente con una clave primaria (SQL - LDD)
CREATE TABLE paciente (
    Idpaciente INT NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Ape1 VARCHAR(20) NOT NULL,
    Ape2 VARCHAR(20) NULL,
    FechaNaci DATE NOT NULL,
    CONSTRAINT pk_paciente PRIMARY KEY (Idpaciente),
);
GO

-- Crear tabla expediente con una clave foránea (SQL - LDD)
CREATE TABLE expediente (
    Idexpediente INT NOT NULL,
    Fechaapertura DATE NOT NULL,
    TipoSangre CHAR(3) NOT NULL,
    Idpaciente INT NOT NULL,
    CONSTRAINT unique_idexpediente UNIQUE (Idexpediente),
    CONSTRAINT fk_expediente_paciente FOREIGN KEY (Idpaciente) REFERENCES paciente(Idpaciente)
);

-- Datos para las tablas
INSERT INTO paciente 
VALUES (1, 'Jose Domingo', 'Perez', 'Hernandez', '1995-03-21');

INSERT INTO paciente 
VALUES (2, 'Jose Luis', 'Herrera', 'Gallardo', '1978-04-06');

INSERT INTO paciente 
VALUES (3, 'Parinko', 'Cabeza', 'Grande', '1983-04-06'),
       (4, 'Laura', 'Robledo', 'Davalos', '2005-12-20');


-- INSERTAR EXPEDIENTES
INSERT INTO expediente
VALUES (1, GETDATE(), 'O+', 1);

INSERT INTO expediente
VALUES (2, '2026-06-17', 'O+', 2),;      