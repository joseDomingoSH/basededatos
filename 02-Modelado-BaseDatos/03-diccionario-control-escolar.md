# Diccionario de Datos de la Base de Datos Control Escolar

1. Informacion General

| Elemento | Valor |
| :--- | :--- |
|Proyecto|Control Escolar|
|Version|1.0|
|Fecha|Junio 2026|
|Elaboro|Jose Doimingo Sarabia Hernandez|
|SGBD|SQLServer|

2. Descripcion del Sistema de Base de Datos

El sistema administra
- Carrera
- Alumnos
- Profesores
- Materias
- Grupos
- Inscripciones


Permite controlar la oferta academica y la inscripcion de estudiantes

3. Catalogo de restricciones utilizadas

| Codigo | Significado |
| :--- | :--- |
|PK|PRIMARY KEY|
|FK|FOREIGN KEY|
|NN|NOT NULL|
|UQ|UNIQUE|
|AI|AUTO INCREMENT|
|CK|CHECK|
|DF|DEFAULT|

4. Diccionario de Datos

## Tabla: Carrera

**Descripcion**
Almacena las carrera ofertadas por la universidad

|Campo|Tipo|Longiud|Restricciones|Descripcion|
|:---|:---|:---|:---|:---|
|id_carrera|int|-|PK, AI, NN|Identificador Unico de la carrera|
|nombre|VARCHAR|100|UQ, NN|Nombre de la carrera|
|duracion_cuatrimestre|int|-|NN, CK(>0)|Es la duración del cuatrimestre en curso|
--
## Tabla: Alumno
// Inv los tipos de datos de SQLserver, mysql o mariaDB, postgresql
**Descripcion**
Almacena Información de los estudiantes

| Campo | Tipo | Longiud | Restricciones | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK, AI, NN | Identificador Unico del alumno |
| nombre_alumno | VARCHAR| 30 | NN | Nombre del alumno |
| matricula | VARCHAR | 10 | UQ, NN | Matricula Institucional |
| apellido_paterno | VARCHAR | 50 | NN | Apellido Paterno |
| apellido_materno | VARCHAR | 50 | NULL | Apellido Materno |
| correo | VARCHAR | 100 | NN | Correo Institucional |
| fecha_nacimiento | DATE | - | NN | Fecha de Nacimiento |
| id_carrera | INT | - | FK, NN | Carrera a la que pertenece |

--

5. Relaciones de la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos |
| Carrera -> Materia | 1:N | Una carrera tiene muchas materias |
| Profesor -> Grupo | 1:N | Un profesor puede impartir varios grupos |
| Materia -> Grupo | 1:N | Una carrera tiene muchos alumnos |
| Alumno -> Inscripción | 1:N | Un alumno tiene muchas inscripciones |
| Carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos |

--

6. MAtriz de Claves Foraneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Alumno | id_carrera | Carrera (id_carrera) |
| Materia | id_carrera | Carrera (id_carrera) |
| Grupo | id_profesor | Profesor (id_profesor) |
| Grupo | id_materia | Materia (id_materia) |
| Inscripcion | id_alumno | Alumno (id_alumno) |
| Inscripcion | id_grupo | Grupo (id_grupo) |

--

7. Integridad referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |
| IR-04 | No se puede inscribir un alumno en un gripo inexistente |
| IR-05 | No se puede eliminar una carrera que tenfa alumnos asociados sin antes reasignarlos o eliminarlos |


--


8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno pertenece a una sola carrera |
| RN-02 | Una carrera puede tener muchos alumnos |
| RN-03 | una carrera puede tener mucahas materias |
| RN-04 | Un profesor puede impartir en mcugos grupos |
| RN-05 | UN grupo solo puede tener un profesor asignado |
| RN-06 | La calificación debe estar entre 0.0 y 10.0|

9. DIagrama Relacional