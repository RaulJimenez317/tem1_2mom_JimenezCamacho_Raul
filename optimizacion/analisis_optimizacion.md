# Análisis de optimización — Apache Hive

## 1. Introducción

Durante el desarrollo del proyecto se utilizaron diferentes estrategias para mejorar la organización, procesamiento y ejecución de consultas sobre el dataset Sample Superstore.

El objetivo de estas estrategias es reducir operaciones innecesarias, facilitar el mantenimiento de las consultas y mejorar el procesamiento de información mediante Apache Hive.

## 2. Estrategias aplicadas

### 2.1. Separación de tablas staging y analítica

Se plantea una estructura de dos niveles:

* **Staging:** conserva los datos originales del CSV.
* **Analítica:** almacena los datos transformados con tipos apropiados.

Esta separación permite controlar las conversiones, detectar inconsistencias y evitar procesar repetidamente los datos originales.

### 2.2. Uso de tipos de datos apropiados

Se utilizan tipos de datos según la naturaleza de cada campo:

* STRING para identificadores y datos descriptivos.
* DATE para fechas.
* DECIMAL para importes económicos y descuentos.
* INT para cantidades.

Esto facilita las operaciones analíticas y evita conversiones innecesarias durante las consultas.

### 2.3. Uso de CTE

Se utilizan expresiones WITH para dividir consultas complejas en etapas.

Por ejemplo, en los análisis Pareto se separan las operaciones en:

1. Agrupación de productos.
2. Cálculo de acumulados mediante funciones de ventana.
3. Obtención de resultados resumidos.

Esto facilita la comprensión, reutilización y mantenimiento del código.

### 2.4. Funciones de ventana

Se utilizan funciones como:

* LAG(): comparación con períodos anteriores.
* SUM() OVER(): cálculo de valores acumulados.
* ROW_NUMBER(): numeración de registros.
* RANK(): clasificación con posiciones compartidas.
* DENSE_RANK(): clasificación sin saltos en las posiciones.

Estas funciones permiten realizar análisis avanzados sin recurrir a múltiples consultas independientes.

### 2.5. Reducción de resultados innecesarios

Se aplican estrategias para evitar resultados excesivamente grandes:

* LIMIT para restringir rankings.
* Agregaciones mediante GROUP BY.
* Selección únicamente de columnas necesarias.
* Consultas resumidas para obtener indicadores generales.

Esto permite interpretar los resultados con mayor facilidad.

## 3. Consideraciones sobre el rendimiento

Durante las ejecuciones se utilizó Hive sobre MapReduce (Hive-on-MR).

Se observó que las consultas pueden requerir varios segundos de procesamiento debido a las operaciones de agrupación, ordenamiento y funciones de ventana.

También se identificaron restricciones de Hive relacionadas con:

* Subconsultas en determinadas condiciones.
* Productos cartesianos mediante CROSS JOIN.
* Restricciones de expresiones utilizadas en GROUP BY.

Para resolver estos inconvenientes se reorganizaron las consultas mediante CTE y agregaciones independientes, evitando operaciones incompatibles con la configuración utilizada.

## 4. Mejoras futuras

Se identifican las siguientes posibilidades de optimización:

* Utilizar formato ORC o Parquet en lugar de CSV para las tablas analíticas.
* Aplicar compresión para reducir el espacio de almacenamiento.
* Evaluar particionamiento por año para consultas temporales.
* Evaluar el uso de Apache Tez o Spark como motor de ejecución.
* Analizar los planes de ejecución mediante EXPLAIN.
* Revisar el uso de estadísticas para mejorar la planificación de consultas.

Estas mejoras se proponen como alternativas futuras y no se consideran implementadas si no se han ejecutado y comprobado.

## 5. Conclusión

El proyecto permitió aplicar diferentes estrategias de organización y optimización de consultas en Apache Hive.

La separación de datos originales y analíticos, el uso de CTE, las funciones de ventana y la reducción de resultados contribuyeron a desarrollar consultas más organizadas y comprensibles.

Además, se identificaron oportunidades de mejora relacionadas con formatos de almacenamiento y motores de ejecución que podrían evaluarse en futuras implementaciones.
