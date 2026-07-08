# Construcción de Base de Datos con SQL-LDD

SQL (Structure Query Lenguage) se divide en 5 grandes categorias:

1. **DDL (Data Definition Lenguage)**
2. **DML (Data Manipulation Lenguage)**
3. **DQL (Data Query Lenguage)**
4. DCL (Data Control Lenguage)
5. TCL (Transaction Control Lenguage)

## SQL - DDL
**Lenguage de Difinicón de Datos**
Se utiliza para **crear y modificar la estructura** de una base de datos.

Con DDL trabajamos sobre los objetos de la base de datos:

- Base de datos
- Tablas
- Vistas
- Indices
- Restricciones
- Esquemas
- Stores Procedures
- Trigger
- Fucntions

**Comandos principales**

| Comando | Función |
| :--- | :--- |
| CREATE | Crear Objetos |
| ALTER | Modificar Objetos |
| DROP | Eliminar Objetos |
| TRUNCATE | Vacia una Tabla |

## SQL-DML

**Lenguage de Manipulación de Datos**

Sirve para **trabajar con la informacion almacenada**

Aquí no cambia la estructura, si no los registros

**Comandos Principales**

| Comando | Función |
| :--- | :--- |
| INSERT | Inserta Registros |
| UPDATE | Actualizar Registros |
| DELETE | Eliminar Registros |

## SQL-DQL

**Lenguage de Consulta de Datos**

Su función principal es **consultar información**

**Comando Principal**

| Comando | Función |
| :--- | :--- |
| SELECT | Consulta Información |

Generalmente de combina con

- WHERE
- ORDER BY
- GROUP
- HAVING
- JOIN (LEFT, RIGHT, INNER, CROSS Y FULL)
- DISTICT
- TOP / LIMIT
- Funciones de Agregado (SUM, AVG, MAX, MIN, COUNT)
- Funciones de Ventana (window function)

## Nomenclatura snake_case

**snake_case** es la conveción más recomendada el día de ahora sí se busca una nomenclatura moderna, portable y alineada con buenas practicas en distintos motores de base datos.

La razón es que funciona de forma consistente en **SQLServer, Mysql** y especialemte en **PostgreSQL**. Con `snake_case` se evitan problemas de mayusculas y se hacen las consultassean más legibles.

**Estandar de Construcción:**

| Objeto | Convención | Ejemplo |
| :--- | :--- | :--- |
| Base de Datos| snake_case | control_escola | 
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | Singular en snake_case | cliente, pedido, detalle_pedido |
| Columna | snake_case | cliente_id, fecha_registro, nombre, correo_electronico |
| PK | <tabla>_id | cliente_id, categoria_id |
| FK | Igual que la PK referenciada | cliente_id, producto_id |
| Tabla Puente | <tabla1>_<tabla2> | alumno_curso, proveedor_producto |

**Nombrar las Restricciones**

- pk_cliente
- fk_pedido_cliente -> pk_tablaorigen_tablareferenciada
- uq_cliente_correro_electronico
- ck_producto_precio
- df_cliente_activo