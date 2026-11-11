# Pregunta 5. Ranking de productos según rentabilidad

## 1. Objetivo

Identificar los productos con mejor y peor desempeño económico dentro del dataset Sample Superstore, considerando las ganancias acumuladas, el volumen de ventas, los márgenes de rentabilidad y la posición de cada producto dentro de su categoría.

## 2. Estrategia de solución

Se utilizaron consultas de agregación para calcular las ventas, ganancias y unidades vendidas por producto.

Posteriormente, se implementaron funciones de ventana para establecer rankings de rentabilidad dentro de cada categoría y calcular las ganancias acumuladas.

Finalmente, se identificaron los productos con mayores ventas y aquellos que presentan pérdidas económicas.

## 3. Técnicas utilizadas

* `SUM()`: calcular ventas, ganancias y unidades acumuladas.
* `ROUND()`: redondear los resultados.
* `GROUP BY`: agrupar los registros por producto y categoría.
* `WITH`: construir consultas mediante CTE.
* `ROW_NUMBER()`: establecer posiciones individuales.
* `RANK()`: calcular posiciones dentro de cada categoría.
* `DENSE_RANK()`: generar rankings sin saltos.
* `SUM() OVER()`: calcular ganancias acumuladas.
* `PARTITION BY`: separar los rankings por categoría.
* `ORDER BY`: ordenar los resultados según el desempeño económico.

## 4. Resultados obtenidos

### 4.1. Cinco productos más rentables por categoría

Se identificaron los cinco productos con mayores ganancias en cada categoría.

Los primeros lugares fueron:

| Categoría       | Producto                                      | Ganancias | Margen |
| --------------- | --------------------------------------------- | --------: | -----: |
| Furniture       | Hon Deluxe Fabric Upholstered Stacking Chairs |   1927.44 | 18.12% |
| Office Supplies | Fellowes PB500 Electric Punch                 |   7753.04 | 28.24% |
| Technology      | Canon imageCLASS 2200 Advanced Copier         |  25199.93 | 40.91% |

### 4.2. Productos con mayor volumen de ventas

| Producto                   | Unidades vendidas |  Ventas |
| -------------------------- | ----------------: | ------: |
| Staples                    |               215 |  755.47 |
| Staple envelope            |               170 | 1686.79 |
| Easy-staple paper          |               150 | 2504.18 |
| Staples in misc. colors    |                86 |  478.82 |
| KI Adjustable-Height Table |                74 | 4552.62 |

### 4.3. Productos con menores ganancias

| Producto                                             | Ganancias |  Margen |
| ---------------------------------------------------- | --------: | ------: |
| Cubify CubeX 3D Printer Double Head Print            |  -8879.97 | -80.00% |
| Lexmark MX611dhe Monochrome Laser Printer            |  -4589.97 | -27.27% |
| Cubify CubeX 3D Printer Triple Head Print            |  -3839.99 | -48.00% |
| Chromcraft Bull-Nose Wood Oval Conference Tables     |  -2876.12 | -29.00% |
| Bush Advantage Collection Racetrack Conference Table |  -1934.40 | -20.27% |

### 4.4. Ranking y ganancias acumuladas por categoría

La cuarta consulta permitió obtener los tres productos mejor posicionados de cada categoría y calcular sus ganancias acumuladas.

| Categoría       | Ganancias acumuladas de los tres primeros |
| --------------- | ----------------------------------------: |
| Furniture       |                                   5026.73 |
| Office Supplies |                                  14345.34 |
| Technology      |                                  36754.74 |

## 5. Interpretación técnica

Los resultados muestran que Technology concentra los productos con mayor capacidad de generar ganancias. El producto Canon imageCLASS 2200 Advanced Copier destaca con 25199.93 en ganancias y un margen de rentabilidad del 40.91%.

Por otra parte, los productos Staples y Staple envelope presentan los mayores volúmenes de unidades vendidas, aunque su volumen comercial no implica necesariamente que sean los productos más rentables.

También se identificaron productos con pérdidas importantes. El caso más significativo corresponde a Cubify CubeX 3D Printer Double Head Print, que presenta pérdidas de 8879.97 y un margen negativo del 80%.

Estos resultados demuestran la importancia de diferenciar entre volumen de ventas y rentabilidad económica.

## 6. Conclusión

El análisis permitió identificar los productos que generan mayores ganancias y aquellos que representan pérdidas para la empresa.

Technology destaca por su capacidad de generar beneficios, mientras que algunos productos presentan márgenes negativos que requieren una revisión de sus costos y estrategias comerciales.

La aplicación de RANK(), DENSE_RANK() y funciones de agregación acumulativa permitió establecer comparaciones entre productos y categorías utilizando herramientas analíticas avanzadas de HiveQL.

