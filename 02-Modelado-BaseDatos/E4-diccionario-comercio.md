# Diccionario de Datos de la BD Comercio

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
|Proyecto|Comercio|
|Version|1.0|
|Fecha|Julio 2026|
|Elaboro|Jose Domingo Sarabia Hernandez|
|SGBD|SQLServer|

## 2. Descripción del Sistema de Base de Datos

El sistema administra
- Clientes
- Pedidos
- Productos


Este sistema controla el proceso comercial básico: captura de información del cliente empresarial, la generación de pedidos y los productos que se asocian.

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
## Tabla: Cliente
**Descripción:** Entidades comerciales o personas físicas que realizan compras.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_cliente | INT | - | PK, AI, NN | Identificador del cliente. |
| rfc | VARCHAR | 13 | UQ, NN | Registro Federal de Contribuyentes (México). |
| razon_social | VARCHAR | 150 | NN | Nombre legal de la empresa o cliente. |

## Tabla: Pedido
**Descripción:** Encabezado del pedido de compra.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_pedido | INT | - | PK, AI, NN | Número correlativo del pedido de venta. |
| fecha_pedido | DATETIME | - | NN, DF(GETDATE()) | Marca de tiempo exacta del pedido. |
| id_cliente | INT | - | FK, NN | Enlace al cliente comprador. |

## Tabla: Producto
**Descripción:** Catálogo general de artículos disponibles para la venta.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_producto | INT | - | PK, AI, NN | Código de barras interno del producto. |
| nombre_producto | VARCHAR | 100 | NN, UQ | Nombre descriptivo del producto comercial. |

## Tabla: Detalle_Pedido (Contiene)
**Descripción:** Tabla de relación N:N que detalla los artículos incluidos en cada pedido.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| id_pedido | INT | - | PK, FK, NN | Referencia al encabezado del pedido. |
| id_producto | INT | - | PK, FK, NN | Referencia al artículo solicitado. |
| cantidad_solicitada| INT | - | NN, CK(>0), DF(1) | Cantidad física de unidades del producto añadidas. |

## 5. Relaciones de la Base de Datos


| Entidad Origen | Entidad Destino | Cardinalidad | Descripción |
| :--- | :--- | :--- | :--- |
| Cliente | Pedido | 1:N | Un cliente puede efectuar múltiples pedidos de compra. |
| Pedido | Contiene | 1:N | Un pedido desglosa múltiples productos. |
| Producto | Contiene | 1:N | Un producto puede aparecer en distintas órdenes. |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Pedido | id_cliente | Cliente (id_cliente) |
| Contiene | num_pedido | Pedido (num_pedido) |
| Contiene | num_producto | Producto (num_producto) |

## 7. Integridad referencial
| Código | Regla |
| :--- | :--- |
| IR-01 | Un pedido no puede ser procesado si el código de cliente es inválido o no existe en la base. |
| IR-02 | La tabla 'Contiene' no admitirá relaciones de productos o pedidos inexistentes. |

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar muchos pedidos|
| RN-02 | Cada pedido pertenece a un solo cliente|
| RN-03 | Un pedido puede contener varios productos|
| RN-04 | Un producto puede aparecer en pedido|
| RN-05 | Un pedido debe contener al menos un producto|
| RN-06 | Un producto no puede no haber sido vendido|
| RN-07 | El detalle del pedido no existe sin pedido|
| RN-08 | El detalle del pedido no existe sin producto|
| RN-09 | El detalle almacena cantidad y precio de venta|

## 9. Diagrama Relacional

![Comercio](../img/Relacional/Ejer4.jpg)