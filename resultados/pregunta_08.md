# Pregunta 8. Análisis de concentración de ventas y ganancias por producto (Principio de Pareto)

## 1. Objetivo

Analizar la concentración de las ventas y ganancias entre los productos del catálogo Sample Superstore, identificando qué proporción de productos representa aproximadamente el 80% de los resultados comerciales y económicos.

## 2. Estrategia de solución

Se agruparon las ventas y ganancias por producto mediante funciones de agregación.

Posteriormente, se aplicó el principio de Pareto utilizando funciones de ventana para calcular los valores acumulados y determinar cuántos productos concentran aproximadamente el 80% de las ventas y ganancias.

Finalmente, se compararon los productos con mayor volumen de ventas y mayor generación de ganancias, utilizando funciones de ranking.

## 3. Técnicas utilizadas

* `SUM()`: calcular ventas y ganancias acumuladas.
* `GROUP BY`: agrupar los resultados por producto.
* `WITH`: construir consultas mediante CTE.
* `SUM() OVER()`: calcular totales generales.
* `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`: calcular acumulados progresivos.
* `ROW_NUMBER()`: establecer posiciones según ventas y ganancias.
* `ROUND()`: redondear los resultados.
* `ORDER BY`: ordenar los resultados.

## 4. Resultados obtenidos

El catálogo analizado contiene 1.850 productos.

### Concentración del 80% de las ventas

| Indicador                       | Resultado |
| ------------------------------- | --------: |
| Total de productos              |     1.850 |
| Productos que concentran el 80% |       420 |
| Porcentaje del catálogo         |    22.70% |

### Concentración del 80% de las ganancias

| Indicador                       | Resultado |
| ------------------------------- | --------: |
| Total de productos              |     1.850 |
| Productos que concentran el 80% |       166 |
| Porcentaje del catálogo         |     8.97% |

### Comparación de productos destacados

| Producto                                                                    | Ranking ventas | Ranking ganancias |
| --------------------------------------------------------------------------- | -------------: | ----------------: |
| Canon imageCLASS 2200 Advanced Copier                                       |              1 |                 1 |
| Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind |              2 |                 2 |
| Cisco TelePresence System EX90 Videoconferencing Unit                       |              3 |              1844 |
| HON 5400 Series Task Chairs for Big and Tall                                |              4 |              1549 |
| GBC DocuBind TL300 Electric Binding System                                  |              5 |                18 |
| Hewlett Packard LaserJet 3310 Copier                                        |              7 |                 3 |
| HP Designjet T520 Inkjet Large Format Printer - 24" Color                   |              8 |                 5 |
| Canon PC1060 Personal Laser Copier                                          |             20 |                 4 |

## 5. Interpretación técnica

Los resultados evidencian una importante concentración de las ventas y ganancias en una parte reducida del catálogo.

En el caso de las ventas, 420 productos, equivalentes al 22.70% del catálogo, concentran aproximadamente el 80% del volumen comercial.

En cuanto a las ganancias, la concentración es todavía mayor: solamente 166 productos, equivalentes al 8.97% del catálogo, representan aproximadamente el 80% de las ganancias.

La comparación de rankings también permite identificar diferencias importantes entre los productos más vendidos y los más rentables.

Por ejemplo, Cisco TelePresence System EX90 Videoconferencing Unit ocupa la tercera posición en ventas, pero la posición 1844 en ganancias, lo que demuestra que un volumen elevado de ventas no garantiza una buena rentabilidad.

Por otra parte, Canon imageCLASS 2200 Advanced Copier ocupa el primer lugar tanto en ventas como en ganancias, destacándose como uno de los productos de mejor desempeño comercial y económico.

## 6. Conclusión

El análisis permitió comprobar que las ventas y ganancias presentan diferentes niveles de concentración dentro del catálogo.

La aplicación del principio de Pareto permitió identificar los productos que concentran la mayor parte de los resultados económicos, facilitando la identificación de productos estratégicos para la empresa.

Asimismo, la comparación mediante rankings demostró que los productos con mayores ventas no necesariamente son los más rentables.

Estos resultados pueden utilizarse para orientar decisiones de inventario, estrategias comerciales y políticas de precios, priorizando aquellos productos que generan mayores beneficios económicos.

## 7. Evidencias

Se adjuntan capturas de las tres consultas ejecutadas en Apache Hive:

* Consulta 1: concentración del 80% de las ventas por producto.
* Consulta 2: concentración del 80% de las ganancias por producto.
* Consulta 3: comparación de los cinco productos destacados según ventas y ganancias.

## 8. Herramientas utilizadas

* Apache Hive 2.3.2
* Hadoop 2.7.4
* Docker Compose
* HiveQL
