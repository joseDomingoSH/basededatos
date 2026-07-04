# Diccionario de Datos de la BD Escuela

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
|Proyecto|Escuela|
|Version|1.0|
|Fecha|Junio 2026|
|Elaboro|Jose Domingo Sarabia Hernandez|
|SGBD|SQLServer|

## 2. Descripción del Sistema de Base de Datos

El sistema administra
- Alumnos
- Materias


El sistema administra el catálogo de estudiantes, las materias del plan de estudios escolar y el proceso de inscripción donde se capturan las calificaciones obtenidas.

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
## Tabla: Alumno
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK, AI, NN | Identificador del alumno |
| matricula | VARCHAR | 15 | UQ, NN | Matrícula del estudiante |
| nombre | VARCHAR | 50 | NN | Nombre del alumno |
| apellido1 | VARCHAR | 50 | NN | Primer apellido |
| apellido2 | VARCHAR | 50 | NULL | Segundo apellido |
| semestre | INT | - | NN | Semestre actual |

## Tabla: Materia
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_materia | INT | - | PK, AI, NN | Identificador de la materia |
| nombre | VARCHAR | 100 | NN | Nombre de la asignatura |
| creditos | INT | - | NN | Créditos otorgados |

## Tabla: Inscribe
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_alumno | INT | - | PK, FK, NN | Clave compuesta y foránea a Alumno |
| num_materia | INT | - | PK, FK, NN | Clave compuesta y foránea a Materia |
| fecha_inicio | DATE | - | NN | Fecha de inscripción |
| calif_final | DECIMAL | 4,2 | NULL | Calificación obtenida |

## 5. Relaciones de la Base de Datos
| Entidad Origen | Entidad Destino | Cardinalidad | Descripción |
| :--- | :--- | :--- | :--- |
| Alumno | Inscribe | 1:N | Un alumno realiza muchas inscripciones a materias. |
| Materia | Inscribe | 1:N | Una materia es inscrita por muchos estudiantes. |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Inscribe | id_alumno | Alumno (id_alumno) |
| Inscribe | num_materia | Materia (num_materia) |

## 7. Integridad referencial
| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un proceso de inscripción si el ID del alumno no existe. |
| IR-02 | No se puede añadir una materia a la hoja de inscripción si su número no está de alta en el catálogo. |


## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede inscribirse en muchas materias |
| RN-02 | Una materia puede tener muchos alumnos inscritos
| RN-03 | Puede existir una materia sin alumnos escritos |
| RN-04 | Todo alumno debe estar inscritio en almenos 1 materia |
| RN-05 | De cada inscripción debe almacenar: Fecha de Inscripción y Calificacion final |

## 9. Diagrama Relacional

![Escuela](../img/Relacional/Ejer3.jpg)