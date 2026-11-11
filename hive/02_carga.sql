
-- ============================================
-- PREGUNTA 1: CARGA Y TRANSFORMACION
-- ============================================

USE superstore_db;

INSERT OVERWRITE TABLE superstore
SELECT
    CAST(row_id AS INT),
    order_id,
    TO_DATE(FROM_UNIXTIME(
        UNIX_TIMESTAMP(order_date,'M/d/yyyy')
    )),
    TO_DATE(FROM_UNIXTIME(
        UNIX_TIMESTAMP(ship_date,'M/d/yyyy')
    )),
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    CAST(sales AS DECIMAL(12,2)),
    CAST(quantity AS INT),
    CAST(discount AS DECIMAL(5,2)),
    CAST(profit AS DECIMAL(12,4))
FROM stg_superstore;

-- Verificacion de registros
SELECT COUNT(*) AS total_registros
FROM superstore;

-- Verificacion de estructura
DESCRIBE FORMATTED superstore;