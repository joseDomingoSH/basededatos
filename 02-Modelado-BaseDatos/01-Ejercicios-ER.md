# EJERCICIOS MODELO E-R

## Ejercicio 1. 
   
En un Hospital se registra información de sus pacientes. 
> De cada paciente se desea almacenar:

- Algo que lo identifique 
- Nombre
- Fecha de Nacimiento 

> De un Expediente médico se almacena:

- Número de Expediente
- Fecha de Apertura
- Tipo de Sangre

### Reglas del Negocio

1. Cada paciente debe tener exactamente un expediente médico
2. Cada Expediente pertenece a un único paciente
3. No puede existir ningun expediente médico sin paciente
4. No puede existir un paciente sin un expediente

### Resultado Modelo E-R
![Hospital](../img/E-R/Ejercicio1.jpg)

## Ejercicio 2.
Una universidad administra profesores y cursos.

>De cada profesor se almacena:

- Clave del profesor
- Nombre
- Especialidad

> De cada curso se alacena:

- Identificación del curso
- Nombre del curso
- Créditos

> Reglas del Negocio

1. Un profesor puede impartir varios cursos
2. Un curso solamente puede ser impartido por un profesor
3. Puede existir un profesor que actualmente no imparta cursos
4. Todo curso debe ser asignado a un profesor

Se debe de realizar lo siguiente:
- Entidades
- Identificar la relación: **IMPARTE**
- Determinar la **Cardinalidad**
- Determinar la **Participación**

### Resultado Modelo E-R
![Universidad](../img/E-R/Ejercicio2.jpg)

## Ejercicio 3.
Una escuela administra alumnos y materias.

> De cada alumno se almacena:
- Matricula
- nombre
- semestre

> De cada materia de almacena
- Clave
- Nombre
- Creditos

> Reglas del Negocio
1. Un alumno puede inscribirse en muchas materias
2. Una materia puede tener muchos alumnos inscritos
3. Puede existir una materia sin alumnos escritos
4. Todo alumno debe estar inscritio en almenos 1 materia
5. De cada inscripción debe almacenar:
    - Fecha de Inscripción
    - Calificacion final

### Resultado Modelado E-R
![Escuela](../img/E-R/Ejercicio3.jpg)

## Ejercicio 4.
Una empresa se encarga de realizar ventas de productos

> De cada cliente se almacena:

- Numero de cliente que lo identifique
- Y su nombre de cliente el cual es una personal moral
- RFC

> La empresa realiza pedidos en los cuales se almacena lo siguiente:

- Número del Pedido
- Fecha

> la empresa también almacena los productos de cuales registra lo siguiente:

- Numero de Producto
- nombre 
- precio

> Al realizar los pedidos deben registrar la cantidad de productos pedido y su precio

> Reglas del negocio
 1. Un cliente puede realizar muchos pedidos
 2. Cada pedido pertenece a un solo cliente
 3. Un pedido puede contener varios productos
 4. Un producto puede aparecer en pedido
 5. Un pedido debe contener al menos un producto
 6. Un producto no puede no haber sido vendido
 7. El detalle del pedido no existe sin pedido
 8. El detalle del pedido no existe sin producto
 9. El detalle almacena cantidad y precio de venta

 ### Resultado Modelo E-R

 ![Empresa](../img/E-R/Ejercicio4.jpg)

 ## Ejercicio 5

 1. La empresa está organizada en departamentos. Cada departamento tiene un nombre único, un número único y un empleado específico que lo administra. Registramos la fecha de inicio en la que ese empleado comenzó a administrar el departamento. Un departamento puede tener varias ubicaciones.

2. Un departamento controla varios proyectos, cada uno de los cuales tiene un nombre único, un número único y una sola ubicación.

3. Almacenamos el nombre, el número de Seguro Social, la dirección, el salario, el sexo (género) y la fecha de nacimiento de cada empleado. Un empleado está asignado a un departamento, pero puede trabajar en varios proyectos, que no necesariamente están controlados por el mismo departamento. Registramos la cantidad actual de horas por semana que un empleado trabaja en cada proyecto. También registramos al supervisor directo de cada empleado (que es otro empleado).

4. Queremos registrar a los dependientes de cada empleado para fines de seguro. Registramos el nombre, el sexo, la fecha de nacimiento y la relación de cada dependiente con el empleado

### Resultado Modelo E-R
  ![Company](../img/E-R/Ejercicio5.jpg)