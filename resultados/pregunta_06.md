# Pregunta 6. Análisis del impacto de los descuentos

## 1. Objetivo

Analizar la relación entre los descuentos comerciales aplicados y la rentabilidad de las ventas, identificando los rangos de descuento que generan mayores pérdidas y las categorías de productos más afectadas.

## 2. Estrategia de solución

Se clasificaron los registros del dataset en cuatro rangos de descuento: sin descuento, descuento bajo, descuento medio y descuento alto.

Posteriormente, se calcularon las ventas, ganancias, márgenes de rentabilidad y descuentos promedio para cada grupo.

También se identificó la cantidad de operaciones con pérdidas y su porcentaje respecto al total de registros de cada rango.

Finalmente, se analizaron las categorías y subcategorías afectadas por descuentos superiores al 50%.

## 3. Técnicas utilizadas

* `CASE WHEN`: clasificar los descuentos por rangos.
* `COUNT()`: contar los registros.
* `SUM()`: calcular ventas y ganancias acumuladas.
* `AVG()`: calcular el descuento promedio.
* `ROUND()`: redondear los resultados.
* `GROUP BY`: agrupar por rangos y categorías.
* `ORDER BY`: ordenar los resultados.
* `LIMIT`: limitar los resultados mostrados.

## 4. Resultados obtenidos

### 4.1. Resultados por rango de descuento

| Rango de descuento | Registros |       Ventas |  Ganancias |   Margen |
| ------------------ | --------: | -----------: | ---------: | -------: |
| Sin descuento      |     4.798 | 1.087.908,47 | 320.987,60 |   29,51% |
| Bajo               |     3.803 |   846.522,17 | 100.785,47 |   11,91% |
| Medio              |       537 |   298.541,67 | -58.817,00 |  -19,70% |
| Alto               |       856 |    64.228,76 | -76.559,05 | -119,20% |

### 4.2. Operaciones no rentables

| Rango de descuento | Registros | Con pérdidas | No rentables |
| ------------------ | --------: | -----------: | -----------: |
| Descuento alto     |       856 |          856 |      100,00% |
| Descuento medio    |       537 |          492 |       91,62% |
| Descuento bajo     |     3.803 |          523 |       13,75% |
| Sin descuento      |     4.798 |            0 |        0,00% |

### 4.3. Categorías y subcategorías más afectadas

| Categoría       | Subcategoría | Registros |  Ganancias | Con pérdidas |
| --------------- | ------------ | --------: | ---------: | -----------: |
| Office Supplies | Binders      |       613 | -38.510,50 |          613 |
| Furniture       | Furnishings  |       138 |  -5.944,66 |          138 |
| Office Supplies | Appliances   |        67 |  -8.629,64 |           67 |
| Technology      | Machines     |        23 | -19.579,32 |           23 |
| Furniture       | Bookcases    |        15 |  -3.894,94 |           15 |

## 5. Interpretación técnica

Los resultados muestran una relación importante entre los descuentos elevados y la disminución de la rentabilidad.

Las operaciones sin descuento presentan el mejor resultado, con un margen de rentabilidad del 29,51% y ninguna operación con pérdidas.

En los descuentos bajos, el margen disminuye al 11,91%, aunque todavía se mantiene positivo.

Por otro lado, los descuentos medios generan un margen negativo del -19,70%, mientras que los descuentos altos presentan el peor resultado, con un margen del -119,20%.

Un dato especialmente importante es que el 100% de las operaciones con descuentos superiores al 50% registraron pérdidas.

En cuanto a las categorías, Binders es la subcategoría más afectada, con 613 operaciones no rentables y pérdidas acumuladas de 38.510,50.

También destacan Machines y Furnishings por sus resultados negativos.

## 6. Conclusión

El análisis permitió comprobar que los descuentos elevados están asociados con una mayor proporción de operaciones no rentables en el dataset.

Los descuentos superiores al 50% presentan el peor comportamiento económico, ya que todas las operaciones de este grupo registraron pérdidas.

Se recomienda revisar las políticas de descuentos comerciales, especialmente en las subcategorías Binders, Machines y Furnishings, para evitar que las promociones reduzcan excesivamente los márgenes de ganancia.

La utilización de HiveQL permitió analizar los descuentos mediante agrupaciones, expresiones condicionales y funciones de agregación, obteniendo información útil para la toma de decisiones comerciales.


