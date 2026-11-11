
-- ============================================================
-- UNIVERSIDAD DEL VALLE
-- EXAMEN PRACTICO INDIVIDUAL - 2DO MOMENTO
-- DATASET: SAMPLE SUPERSTORE
-- PREGUNTA 2: AUDITORIA DE CALIDAD E INTEGRIDAD DE DATOS
-- Autor: Raul Jimenez Camacho
-- Motor: Apache Hive 2.3.2
-- Base de datos: superstore_db
-- ============================================================

USE superstore_db;

-- ------------------------------------------------------------
-- CONSULTA 1: CANTIDAD TOTAL DE REGISTROS
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_registros
FROM superstore;


-- ------------------------------------------------------------
-- CONSULTA 2: IDENTIFICADORES ROW_ID DUPLICADOS
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS identificadores_duplicados
FROM (
    SELECT row_id
    FROM superstore
    WHERE row_id IS NOT NULL
    GROUP BY row_id
    HAVING COUNT(*) > 1
) duplicados;


-- ------------------------------------------------------------
-- CONSULTA 3: ORDENES Y CLIENTES UNICOS
-- ------------------------------------------------------------

SELECT
    COUNT(DISTINCT order_id) AS ordenes_unicas,
    COUNT(DISTINCT customer_id) AS clientes_unicos
FROM superstore;


-- ------------------------------------------------------------
-- CONSULTA 4: VALORES NULL Y CADENAS VACIAS
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_registros,

    SUM(CASE WHEN row_id IS NULL THEN 1 ELSE 0 END)
        AS row_id_nulos,

    SUM(CASE WHEN order_id IS NULL OR TRIM(order_id) = '' THEN 1 ELSE 0 END)
        AS order_id_nulos,

    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END)
        AS order_date_nulos,

    SUM(CASE WHEN ship_date IS NULL THEN 1 ELSE 0 END)
        AS ship_date_nulos,

    SUM(CASE WHEN ship_mode IS NULL OR TRIM(ship_mode) = '' THEN 1 ELSE 0 END)
        AS ship_mode_nulos,

    SUM(CASE WHEN customer_id IS NULL OR TRIM(customer_id) = '' THEN 1 ELSE 0 END)
        AS customer_id_nulos,

    SUM(CASE WHEN customer_name IS NULL OR TRIM(customer_name) = '' THEN 1 ELSE 0 END)
        AS customer_name_nulos,

    SUM(CASE WHEN segment IS NULL OR TRIM(segment) = '' THEN 1 ELSE 0 END)
        AS segment_nulos,

    SUM(CASE WHEN country IS NULL OR TRIM(country) = '' THEN 1 ELSE 0 END)
        AS country_nulos,

    SUM(CASE WHEN city IS NULL OR TRIM(city) = '' THEN 1 ELSE 0 END)
        AS city_nulos,

    SUM(CASE WHEN state IS NULL OR TRIM(state) = '' THEN 1 ELSE 0 END)
        AS state_nulos,

    SUM(CASE WHEN postal_code IS NULL OR TRIM(postal_code) = '' THEN 1 ELSE 0 END)
        AS postal_code_nulos,

    SUM(CASE WHEN region IS NULL OR TRIM(region) = '' THEN 1 ELSE 0 END)
        AS region_nulos,

    SUM(CASE WHEN product_id IS NULL OR TRIM(product_id) = '' THEN 1 ELSE 0 END)
        AS product_id_nulos,

    SUM(CASE WHEN category IS NULL OR TRIM(category) = '' THEN 1 ELSE 0 END)
        AS category_nulos,

    SUM(CASE WHEN sub_category IS NULL OR TRIM(sub_category) = '' THEN 1 ELSE 0 END)
        AS sub_category_nulos,

    SUM(CASE WHEN product_name IS NULL OR TRIM(product_name) = '' THEN 1 ELSE 0 END)
        AS product_name_nulos,

    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END)
        AS sales_nulos,

    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END)
        AS quantity_nulos,

    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END)
        AS discount_nulos,

    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END)
        AS profit_nulos

FROM superstore;


-- ------------------------------------------------------------
-- CONSULTA 5: FECHAS INVALIDAS EN LA TABLA DE STAGING
-- Las fechas originales estan almacenadas como texto.
-- ------------------------------------------------------------

SELECT
    SUM(
        CASE
            WHEN order_date IS NULL
              OR UNIX_TIMESTAMP(TRIM(order_date), 'M/d/yyyy') IS NULL
            THEN 1 ELSE 0
        END
    ) AS pedidos_fecha_invalida,

    SUM(
        CASE
            WHEN ship_date IS NULL
              OR UNIX_TIMESTAMP(TRIM(ship_date), 'M/d/yyyy') IS NULL
            THEN 1 ELSE 0
        END
    ) AS envios_fecha_invalida

FROM stg_superstore;


-- ------------------------------------------------------------
-- CONSULTA 6: ENVIOS ANTERIORES A LA FECHA DE PEDIDO
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS envios_anteriores_al_pedido
FROM superstore
WHERE order_date IS NOT NULL
  AND ship_date IS NOT NULL
  AND ship_date < order_date;


-- ------------------------------------------------------------
-- CONSULTA 7: VENTAS IGUALES O INFERIORES A CERO
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS ventas_no_positivas
FROM superstore
WHERE sales <= 0;


-- ------------------------------------------------------------
-- CONSULTA 8: DESCUENTOS FUERA DEL INTERVALO [0,1]
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS descuentos_fuera_rango
FROM superstore
WHERE discount < 0
   OR discount > 1;


-- ------------------------------------------------------------
-- CONSULTA 9: RESUMEN GENERAL DE CALIDAD DE DATOS
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_registros,

    SUM(CASE
        WHEN row_id IS NULL THEN 1 ELSE 0
    END) AS row_id_nulos,

    SUM(CASE
        WHEN order_id IS NULL OR TRIM(order_id) = ''
        THEN 1 ELSE 0
    END) AS order_id_nulos,

    SUM(CASE
        WHEN customer_id IS NULL OR TRIM(customer_id) = ''
        THEN 1 ELSE 0
    END) AS customer_id_nulos,

    SUM(CASE
        WHEN order_date IS NULL THEN 1 ELSE 0
    END) AS fechas_pedido_nulas,

    SUM(CASE
        WHEN ship_date IS NULL THEN 1 ELSE 0
    END) AS fechas_envio_nulas,

    SUM(CASE
        WHEN sales IS NULL OR sales <= 0
        THEN 1 ELSE 0
    END) AS ventas_invalidas,

    SUM(CASE
        WHEN discount IS NULL OR discount < 0 OR discount > 1
        THEN 1 ELSE 0
    END) AS descuentos_invalidos,

    SUM(CASE
        WHEN profit IS NULL THEN 1 ELSE 0
    END) AS ganancias_nulas,

    SUM(CASE
        WHEN order_date IS NOT NULL
         AND ship_date IS NOT NULL
         AND ship_date < order_date
        THEN 1 ELSE 0
    END) AS envios_inconsistentes

FROM superstore;

