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
3. Puede existit un profesor que actualmente no imparta cursos
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