
# Pregunta 4. Segmentación avanzada de clientes mediante RFM

## 1. Objetivo

Analizar el comportamiento de compra de los clientes mediante el modelo RFM (Recency, Frequency, Monetary), identificando clientes de alto valor, compradores recurrentes y clientes con riesgo de abandono.

## 2. Estrategia de solución

Se agruparon los registros por cliente para calcular la última fecha de compra, la cantidad de órdenes únicas y el importe total de ventas acumuladas.

Se utilizó la fecha máxima del dataset como referencia para calcular los días transcurridos desde la última compra.

Posteriormente, se aplicó la función NTILE(5) para distribuir los clientes en cinco niveles de puntuación para cada variable RFM.

Finalmente, se utilizó una estructura CASE para clasificar los clientes en cinco segmentos según sus puntuaciones.

## 3. Técnicas utilizadas

- MAX(): obtener la última fecha de compra.
- COUNT(DISTINCT): contar órdenes únicas.
- SUM(): calcular el importe acumulado.
- DATEDIFF(): calcular los días desde la última compra.
- NTILE(5): distribuir los clientes en cinco grupos.
- OVER(): aplicar funciones de ventana.
- CASE WHEN: establecer los segmentos.
- GROUP BY: agrupar clientes por segmento.

## 4. Criterios de segmentación

Se establecieron los siguientes criterios:

- VIP: puntuación RFM total mayor o igual a 13.
- RECURRENTES: puntuación de frecuencia mayor o igual a 4.
- EN RIESGO: puntuación de recency menor o igual a 2.
- VALOR MEDIO: puntuación RFM total mayor o igual a 8.
- BAJO VALOR: clientes restantes.

Las puntuaciones individuales van del 1 al 5. En Recency, una puntuación mayor representa una compra más reciente. En Frequency y Monetary, una puntuación mayor representa un mejor comportamiento de compra.

## 5. Resultados obtenidos

### Resumen general

| Indicador | Resultado |
|---|---:|
| Clientes totales | 793 |
| Recency máximo | 1165 días |
| Recency mínimo | 0 días |
| Recency promedio | 146.80 días |
| Frecuencia promedio | 6.32 |
| Gasto promedio | 2896.85 |
| Ventas totales | 2297201.07 |

### Distribución de clientes por segmento

| Segmento | Clientes | Gasto promedio | Recency promedio |
|---|---:|---:|---:|
| EN RIESGO | 229 | 1800.25 | 344.72 |
| RECURRENTES | 205 | 3339.06 | 116.13 |
| VALOR MEDIO | 169 | 3215.57 | 39.53 |
| VIP | 114 | 5216.89 | 26.59 |
| BAJO VALOR | 76 | 819.50 | 52.04 |

## 6. Interpretación técnica

El análisis identificó 793 clientes distribuidos en cinco segmentos.

El segmento VIP presenta el mayor gasto promedio, con 5216.89, y una recency promedio de 26.59 días, lo que refleja un comportamiento de compra favorable.

Los clientes recurrentes representan 205 registros y mantienen un gasto promedio de 3339.06.

El segmento EN RIESGO concentra 229 clientes, siendo el grupo más numeroso. Su recency promedio de 344.72 días indica un periodo considerable sin realizar compras.

Por otra parte, los clientes de bajo valor presentan el menor gasto promedio, con 819.50.

## 7. Conclusión

El modelo RFM permitió identificar diferentes perfiles de clientes considerando su comportamiento de compra y contribución económica.

Los resultados muestran que los clientes VIP representan una oportunidad importante para estrategias de fidelización, mientras que los clientes EN RIESGO requieren campañas de recuperación.

La segmentación facilita la toma de decisiones comerciales y permite desarrollar estrategias diferenciadas para mejorar la retención y rentabilidad de los clientes.

## 8. Evidencias

Se adjuntan capturas de las dos consultas ejecutadas en Apache Hive:

- Consulta 1: resumen general de indicadores RFM.
- Consulta 2: clasificación y distribución de clientes.

## 9. Herramientas utilizadas

- Apache Hive 2.3.2
- Hadoop 2.7.4
- Docker Compose
- HiveQL