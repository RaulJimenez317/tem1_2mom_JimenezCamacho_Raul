# Dataset — Sample Superstore

## 1. Información general

El proyecto utiliza el conjunto de datos **Sample Superstore**, obtenido desde Kaggle.

* **Fuente:** Kaggle.
* **Dataset:** Sample Superstore Dataset.
* **Archivo:** `Sample - Superstore.csv`.
* **Formato:** CSV.
* **Cantidad de campos:** 21.
* **Separador:** coma (`,`).
* **Formato original de fechas:** `M/d/yyyy`.
* **Codificación:** UTF-8 (pendiente de verificación).

## 2. Fuente de descarga

El dataset puede descargarse desde el siguiente enlace:

https://www.kaggle.com/datasets/vivek468/superstore-dataset-final

## 3. Descripción

El conjunto de datos contiene información comercial relacionada con pedidos, clientes, productos, regiones, ventas, descuentos y ganancias.

Permite desarrollar análisis de:

* Evolución de ventas y ganancias.
* Comportamiento de clientes.
* Rentabilidad de productos.
* Impacto de descuentos.
* Tendencias temporales.
* Concentración de ventas mediante análisis Pareto.

## 4. Estructura del archivo

El CSV contiene los siguientes campos:

1. Row ID
2. Order ID
3. Order Date
4. Ship Date
5. Ship Mode
6. Customer ID
7. Customer Name
8. Segment
9. Country
10. City
11. State
12. Postal Code
13. Region
14. Product ID
15. Category
16. Sub-Category
17. Product Name
18. Sales
19. Quantity
20. Discount
21. Profit

Para consultar los tipos de datos y restricciones de cada campo, revisar el archivo `../diccionario/diccionario_datos.md`.

## 5. Uso dentro del proyecto

El archivo CSV constituye la fuente original de información.

Su procesamiento se realiza mediante Apache Hive, siguiendo estas etapas:

1. Identificación de la estructura original.
2. Carga del archivo en la tabla staging.
3. Transformación de los campos a sus tipos de datos correspondientes.
4. Almacenamiento en la tabla analítica.
5. Ejecución de consultas de calidad y análisis comercial.

## 6. Consideraciones

* Se conserva el archivo original para mantener la trazabilidad de los datos.
* Los identificadores se manejan como cadenas cuando corresponde.
* Las fechas se transforman al formato DATE de Hive.
* Los importes económicos se manejan mediante tipos DECIMAL.
* Los valores inconsistentes deben identificarse antes de realizar los análisis.
