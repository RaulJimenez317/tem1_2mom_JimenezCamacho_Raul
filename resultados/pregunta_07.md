# Pregunta 7. Análisis de tendencias temporales

## 1. Objetivo

Analizar la evolución mensual de las ventas y ganancias del dataset Sample Superstore, identificando tendencias comerciales, variaciones porcentuales, promedios móviles y los meses con mayor y menor volumen de ventas.

## 2. Estrategia de solución

Se agruparon los registros por año y mes para calcular las ventas y ganancias acumuladas.

Posteriormente, se utilizaron funciones de ventana para comparar los resultados mensuales con el periodo anterior y con el mismo mes del año anterior.

También se calculó un promedio móvil de tres meses para observar el comportamiento de las ventas y reducir las variaciones entre periodos.

Finalmente, se identificaron los tres meses con mayores y menores ventas mediante ordenamiento y limitación de resultados.

## 3. Técnicas utilizadas

* `YEAR()`: extraer el año de la fecha.
* `MONTH()`: extraer el mes.
* `SUM()`: calcular ventas y ganancias.
* `LAG()`: recuperar los valores de periodos anteriores.
* `AVG() OVER`: calcular el promedio móvil.
* `ROWS BETWEEN`: definir la ventana de tres meses.
* `ROUND()`: redondear resultados.
* `GROUP BY`: agrupar por año y mes.
* `ORDER BY`: ordenar los resultados.
* `LIMIT`: mostrar los tres meses principales.

## 4. Resultados obtenidos

### 4.1. Evolución mensual durante 2017

La primera consulta generó 12 registros correspondientes a los meses de 2017.

| Mes        |     Ventas | Ganancias | Variación mensual |
| ---------- | ---------: | --------: | ----------------: |
| Enero      |  43.971,37 |  7.140,44 |           -54,67% |
| Febrero    |  20.301,12 |  1.613,87 |           -53,83% |
| Marzo      |  58.872,35 | 14.751,89 |           190,00% |
| Abril      |  36.521,52 |    933,29 |           -37,96% |
| Mayo       |  44.261,08 |  6.342,58 |            21,19% |
| Junio      |  52.981,73 |  8.223,34 |            19,70% |
| Julio      |  45.264,43 |  6.952,62 |           -14,57% |
| Agosto     |  63.120,85 |  9.040,96 |            39,45% |
| Septiembre |  87.866,66 | 10.991,56 |            39,20% |
| Octubre    |  77.776,96 |  9.275,28 |           -11,48% |
| Noviembre  | 118.447,81 |  9.690,10 |            52,29% |
| Diciembre  |  83.829,31 |  8.483,35 |           -29,23% |

### 4.2. Tres meses con mayores ventas

| Año  | Mes |     Ventas | Ganancias |
| ---- | --: | ---------: | --------: |
| 2017 |  11 | 118.447,81 |  9.690,10 |
| 2016 |  12 |  96.999,07 | 17.885,31 |
| 2017 |   9 |  87.866,66 | 10.991,56 |

### 4.3. Tres meses con menores ventas

| Año  | Mes |    Ventas | Ganancias |
| ---- | --: | --------: | --------: |
| 2014 |   2 |  4.519,92 |    862,31 |
| 2015 |   2 | 11.951,40 |  2.813,85 |
| 2014 |   1 | 14.236,90 |  2.450,19 |

## 5. Interpretación técnica

Durante 2017 se observa un comportamiento variable de las ventas, con algunos meses de crecimiento y otros de disminución.

Noviembre presentó el mayor volumen de ventas, alcanzando 118.447,81, mientras que febrero fue el mes con menor actividad comercial dentro de 2017.

Marzo registró un crecimiento mensual del 190%, mostrando una recuperación importante respecto a febrero.

El promedio móvil de tres meses permitió observar la tendencia de las ventas considerando los últimos tres periodos.

En la comparación histórica, diciembre de 2016 también destacó por sus ganancias, alcanzando 17.885,31, superando incluso a noviembre de 2017.

Por otra parte, febrero de 2014 presentó el menor volumen de ventas de todo el periodo analizado, con 4.519,92.

## 6. Conclusión

El análisis permitió identificar las fluctuaciones mensuales de las ventas y ganancias, así como los periodos de mayor y menor actividad comercial.

Noviembre de 2017 fue el mes con mayores ventas del periodo, mientras que febrero de 2014 presentó el resultado más bajo.

La utilización de funciones de ventana como `LAG()` y `AVG() OVER` permitió realizar comparaciones tempor
