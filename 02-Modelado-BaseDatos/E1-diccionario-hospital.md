# Diccionario de Datos de la BD Hospital

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
|Proyecto|Hospital|
|Version|1.0|
|Fecha|Junio 2026|
|Elaboro|Jose Domingo Sarabia Hernandez|
|SGBD|SQLServer|

## 2. Descripción del Sistema de Base de Datos

El sistema administra
- Pacientes
- Expedientes de Pacientes


Permite controlar a los pacientes y sus expedientes respectivos

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
### Tabla: Paciente
**Descripción:** Almacena la información de identificación y datos personales de los pacientes de la clínica.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_paciente | INT | - | PK, AI, NN | Clave primaria autoincremental del paciente. |
| nombre | VARCHAR | 50 | NN | Nombre o nombres del paciente. |
| apellido_paterno | VARCHAR | 50 | NN | Primer apellido del paciente. |
| apellido_materno | VARCHAR | 50 | NULL | Segundo apellido del paciente (opcional). |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento para cálculo de edad. |

### Tabla: Expediente
**Descripción:** Registro del expediente clínico básico vinculado de forma exclusiva a un paciente (Relación 1:1).

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_expediente | INT | - | PK, AI, NN | Clave primaria del expediente clínico. |
| fecha_apertura | DATETIME | - | NN, DF(GETDATE()) | Fecha y hora de creación del expediente. |
| tipo_sangre | VARCHAR | 5 | NN, CK | Factor RH y grupo sanguíneo (e.g., 'O+', 'AB-'). |
| id_paciente | INT | - | FK, NN, UQ | Enlace al paciente. Restricción UNIQUE para asegurar relación 1:1. |

## 5. Relaciones de la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Paciente -> Expediente | 1:1 | Un paciente tine un único expediente |

--

## 6. Matriz de Claves Foraneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente | IdPaciente | Paciente (Idpaciente) |

--

## 7. Integridad referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede crear un expediente clínico si el identificador del paciente no existe previamente. |
| IR-02 | Al eliminar un paciente del sistema, su expediente médico asociado debe ser borrado obligatoriamente. |


## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Cada paciente debe tener exactamente un expediente médico |
| RN-02 | Cada Expediente pertenece a un único paciente |
| RN-03 | No puede existir ningun expediente médico sin paciente |
| RN-04 | No puede existir un paciente sin un expediente |

## 9. Diagrama Relacional

![Hospital](../img/Relacional/Ejer1.jpg)