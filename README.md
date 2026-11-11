# UNIVERSIDAD DEL VALLE

## Examen Práctico Individual - Segundo Momento

### Superstore Sales Dataset (Sample Superstore)

**Estudiante:** Jiménez Camacho, Raúl

**Tecnologías utilizadas:**

* Apache Hadoop
* Apache Hive
* HDFS
* Docker
* Docker Compose
* HiveQL
* Git y GitHub

## Descripción

Proyecto individual de procesamiento y análisis de datos utilizando Apache Hive y el conjunto de datos Sample Superstore.

El propósito es desarrollar un modelo de almacenamiento, realizar auditorías de calidad de datos y ejecutar consultas analíticas para generar información útil para la toma de decisiones.

## Objetivos

* Diseñar e implementar tablas en Apache Hive.
* Realizar la ingesta y transformación de datos.
* Auditar la calidad e integridad de la información.
* Analizar ventas, ganancias y comportamiento de clientes.
* Aplicar funciones de ventana y consultas analíticas avanzadas.
* Evaluar la rentabilidad de productos y descuentos.
* Realizar análisis temporales y Pareto.
* Documentar resultados y optimizaciones.

## Dataset

Fuente: Kaggle - Sample Superstore Dataset.

https://www.kaggle.com/datasets/vivek468/superstore-dataset-final

## Entorno de ejecución

Se utiliza una infraestructura basada en Docker Compose con Apache Hadoop y Apache Hive, tomando como referencia el proyecto Big Data Europe.

## Estructura del proyecto

* `dataset/`: archivos de datos.
* `diccionario/`: diccionario de datos.
* `hive/`: scripts DDL, DML y consultas HiveQL.
* `resultados/`: documentación de resultados e interpretaciones.
* `evidencias/`: capturas de ejecución.
* `optimizacion/`: análisis de optimización.

## Desarrollo

El proyecto contempla ocho preguntas analíticas distribuidas en tres bloques:

### BLOQUE I. Ingeniería y modelado de datos

1. Diseño e implementación del modelo de datos.
2. Auditoría de calidad e integridad de datos.

### BLOQUE II. Procesamiento y consultas analíticas

3. Análisis de evolución comercial por región.
4. Segmentación avanzada de clientes mediante RFM.
5. Ranking de productos según rentabilidad.
6. Análisis del impacto de los descuentos.

### BLOQUE III. Analítica avanzada

7. Análisis de tendencias temporales.
8. Análisis Pareto de ventas y rentabilidad.

## Procedimiento de ejecución

1. Descargar el dataset desde Kaggle y colocarlo en la carpeta `dataset/`.
2. Iniciar los servicios de Hadoop y Hive mediante Docker Compose.
3. Acceder al entorno de Hive utilizando Beeline.
4. Ejecutar los scripts de creación y carga de tablas.
5. Ejecutar los scripts HiveQL correspondientes a cada pregunta.
6. Consultar los resultados obtenidos y verificar las evidencias.
7. Revisar la documentación disponible en `resultados/`.

## Resultados y evidencias

Los resultados de cada pregunta se encuentran documentados individualmente en la carpeta `resultados/`.

Las capturas de ejecución de las consultas se encuentran organizadas en la carpeta `evidencias/`.

## Optimización

La carpeta `optimizacion/` contiene el análisis de las estrategias de optimización aplicadas o evaluadas durante el desarrollo del proyecto.

## Conclusiones generales

El desarrollo del proyecto permitió aplicar Apache Hive como herramienta de procesamiento y análisis de grandes volúmenes de datos.

Mediante consultas HiveQL, funciones de agregación, CTE y funciones de ventana, se analizaron diferentes dimensiones comerciales del dataset Sample Superstore.

Los resultados permitieron identificar patrones de ventas, rentabilidad regional, comportamiento de clientes, impacto de descuentos, tendencias temporales y concentración económica de productos.

El proyecto fortaleció los conocimientos sobre almacenamiento distribuido, procesamiento de datos y análisis mediante tecnologías Big Data.

## Repositorio

Este proyecto forma parte del Examen Práctico Individual del Segundo Momento de la Universidad del Valle.
