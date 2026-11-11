# Pregunta 3. Análisis de evolución comercial por región

## 1. Objetivo

Analizar la evolución de las ventas y ganancias de las cuatro regiones comerciales durante el periodo 2014-2017, identificando sus márgenes de rentabilidad, variaciones interanuales y desempeño económico.

## 2. Estrategia de solución

Se utilizaron funciones de agregación de HiveQL para agrupar las ventas y ganancias por región y año.

Posteriormente, se implementaron expresiones de tabla comunes (CTE) y la función de ventana `LAG()` para comparar los resultados de cada año con los del año anterior.

Finalmente, se realizó una clasificación de las regiones según sus ganancias acumuladas y margen de rentabilidad.

## 3. Técnicas utilizadas

* `SUM()`: calcular ventas y ganancias acumuladas.
* `YEAR()`: extraer el año de la fecha del pedido.
* `ROUND()`: redondear los resultados.
* `GROUP BY`: agrupar información por región y año.
* `WITH`: construir consultas mediante CTE.
* `LAG()`: recuperar los valores del periodo anterior.
* `PARTITION BY`: realizar comparaciones independientes por región.
* `ORDER BY`: ordenar los resultados.

## 4. Resultados obtenidos

El análisis produjo 16 registros correspondientes a cuatro regiones y cuatro años.

### Ganancias acumuladas por región

| Región  | Ventas totales | Ganancias totales | Margen |
| ------- | -------------: | ----------------: | -----: |
| West    |      725457.93 |         108418.45 | 14.94% |
| East    |      678781.36 |          91522.78 | 13.48% |
| South   |      391721.90 |          46749.43 | 11.93% |
| Central |      501239.88 |          39706.36 |  7.92% |

### Variación interanual durante 2017

| Región  | Variación de ventas | Variación de ganancias |
| ------- | ------------------: | ---------------------: |
| Central |              -0.22% |                -62.05% |
| East    |              17.93% |                 64.98% |
| South   |              31.30% |                -50.01% |
| West    |              33.42% |                 82.15% |

## 5. Interpretación técnica

La región West presentó el mejor desempeño comercial, acumulando 108418.45 en ganancias y un margen de rentabilidad del 14.94%.

La región East ocupó el segundo lugar y mostró un crecimiento sostenido de sus ventas durante el periodo analizado.

La región South presentó un comportamiento particular: sus ventas aumentaron un 31.30% en 2017, pero sus ganancias disminuyeron un 50.01%. Esto evidencia que un incremento en las ventas no garantiza una mayor rentabilidad.

Por otra parte, Central registró el menor margen de rentabilidad, con un 7.92%, y una disminución de sus ganancias del 62.05% durante 2017.

## 6. Conclusión

El análisis permitió identificar diferencias importantes en el desempeño económico de las regiones.

West representa la región con mejores resultados generales, mientras que Central requiere mayor atención debido a su baja rentabilidad.

La utilización de CTE y funciones de ventana permitió realizar comparaciones interanuales sin necesidad de unir manualmente los resultados de diferentes periodos.

Estos resultados pueden utilizarse para orientar decisiones comerciales, revisar estrategias de descuentos y mejorar la rentabilidad regional.

## 7. Evidencias

Se adjuntan capturas de las tres consultas ejecutadas en Apache Hive:

* Consulta 1: ventas y ganancias por región y año.
* Consulta 2: variaciones porcentuales utilizando LAG().
* Consulta 3: clasificación general de regiones.

## 8. Herramientas utilizadas

* Apache Hive 2.3.2
* Hadoop 2.7.4
* Docker Compose
* HiveQL
siguiente