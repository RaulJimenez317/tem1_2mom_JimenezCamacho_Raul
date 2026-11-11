# Diccionario de datos — Sample Superstore

## Información general

* Dataset: Sample Superstore
* Fuente: Kaggle
* Total de campos esperados: 21
* Separador: coma (,)
* Codificación: pendiente de verificar
* Formato de fechas original: M/d/yyyy

## Diccionario

| Campo original | Tipo Hive     | Descripción                | Restricciones                         |
| -------------- | ------------- | -------------------------- | ------------------------------------- |
| Row ID         | INT           | Identificador de fila      | No nulo, único                        |
| Order ID       | STRING        | Código de orden            | No nulo                               |
| Order Date     | DATE          | Fecha del pedido           | Fecha válida                          |
| Ship Date      | DATE          | Fecha de envío             | Igual o posterior al pedido           |
| Ship Mode      | STRING        | Modalidad de envío         | Valor categórico                      |
| Customer ID    | STRING        | Identificador del cliente  | No nulo                               |
| Customer Name  | STRING        | Nombre del cliente         | Texto                                 |
| Segment        | STRING        | Segmento del cliente       | Valor categórico                      |
| Country        | STRING        | País                       | Texto                                 |
| City           | STRING        | Ciudad                     | Texto                                 |
| State          | STRING        | Estado                     | Texto                                 |
| Postal Code    | STRING        | Código postal              | Texto, puede contener ceros iniciales |
| Region         | STRING        | Región comercial           | Valor categórico                      |
| Product ID     | STRING        | Identificador del producto | No nulo                               |
| Category       | STRING        | Categoría del producto     | Valor categórico                      |
| Sub-Category   | STRING        | Subcategoría del producto  | Valor categórico                      |
| Product Name   | STRING        | Nombre del producto        | Texto, puede contener comas           |
| Sales          | DECIMAL(12,2) | Importe de ventas          | Valor numérico                        |
| Quantity       | INT           | Cantidad de productos      | Entero                                |
| Discount       | DECIMAL(5,2)  | Descuento aplicado         | Entre 0 y 1                           |
| Profit         | DECIMAL(12,4) | Ganancia o pérdida         | Valor numérico                        |

## Consideraciones de modelado

1. Se utiliza STRING para identificadores porque no representan cantidades.
2. Postal Code se almacena como STRING para conservar ceros iniciales.
3. Las fechas se convierten a DATE durante la transformación.
4. Sales y Profit utilizan DECIMAL para evitar errores de precisión propios de los números de punto flotante.
5. Discount se almacena como decimal porque representa una proporción.
6. Se utilizará una tabla de entrada CSV y una tabla analítica tipada.

## Estrategia de almacenamiento

Se utilizarán dos niveles:

* Tabla staging: conserva los valores originales del CSV como cadenas.
* Tabla analítica: contiene los datos convertidos a sus tipos Hive correspondientes.

La separación permite auditar los datos originales y controlar las transformaciones antes del análisis.
