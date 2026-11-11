
-- =====================================================

-- UNIVERSIDAD DEL VALLE

-- EXAMEN PRACTICO INDIVIDUAL - SEGUNDO MOMENTO

-- DATASET: SAMPLE SUPERSTORE

-- PREGUNTA 4: SEGMENTACION AVANZADA DE CLIENTES MEDIANTE RFM

-- =====================================================

USE superstore_db;


-- CONSULTA 1:
-- Resumen general de indicadores RFM de los clientes.

WITH compras_cliente AS (
    SELECT
        customer_id,
        MAX(order_date) AS ultima_compra,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(sales) AS monetary
    FROM superstore
    GROUP BY customer_id
),

rfm AS (
    SELECT
        customer_id,
        DATEDIFF(
            MAX(ultima_compra) OVER (),
            ultima_compra
        ) AS recency,
        frequency,
        monetary
    FROM compras_cliente
)

SELECT
    COUNT(*) AS clientes_totales,
    MAX(recency) AS recency_maximo,
    MIN(recency) AS recency_minimo,
    ROUND(AVG(recency), 2) AS recency_promedio,
    ROUND(AVG(frequency), 2) AS frecuencia_promedio,
    ROUND(AVG(monetary), 2) AS gasto_promedio,
    ROUND(SUM(monetary), 2) AS ventas_totales
FROM rfm;


-- CONSULTA 2:
-- Clasificacion y distribucion de clientes mediante puntuaciones RFM.

WITH compras_cliente AS (
    SELECT
        customer_id,
        MAX(order_date) AS ultima_compra,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(sales) AS monetary
    FROM superstore
    GROUP BY customer_id
),

rfm AS (
    SELECT
        customer_id,
        DATEDIFF(
            MAX(ultima_compra) OVER (),
            ultima_compra
        ) AS recency,
        frequency,
        monetary
    FROM compras_cliente
),

puntuaciones AS (
    SELECT
        *,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM rfm
),

segmentacion AS (
    SELECT
        *,
        r_score + f_score + m_score AS rfm_total,
        CASE
            WHEN r_score + f_score + m_score >= 13
                THEN 'VIP'
            WHEN f_score >= 4
                THEN 'RECURRENTES'
            WHEN r_score <= 2
                THEN 'EN RIESGO'
            WHEN r_score + f_score + m_score >= 8
                THEN 'VALOR MEDIO'
            ELSE 'BAJO VALOR'
        END AS segmento
    FROM puntuaciones
)

SELECT
    segmento,
    COUNT(*) AS cantidad_clientes,
    ROUND(AVG(monetary), 2) AS gasto_promedio,
    ROUND(AVG(recency), 2) AS recency_promedio
FROM segmentacion
GROUP BY segmento
ORDER BY cantidad_clientes DESC;