-- =====================================================
-- UNIVERSIDAD DEL VALLE
-- EXAMEN PRACTICO INDIVIDUAL - SEGUNDO MOMENTO
-- DATASET: SAMPLE SUPERSTORE
-- PREGUNTA 7: TENDENCIAS TEMPORALES
-- =====================================================

USE superstore_db;


-- CONSULTA 1:
-- Ventas, Evolución mensual, variaciones y promedio móvil


USE superstore_db;

WITH ventas_mensuales AS (
    SELECT
        YEAR(order_date) AS anio,
        MONTH(order_date) AS mes,
        SUM(sales) AS ventas,
        SUM(profit) AS ganancias
    FROM superstore
    GROUP BY YEAR(order_date), MONTH(order_date)
),

indicadores AS (
    SELECT
        anio,
        mes,
        ventas,
        ganancias,

        LAG(ventas, 1) OVER (
            ORDER BY anio, mes
        ) AS ventas_mes_anterior,

        LAG(ventas, 12) OVER (
            ORDER BY anio, mes
        ) AS ventas_anio_anterior,

        AVG(ventas) OVER (
            ORDER BY anio, mes
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS promedio_movil

    FROM ventas_mensuales
)

SELECT
    anio,
    mes,
    ROUND(ventas, 2) AS ventas,
    ROUND(ganancias, 2) AS ganancias,

    ROUND(
        (ventas - ventas_mes_anterior)
        / ventas_mes_anterior * 100, 2
    ) AS variacion_mensual_pct,

    ROUND(
        (ventas - ventas_anio_anterior)
        / ventas_anio_anterior * 100, 2
    ) AS variacion_anual_pct,

    ROUND(promedio_movil, 2) AS promedio_movil_3_meses

FROM indicadores
WHERE anio = 2017
ORDER BY mes;

-- CONSULTA 2:
-- MESES CON MAYORES VENTAS
WITH ventas_mensuales AS (
    SELECT
        YEAR(order_date) AS anio,
        MONTH(order_date) AS mes,
        SUM(sales) AS ventas,
        SUM(profit) AS ganancias
    FROM superstore
    GROUP BY YEAR(order_date), MONTH(order_date)
)

SELECT
    anio,
    mes,
    ROUND(ventas, 2) AS ventas,
    ROUND(ganancias, 2) AS ganancias
FROM ventas_mensuales
ORDER BY ventas DESC
LIMIT 3;


-- CONSULTA 3:
-- Meses con menores ventas

WITH ventas_mensuales AS (
    SELECT
        YEAR(order_date) AS anio,
        MONTH(order_date) AS mes,
        SUM(sales) AS ventas,
        SUM(profit) AS ganancias
    FROM superstore
    GROUP BY YEAR(order_date), MONTH(order_date)
)

SELECT
    anio,
    mes,
    ROUND(ventas, 2) AS ventas,
    ROUND(ganancias, 2) AS ganancias
FROM ventas_mensuales
ORDER BY ventas ASC
LIMIT 3;