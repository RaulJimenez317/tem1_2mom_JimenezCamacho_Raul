# Pregunta 1. Diseño e implementación del modelo de datos

## 1. Objetivo

Diseñar e implementar un modelo de almacenamiento en Apache Hive para el dataset Sample Superstore, identificando sus campos, definiendo tipos de datos adecuados y estableciendo un procedimiento de ingesta y transformación.

## 2. Estrategia de solución

Se implementó un modelo de almacenamiento dividido en dos niveles:

* Tabla staging: `stg_superstore`, destinada a recibir los datos originales del archivo CSV.
* Tabla analítica: `superstore`, diseñada con tipos de datos apropiados y almacenamiento ORC.

Esta separación permite conservar los datos originales y realizar transformaciones antes de ejecutar los análisis.

Para la lectura del CSV se utilizó OpenCSVSerde, permitiendo interpretar correctamente los campos de texto que contienen comas entre comillas.

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
3. Se identificaron los 21 campos y el separador por comas.
4. Se copió el archivo al contenedor NameNode.
5. Se almacenó el archivo en HDFS en `/data/superstore/raw/`.
6. Se creó la tabla externa `stg_superstore`.
7. Se creó la tabla analítica `superstore`.
8. Se transformaron los datos y se almacenaron en formato ORC.

## 5. Resultados obtenidos

| Indicador                 | Resultado      |
| ------------------------- | -------------- |
| Campos identificados      | 21             |
| Registros importados      | 9.994          |
| Base de datos             | superstore_db  |
| Tabla de entrada          | stg_superstore |
| Tabla analítica           | superstore     |
| Formato de almacenamiento | ORC            |
| Primera fecha de pedido   | 2014-01-03     |
| Última fecha de pedido    | 2017-12-30     |
| Primera fecha de envío    | 2014-01-07     |
| Última fecha de envío     | 2018-01-05     |

La consulta `COUNT(*)` confirmó un total de 9.994 registros en la tabla analítica.

La consulta `DESCRIBE FORMATTED superstore` permitió verificar la estructura, los tipos de datos y la ubicación física de la tabla en HDFS.

## 6. Interpretación técnica

La implementación permitió separar la ingesta de datos de su transformación analítica.

El uso de ORC proporciona un formato columnar apropiado para consultas analíticas en Hive. Además, los tipos DECIMAL permiten representar importes financieros con precisión controlada, mientras que DATE facilita las operaciones temporales.

El dataset contiene pedidos desde enero de 2014 hasta diciembre de 2017. Las fechas de envío llegan hasta enero de 2018, debido a que algunos pedidos realizados al final del periodo fueron enviados posteriormente.

## 7. Evidencias

Se deben adjuntar las siguientes capturas:

* Verificación de la estructura de la tabla staging.
* Consulta de los primeros registros importados.
* Conteo total de registros mediante COUNT(*).
* Resultado de DESCRIBE FORMATTED superstore.
* Listado del archivo CSV almacenado en HDFS.

## 8. Conclusión

Se implementó satisfactoriamente el modelo de almacenamiento del dataset Sample Superstore en Apache Hive, verificando la importación de 9.994 registros y la correcta definición de sus 21 campos.

La utilización de una tabla staging y una tabla analítica en formato ORC proporciona una estructura adecuada para desarrollar las consultas de calidad de datos, análisis comercial, segmentación de clientes y rentabilidad

