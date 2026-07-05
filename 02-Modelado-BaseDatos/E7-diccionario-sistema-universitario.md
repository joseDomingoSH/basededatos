# Diccionario de Datos de la BD Sistema Universitario

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
|Proyecto|Sistema Universitario|
|Version|1.0|
|Fecha|Julio 2026|
|Elaboro|Jose Domingo Sarabia Hernandez|
|SGBD|SQLServer|

## 2. Descripción del Sistema de Base de Datos

El sistema administra
- Alumnos
- Credenciales
- Materias
- Profesores
- Dependientes
- Departamentos
- Proyectos

Es la infraestructura académica, de personal y de investigación de la universidad, controlando la matrícula de alumnos, credenciales, números de teléfono, la carga docente de profesores con sus dependientes, departamentos, asignaturas cursadas y participación en proyectos institucionales.

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

### Tabla: Alumno
**Descripción:** Almacena los datos personales del alumnado matriculado en la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | VARCHAR | 15 | PK, NN | Matrícula única del alumno |
| nombre_p | VARCHAR | 50 | NN | Nombre propio |
| apellido1 | VARCHAR | 50 | NN | Primer apellido |
| apellido2 | VARCHAR | 50 | NULL | Segundo apellido |
| correo | VARCHAR | 100 | NN | Correo electrónico |
| fecha_naci | DATE | - | NN | Fecha de nacimiento |
| num_credencial| VARCHAR | 20 | FK, NULL | Vínculo a la credencial del alumno |

### Tabla: Credencial
**Descripción:** Documentación y token físico de identidad emitido para acceso a instalaciones.
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_credencial| VARCHAR | 20 | PK, NN | Número de credencial físico |
| fecha_inscripcion| DATE | - | NN | Fecha de expedición |
| vigencia | DATE | - | NN | Fecha de vencimiento |
| matricula | VARCHAR | 15 | FK, NN | Matrícula del alumno propietario |

### Tabla: Telefono
**Descripción:** Registro multidireccional de números telefónicos de contacto de los estudiantes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| telefono_id | INT | - | PK, NN | Identificador del registro telefónico |
| telefono | VARCHAR | 15 | NN | Número telefónico |
| matricula | VARCHAR | 15 | FK, NN | Alumno al que pertenece el teléfono |

### Tabla: Cursa
**Descripción:** Entidad intermedia que audita la carga de materias por alumno y sus notas académicas.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | VARCHAR | 15 | PK, FK, NN | Matrícula del estudiante |
| clave_materia | VARCHAR | 10 | PK, FK, NN | Código de la asignatura |
| fecha_inscripcion| DATE | - | NN | Fecha de alta en la materia |
| calif_final | DECIMAL | 4,2 | NULL | Calificación final asignada |

### Tabla: Materia
**Descripción:** Catálogo de unidades de aprendizaje que integran el mapa curricular escolar.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| clave_materia | VARCHAR | 10 | PK, NN | Código único de la asignatura |
| nombre_materia| VARCHAR | 100 | NN | Nombre oficial de la materia |
| crediros | INT | - | NN | Créditos académicos (error de origen en diagrama) |
| num_prof | INT | - | FK, NN | Profesor asignado a impartirla |

### Tabla: 

**Descripción:** Plantilla de investigadores y docentes adscritos a la nómina de la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_prof | INT | - | PK, NN | Número de nómina del docente |
| nombre_p | VARCHAR | 50 | NN | Nombre del profesor |
| apellido1 | VARCHAR | 50 | NN | Primer apellido |
| apellido2 | VARCHAR | 50 | NULL | Segundo apellido |
| num_depto | INT | - | FK, NN | Departamento al que pertenece |

### Tabla: Dependiente

