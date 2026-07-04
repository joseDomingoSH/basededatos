# Diccionario de Datos de la BD Universidad

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
|Proyecto|Universidad|
|Version|1.0|
|Fecha|Junio 2026|
|Elaboro|Jose Domingo Sarabia Hernandez|
|SGBD|SQLServer|

## 2. Descripción del Sistema de Base de Datos

El sistema administra
- Pofesores
- Especialidades
- Cursos

El sistema controla la asignación de profesores de una institución, detallando sus respectivas especialidades y los cursos de los cuales son titulares.

## 3. Catalogo de restricciones utilizadas

| Codigo | Significado |
| :--- | :--- |
|PK|PRIMARY KEY|
|FK|FOREIGN KEY|
|NN|NOT NULL|
|UQ|UNIQUE|
|AI|AUTO INCREMENT|
|CK|CHECK|
|DF|DEFAULT|

## 4. Diccionario de Datos
## Tabla: Profesor
**Descripción:** Maestros vigentes en la institución académica.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_profesor | INT | - | PK, AI, NN | ID único del docente. |
| nombre | VARCHAR | 60 | NN | Nombre(s) de pila. |
| apellido_paterno | VARCHAR | 50 | NN | primer apellido. |
| apellido_materno | VARCHAR | 50 | NULL | Segundo apellido. |

## Tabla: Especialidad
**Descripción:** Especialidades o postgrados que ostentan los profesores (Relación 1:N).

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_especialidad | INT | - | PK, AI, NN | Identificador único de la especialidad. |
| id_profesor | INT | - | FK, NN | ID del profesor al que pertenece la especialidad. |
| nombre_especialidad| VARCHAR | 120 | NN | Nombre oficial de la especialidad médica o académica. |

## Tabla: Curso
**Descripción:** Cursos ofertados asociados a un profesor responsable de su impartición.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_curso | INT | - | PK, AI, NN | Identificador único del curso. |
| nombre_curso | VARCHAR | 100 | NN, UQ | Nombre del curso (Único para evitar duplicados). |
| creditos | TINYINT | - | NN, CK(>0) | Valor en créditos de la materia (Mayor a cero). |
| id_profesor | INT | - | FK, NN | Profesor asignado al curso. |

## 5. Relaciones de la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Profesor -> Especialidad | 1:N | Un profesor puede registrar una o más especialidades. |
| Profesor -> Curso | 1:N | Un profesor puede impartir de cero a múltiples cursos. |

--

## 6. Matriz de Claves Foraneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Especialidad | id_profesor | Profesor (id_profesor) |
| Curso | id_profesor | Profesor (id_profesor) |

## 7. Integridad referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar una especialidad ligada a un número de profesor inexistente. |
| IR-02 | No se puede dar de alta un curso si el profesor asignado no se encuentra en el catálogo. |


## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un profesor puede impartir varios cursos |
| RN-02 | Un curso solamente puede ser impartido por un profesor |
| RN-03 | Puede existir un profesor que actualmente no imparta cursos |
| RN-04 | Todo curso debe ser asignado a un profesor |

## 9. Diagrama Relacional

![Hospital](../img/Relacional/Ejer2.jpg)