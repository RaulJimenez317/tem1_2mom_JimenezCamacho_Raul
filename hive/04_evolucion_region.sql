
-- =====================================================
-- UNIVERSIDAD DEL VALLE
-- EXAMEN PRACTICO INDIVIDUAL - SEGUNDO MOMENTO
-- DATASET: SAMPLE SUPERSTORE
-- PREGUNTA 3: EVOLUCION COMERCIAL POR REGION
-- =====================================================

USE superstore_db;

-- CONSULTA 1:
-- Ventas, ganancias y margen por region y anio.

SELECT
    region,
    YEAR(order_date) AS anio,
    ROUND(SUM(sales), 2) AS ventas_totales,
    ROUND(SUM(profit), 2) AS ganancias_totales,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS margen_rentabilidad
FROM superstore
GROUP BY region, YEAR(order_date)
ORDER BY region, anio;


-- CONSULTA 2:
-- Variacion porcentual interanual utilizando CTE y LAG().

WITH ventas_anuales AS (
    SELECT
        region,
        YEAR(order_date) AS anio,
        SUM(sales) AS ventas,
        SUM(profit) AS ganancias
    FROM superstore
    GROUP BY region, YEAR(order_date)
),
comparacion AS (
    SELECT
        region,
        anio,
        ventas,
        ganancias,

        LAG(ventas) OVER (
            PARTITION BY region
            ORDER BY anio
        ) AS ventas_anio_anterior,

        LAG(ganancias) OVER (
            PARTITION BY region
            ORDER BY anio
        ) AS ganancias_anio_anterior

    FROM ventas_anuales
)
SELECT
    region,
    anio,
    ROUND(ventas, 2) AS ventas,
    ROUND(ganancias, 2) AS ganancias,

    ROUND(
        ganancias / ventas * 100,
        2
    ) AS margen_rentabilidad,

    ROUND(
        (ventas - ventas_anio_anterior)
        / ventas_anio_anterior * 100,
        2
    ) AS variacion_ventas_pct,

    ROUND(
        (ganancias - ganancias_anio_anterior)
        / ABS(ganancias_anio_anterior) * 100,
        2
    ) AS variacion_ganancias_pct

FROM comparacion
ORDER BY region, anio;


-- CONSULTA 3:
-- Ranking general de regiones segun ganancias acumuladas.

SELECT
    region,
    ROUND(SUM(sales), 2) AS ventas_totales,
    ROUND(SUM(profit), 2) AS ganancias_totales,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS margen_rentabilidad
FROM superstore
GROUP BY region
ORDER BY ganancias_totales DESC;