**Descripción:** Entidad débil que registra las extensiones de seguridad médica y prestaciones de los familiares de profesores.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| nombre | VARCHAR | 100 | PK, NN | Nombre del dependiente familiar |
| num_prof | INT | - | PK, FK, NN | Profesor del cual es dependiente |
| fecha_naci | DATE | - | NN | Fecha de nacimiento |
| parentesco | VARCHAR | 30 | NN | Relación familiar (hijo, cónyuge, etc.) |

### Tabla: Departamento

**Descripción:** Unidades administrativas y de investigación organizadas por facultades.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_depto | INT | - | PK, NN | Número único de departamento |
| nombre_depto | VARCHAR | 50 | NN | Nombre del departamento académico |
| edificio | VARCHAR | 30 | NULL | Ubicación física |

### Tabla: Proyecto

**Descripción:** Proyectos de investigación científica financiados por la institución o entes externos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_proy | INT | - | PK, NN | Número único de proyecto |
| nombre_proy | VARCHAR | 100 | NN | Nombre de la investigación |
| presupuesto | DECIMAL | 12,2 | NN | Presupuesto total asignado |

### Tabla: Participa

**Descripción:** Tabla de relación N:N que gestiona las asignaciones temporales de docentes a células de investigación científica.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| num_prof | INT | - | PK, FK, NN | Profesor participante |
| num_proy | INT | - | PK, FK, NN | Proyecto asignado |
| rol | VARCHAR | 50 | NN | Función dentro del proyecto |
| fecha_inicio | DATE | - | NN | Fecha de ingreso al proyecto |

## 5. Relaciones de la Base de Datos
| Entidad Origen | Entidad Destino | Cardinalidad | Descripción |
| :--- | :--- | :--- | :--- |
| Alumno | Credencial | 1:1 | Un alumno posee una credencial única de identidad. |
| Alumno | Telefono | 1:N | Un estudiante puede registrar varios teléfonos de contacto. |
| Alumno | Cursa | 1:N | Un alumno puede cursar múltiples materias en el ciclo. |
| Materia | Cursa | 1:N | Una materia es cursada por muchos alumnos. |
| Profesor | Materia | 1:N | Un profesor puede impartir varias materias. |
| Profesor | Dependiente | 1:N | Un profesor puede dar de alta a varios familiares directos. |
| Departamento | Profesor | 1:N | Un departamento coordina a varios profesores adjuntos. |
| Profesor | Participa | 1:N | Un profesor puede colaborar en diversos proyectos de investigación. |
| Proyecto | Participa | 1:N | Un proyecto cuenta con múltiples profesores participantes. |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Alumno | num_credencial | Credencial (num_credencial) |
| Credencial | matricula | Alumno (matricula) |
| Telefono | matricula | Alumno (matricula) |
| Cursa | matricula | Alumno (matricula) |
| Cursa | clave_materia | Materia (clave_materia) |
| Materia | num_prof | Profesor (num_prof) |
| Profesor | num_depto | Departamento (num_depto) |
| Dependiente | num_prof | Profesor (num_prof) |
| Participa | num_prof | Profesor (num_prof) |
| Participa | num_proy | Proyecto (num_proy) |

## 7. Integridad referencial
| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un teléfono si la matrícula del alumno no existe. |
| IR-02 | No se puede inscribir a un alumno en una materia inexistente a través de la tabla 'Cursa'. |
| IR-03 | Un profesor no puede ser asignado a un departamento que no esté dado de alta. |
| IR-04 | Al eliminar un proyecto de la base de datos, se deben eliminar todas las participaciones en 'Participa'. |
| IR-05 | No se permiten dependientes vinculados a un código de profesor inválido. |

## 8. Reglas del Negocio
| Código | Rule |
| :--- | :--- |
| RN-01 | Todo alumno regular debe estar asociado invariablemente a un número de credencial institucional vigente. |
| RN-02 | El presupuesto asignado a un proyecto de investigación no puede ser menor o igual a cero. |

## 9. Diagrama Relacional

![Sistema_universitario](../img/Relacional/Ejer7.jpg)