# Pregunta 1. Diseño e implementación del modelo de datos

## 1. Objetivo

Diseñar e implementar un modelo de almacenamiento en Apache Hive para el dataset Sample Superstore, definiendo los tipos de datos adecuados y estableciendo un procedimiento de ingesta y transformación.

## 2. Estrategia de solución

Se implementó un modelo de almacenamiento dividido en dos niveles:

* **Tabla staging:** `stg_superstore`, destinada a recibir los datos originales del archivo CSV mediante OpenCSVSerde.
* **Tabla analítica:** `superstore`, diseñada con tipos de datos apropiados y almacenamiento ORC.

Esta separación permite conservar los datos originales y realizar transformaciones antes de ejecutar los análisis.

## 3. Diseño del modelo

Se identificaron 21 campos correspondientes a información de pedidos, clientes, productos, ubicación geográfica, ventas, descuentos y ganancias.

Se utilizaron los siguientes tipos:

* STRING para identificadores y atributos descriptivos.
* DATE para fechas de pedido y envío.
* INT para identificador de fila y cantidad.
* DECIMAL para ventas, descuentos y ganancias.

## 4. Procedimiento de carga

1. Se descargó el dataset Sample Superstore desde Kaggle.
2. Se verificó la estructura original del archivo CSV.
3. Se copió el archivo al contenedor NameNode.
4. Se almacenó el archivo en HDFS en `/data/superstore/raw/`.
5. Se creó la tabla externa `stg_superstore`.
6. Se creó la tabla analítica `superstore`.
7. Se transformaron los datos y se almacenaron en formato ORC.

## 5. Resultados

* Columnas identificadas: 21.
* Registros: pendiente de confirmar mediante COUNT(*).
* Formato de almacenamiento: ORC.
* Base de datos: superstore_db.
* Tabla analítica: superstore.

## 6. Interpretación técnica

La implementación permite separar la ingesta de datos de su transformación analítica. El uso de ORC proporciona un formato columnar apropiado para consultas analíticas en Hive.

Los tipos DECIMAL permiten representar importes financieros con precisión controlada, mientras que DATE facilita las operaciones temporales.

## 7. Conclusión

Se implementó el modelo de almacenamiento del dataset Sample Superstore en Apache Hive. La estructura permite utilizar los datos en consultas de agregación, funciones de ventana, análisis de clientes y análisis de rentabilidad.

La validación final del volumen de registros se documentará mediante la consulta COUNT(*).
