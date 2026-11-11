-- =====================================================
-- UNIVERSIDAD DEL VALLE
-- EXAMEN PRACTICO INDIVIDUAL - SEGUNDO MOMENTO
-- DATASET: SAMPLE SUPERSTORE
-- PREGUNTA 8: ANALISIS PARETO
-- =====================================================

USE superstore_db;


-- CONSULTA 1:
-- Pareto de ventas por producto

WITH productos AS (
    SELECT
        product_name,
        SUM(sales) AS ventas
    FROM superstore
    GROUP BY product_name
),

ranking AS (
    SELECT
        product_name,
        ventas,
        SUM(ventas) OVER (
            ORDER BY ventas DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS acumulado,
        SUM(ventas) OVER () AS total
    FROM productos
),

resumen AS (
    SELECT
        COUNT(*) AS total_productos,
        SUM(
            CASE
                WHEN acumulado - ventas < total * 0.80
                THEN 1 ELSE 0
            END
        ) AS productos_80
    FROM ranking
)

SELECT
    total_productos,
    productos_80,
    ROUND(productos_80 * 100.0 / total_productos, 2)
        AS porcentaje_productos
FROM resumen;

-- CONSULTA 2:
-- Pareto de ganancias por producto
WITH productos AS (
    SELECT
        product_name,
        SUM(profit) AS ganancias
    FROM superstore
    GROUP BY product_name
),

ranking AS (
    SELECT
        product_name,
        ganancias,
        SUM(ganancias) OVER (
            ORDER BY ganancias DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS acumulado,
        SUM(ganancias) OVER () AS total
    FROM productos
),

resumen AS (
    SELECT
        COUNT(*) AS total_productos,
        SUM(
            CASE
                WHEN acumulado - ganancias < total * 0.80
                THEN 1 ELSE 0
            END
        ) AS productos_80
    FROM ranking
)

SELECT
    total_productos,
    productos_80,
    ROUND(productos_80 * 100.0 / total_productos, 2)
        AS porcentaje_productos
FROM resumen;

-- CONSULTA 3:
-- Resumen comparativo del Pareto

WITH productos AS (
    SELECT
        product_name,
        SUM(sales) AS ventas,
        SUM(profit) AS ganancias
    FROM superstore
    GROUP BY product_name
),

ranking AS (
    SELECT
        product_name,
        ventas,
        ganancias,

        ROW_NUMBER() OVER (
            ORDER BY ventas DESC
        ) AS ranking_ventas,

        ROW_NUMBER() OVER (
            ORDER BY ganancias DESC
        ) AS ranking_ganancias

    FROM productos
)

SELECT
    product_name,
    ROUND(ventas, 2) AS ventas,
    ROUND(ganancias, 2) AS ganancias,
    ranking_ventas,
    ranking_ganancias
FROM ranking
WHERE ranking_ventas <= 5
   OR ranking_ganancias <= 5
ORDER BY ranking_ventas, ranking_ganancias
LIMIT 10;