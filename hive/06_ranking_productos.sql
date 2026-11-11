# =====================================================

# UNIVERSIDAD DEL VALLE

# EXAMEN PRACTICO INDIVIDUAL - SEGUNDO MOMENTO

# DATASET: SAMPLE SUPERSTORE

# PREGUNTA 5: RANKING DE PRODUCTOS SEGUN RENTABILIDAD

# =====================================================

USE superstore_db;

-- CONSULTA 1:
-- Cinco productos con mayor ganancia por categoria.

WITH productos AS (
SELECT
category,
product_name,
SUM(sales) AS ventas,
SUM(profit) AS ganancias
FROM superstore
GROUP BY category, product_name
),
ranking AS (
SELECT
category,
product_name,
ROUND(ganancias, 2) AS ganancias_totales,
ROUND(ganancias / ventas * 100, 2) AS margen_rentabilidad,
ROW_NUMBER() OVER (
PARTITION BY category
ORDER BY ganancias DESC
) AS posicion
FROM productos
)
SELECT
category,
product_name,
ganancias_totales,
margen_rentabilidad,
posicion
FROM ranking
WHERE posicion <= 5
ORDER BY category, posicion;

-- CONSULTA 2:
-- Cinco productos con mayor volumen de ventas.

SELECT
product_name,
SUM(quantity) AS unidades_vendidas,
ROUND(SUM(sales), 2) AS ventas_totales
FROM superstore
GROUP BY product_name
ORDER BY unidades_vendidas DESC
LIMIT 5;

-- CONSULTA 3:
-- Cinco productos con menores ganancias y su margen.

WITH productos AS (
SELECT
product_name,
SUM(sales) AS ventas,
SUM(profit) AS ganancias
FROM superstore
GROUP BY product_name
)
SELECT
product_name,
ROUND(ventas, 2) AS ventas_totales,
ROUND(ganancias, 2) AS ganancias_totales,
ROUND(ganancias / ventas * 100, 2) AS margen_rentabilidad
FROM productos
ORDER BY ganancias ASC
LIMIT 5;

-- CONSULTA 4:
-- Ranking y ganancias acumuladas por categoria.

WITH productos AS (
SELECT
category,
product_name,
SUM(sales) AS ventas,
SUM(profit) AS ganancias
FROM superstore
GROUP BY category, product_name
),
ranking AS (
SELECT
category,
product_name,
ROUND(ganancias, 2) AS ganancias_totales,

```
    RANK() OVER (
        PARTITION BY category
        ORDER BY ganancias DESC
    ) AS ranking,

    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY ganancias DESC
    ) AS ranking_denso,

    SUM(ganancias) OVER (
        PARTITION BY category
        ORDER BY ganancias DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS ganancias_acumuladas

FROM productos
```

)
SELECT
category,
product_name,
ganancias_totales,
ranking,
ranking_denso,
ROUND(ganancias_acumuladas, 2) AS ganancias_acumuladas
FROM ranking
WHERE ranking <= 3
ORDER BY category, ranking;
