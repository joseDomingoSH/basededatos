-- Alter Table

------- Agregar una columna
USE pruebaatributos;
GO

SELECT * FROM alumno;

TRUNCATE TABLE alumno;
SELECT 
    COLUMN_NAME, SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM
INFORMATION_SHEMA.COLUMNS
WHERE TABLE_NAME = 'alumno'
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH,
    
FROM
INFORMATION_SHEMA.COLUMNS
WHERE TABLE_NAME = 'alumno'

ALTER TABLE alumno
ADD telefono VARCHAR(20) NOT NULL;

------ Agregar mas columnas
ALTER TABLE alumno
ADD
curp VARCHAR(18),
matricula VARCHAR(13) NOT NULL;

----Modificar un tipo de dato
ALTER TABLE alumno
ALTER COLUMN telefono VARCHAR (30);
GO

----- Agregar Restricciones
-- PRimary Key

CREATE TABLE 
--- Este codigo crea una tabla con cero registros a partir de otra tabla
SELECT TOP 0 *
INTO alumno2
FROM alumno;
-- Esta consulta obtiene los nombre de las restricciones y
-- sus tipos de una tabla
SELECT 
    o.name AS nombre_restriccion,
    o.type_desc AS tipo_restriccion
FROM sys.objects AS o
WHERE o.parent_object_id = OBJECT_ID('alumno2')
AND o.type IN ('PK', 'F', 'UQ', 'C', 'D')
ORDER BY o.type_desc;

-- Primary Key
ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY (num_alumno);

-- Crear una tabla para la foreign key
CREATE TABLE carrera (
    carrera_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_carrera
    PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
);

ALTER TABLE alumno2
ADD carrera_id INT;

ALTER TABLE alumno2
ADD CONSTRAINT fk_alumno2_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera (carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- Agregar check
ALTER TABLE alumno2
ADD CONSTRAINT ck_alumno2_telefono
CHECK (telefono LIKE '[0-9]*3-[0-9]*3-[0-9]*4');

--Agregar un Default

ALTER TABLE alumno2
ADD activo BIT NOT NULL;

ALTER TABLE alumno2
ADD CONSTRAINT df_alumno2_activo
DEFAULT 1
FOR activo;

-- Unique
ALTER TABLE alumno2
ADD CONSTRAINT uq_alumno2_matricula
UNIQUE (matricula);

-- Eliminar Restricciones

---- Eliminar FOreign Key
ALTER  TABLE alumno
DROP CONSTRAINT fk_alumno2_carrera;

---- Eliminar Primary key
ALTER TABLE alumno2
DROP CONSTRAINT pk_alumno2;


ALTER TABLE carrera
DROP CONSTRAINT pk_carrera;

-- ELiminar UNiques
ALTER TABLE alumno2
DROP CONSTRAINT uq_alumno2_matricula;

----- ELiminar check
ALTER TABLE alumno
DROP CONSTRAINT ck_alumno2_telefono;

----- ELiminar matgricula
ALTER TABLE alumno2
DROP COLUMN matricula;



---DROP 
-- Elimianr la tabla alumno2
DROP TABLE alumno2;

-- Eliminar mas de una tabla a la vez
DROP TABLE alumno, carrera;

-- Base de Datos
USE master;
IF DB_ID ('pruebaatributos') IS NOT NULL
BEGIN
    DROP DATABASE pruebaatributos;
END