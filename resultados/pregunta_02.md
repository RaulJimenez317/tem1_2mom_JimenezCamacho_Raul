
# PREGUNTA 2. AUDITORIA DE CALIDAD E INTEGRIDAD DE DATOS

## 1. Objetivo

Realizar una auditoria de calidad e integridad sobre el dataset Sample Superstore mediante Apache Hive, identificando registros duplicados, valores nulos, fechas invalidas, inconsistencias temporales y valores comerciales fuera de los rangos esperados.

## 2. Estrategia de solucion

Se utilizo la tabla analitica `superstore` de la base de datos `superstore_db` y la tabla de staging `stg_superstore` para comprobar las fechas originales almacenadas como texto.

Se desarrollaron consultas HiveQL utilizando COUNT, COUNT DISTINCT, SUM, CASE WHEN, GROUP BY, HAVING y funciones de conversion de fechas.

La auditoria se realizo sin modificar los datos originales.

## 3. Resultados obtenidos

| Indicador | Resultado |
|---|---:|
| Registros totales | 9994 |
| Identificadores Row ID duplicados | 0 |
| Ordenes unicas | 5009 |
| Clientes unicos | 793 |
| Valores NULL o vacios | 0 |
| Fechas de pedido invalidas | 0 |
| Fechas de envio invalidas | 0 |
| Envios anteriores al pedido | 0 |
| Ventas iguales o inferiores a cero | 0 |
| Descuentos fuera del rango permitido | 0 |

### 3.1. Analisis de valores NULL

Se verificaron los 21 campos de la tabla analitica.

Los resultados mostraron que ninguna columna presenta valores NULL ni cadenas vacias.

### 3.2. Identificadores duplicados

Se agruparon los registros por Row ID y se utilizo HAVING COUNT(*) > 1 para identificar identificadores repetidos.

Resultado: 0 identificadores duplicados.

### 3.3. Ordenes y clientes

Se utilizaron las funciones COUNT(DISTINCT order_id) y COUNT(DISTINCT customer_id).

Resultados:
- Ordenes unicas: 5009.
- Clientes unicos: 793.

### 3.4. Validacion de fechas

Se verificaron las fechas originales en la tabla de staging mediante UNIX_TIMESTAMP y el formato M/d/yyyy.

Resultados:
- Fechas de pedido invalidas: 0.
- Fechas de envio invalidas: 0.
- Envios anteriores a los pedidos: 0.

### 3.5. Validacion comercial

Se verificaron las ventas y los descuentos.

Resultados:
- Ventas iguales o inferiores a cero: 0.
- Descuentos menores que cero o mayores que uno: 0.

## 4. Interpretacion tecnica

Los resultados indican que el dataset presenta una buena calidad estructural para los indicadores evaluados.

No se encontraron identificadores duplicados, valores nulos, fechas invalidas ni inconsistencias entre las fechas de pedido y envio.

Las operaciones comerciales tambien cumplen con los criterios establecidos para ventas positivas y descuentos comprendidos entre 0 y 1.

La existencia de 5009 ordenes unicas y 793 clientes permite continuar con los analisis comerciales y la segmentacion de clientes.

## 5. Criterios de tratamiento de inconsistencias

Aunque no se identificaron inconsistencias en los indicadores evaluados, se establecen los siguientes criterios para futuros procesos:

- Registros duplicados: investigar su origen y conservar un unico registro valido cuando se confirme que son duplicados reales.
- Valores NULL: identificar si el campo es obligatorio y aplicar correccion, exclusion o tratamiento controlado.
- Fechas invalidas: revisar el formato original y corregir las fechas cuando exista evidencia suficiente.
- Envios anteriores a pedidos: verificar el origen del registro antes de corregirlo o excluirlo.
- Ventas no positivas: investigar las operaciones y separarlas del analisis comercial cuando corresponda.
- Descuentos fuera de rango: revisar los valores originales y validar el porcentaje correcto.

## 6. Conclusion

La auditoria realizada mediante Apache Hive permitio comprobar que los 9994 registros del dataset cumplen con los criterios de calidad evaluados.

No se detectaron duplicados, valores NULL, fechas invalidas, ventas no positivas ni descuentos fuera del intervalo permitido.

Por lo tanto, el dataset presenta condiciones adecuadas para continuar con los analisis de evolucion comercial, segmentacion RFM, rentabilidad de productos y tendencias temporales.

