
-- ============================================
-- UNIVERSIDAD DEL VALLE
-- EXAMEN PRACTICO - SAMPLE SUPERSTORE
-- PREGUNTA 1: MODELO DE DATOS
-- ============================================

CREATE DATABASE IF NOT EXISTS superstore_db;

USE superstore_db;

-- Tabla de entrada: conserva los datos originales
CREATE EXTERNAL TABLE IF NOT EXISTS stg_superstore (
    row_id STRING,
    order_id STRING,
    order_date STRING,
    ship_date STRING,
    ship_mode STRING,
    customer_id STRING,
    customer_name STRING,
    segment STRING,
    country STRING,
    city STRING,
    state STRING,
    postal_code STRING,
    region STRING,
    product_id STRING,
    category STRING,
    sub_category STRING,
    product_name STRING,
    sales STRING,
    quantity STRING,
    discount STRING,
    profit STRING
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION '/data/superstore/raw'
TBLPROPERTIES ('skip.header.line.count' = '1');

-- Tabla analitica en formato ORC
CREATE TABLE IF NOT EXISTS superstore (
    row_id INT,
    order_id STRING,
    order_date DATE,
    ship_date DATE,
    ship_mode STRING,
    customer_id STRING,
    customer_name STRING,
    segment STRING,
    country STRING,
    city STRING,
    state STRING,
    postal_code STRING,
    region STRING,
    product_id STRING,
    category STRING,
    sub_category STRING,
    product_name STRING,
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,4)
)
STORED AS ORC;