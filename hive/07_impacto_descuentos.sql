-- =====================================================
-- UNIVERSIDAD DEL VALLE
-- EXAMEN PRACTICO INDIVIDUAL - SEGUNDO MOMENTO
-- DATASET: SAMPLE SUPERSTORE
-- PREGUNTA 6: ANALISIS DEL IMPACTO DE LOS DESCUENTOS
-- =====================================================

USE superstore_db;

-- CONSULTA 1:
-- Ventas, ganancias y margen por rango de descuento.



SELECT
    CASE
        WHEN discount = 0 THEN 'SIN DESCUENTO'
        WHEN discount <= 0.20 THEN 'DESCUENTO BAJO'
        WHEN discount <= 0.50 THEN 'DESCUENTO MEDIO'
        ELSE 'DESCUENTO ALTO'
    END AS rango_descuento,
    COUNT(*) AS total_registros,
    ROUND(SUM(sales), 2) AS ventas_totales,
    ROUND(SUM(profit), 2) AS ganancias_totales,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS margen_rentabilidad,
    ROUND(AVG(discount) * 100, 2) AS descuento_promedio
FROM superstore
GROUP BY
    CASE
        WHEN discount = 0 THEN 'SIN DESCUENTO'
        WHEN discount <= 0.20 THEN 'DESCUENTO BAJO'
        WHEN discount <= 0.50 THEN 'DESCUENTO MEDIO'
        ELSE 'DESCUENTO ALTO'
    END
ORDER BY ventas_totales DESC;

-- CONSULTA 2:
-- Cantidad y porcentaje de operaciones con pérdidas por rango.

SELECT
    CASE
        WHEN discount = 0 THEN 'SIN DESCUENTO'
        WHEN discount <= 0.20 THEN 'DESCUENTO BAJO'
        WHEN discount <= 0.50 THEN 'DESCUENTO MEDIO'
        ELSE 'DESCUENTO ALTO'
    END AS rango_descuento,
    COUNT(*) AS total_registros,
    SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) AS registros_con_perdidas,
    ROUND(
        SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS porcentaje_no_rentable
FROM superstore
GROUP BY
    CASE
        WHEN discount = 0 THEN 'SIN DESCUENTO'
        WHEN discount <= 0.20 THEN 'DESCUENTO BAJO'
        WHEN discount <= 0.50 THEN 'DESCUENTO MEDIO'
        ELSE 'DESCUENTO ALTO'
    END
ORDER BY porcentaje_no_rentable DESC;

-- CONSULTA 3 y 4:
-- Categorias Subcategorias mas afectadas por los descuentos.

SELECT
    category,
    sub_category,
    COUNT(*) AS total_registros,
    ROUND(SUM(profit), 2) AS ganancias_totales,
    SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) AS registros_con_perdidas
FROM superstore
WHERE discount > 0.50
GROUP BY category, sub_category
ORDER BY registros_con_perdidas DESC
LIMIT 10;