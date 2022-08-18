-- All the data is inserted using IMPORT/EXPORT CSV method from PgAdmin4

DROP TABLE IF EXISTS customers; 
-- Creates customers table
CREATE TABLE customers( 
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state VARCHAR(4) 
);

DROP TABLE IF EXISTS geolocation; 
-- Creates geolocation table
CREATE TABLE geolocation( 
    geolocation_zip_code_prefix VARCHAR(50),
    geolocation_lat NUMERIC,
    geolocation_lng NUMERIC,
    geolocation_city TEXT,
    geolocation_state VARCHAR(4) 
);

DROP TABLE IF EXISTS order_items; 
-- Creates order_items table
CREATE TABLE order_items( 
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP ,
    price REAL, 
    freight_value REAL
);

DROP TABLE IF EXISTS order_payments; 
-- Creates order_payments table
CREATE TABLE order_payments( 
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(15),
    payment_installments INT,
    payment_value REAL
);

DROP TABLE IF EXISTS order_reviews; 
-- Creates order_reviews table
CREATE TABLE order_reviews( 
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT  ,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

DROP TABLE IF EXISTS orders; 
-- Creates orders table
CREATE TABLE orders( 
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id  VARCHAR(50),
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

DROP TABLE IF EXISTS products; 
-- Creates products table
CREATE TABLE products( 
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name TEXT,
    product_name_lenght TEXT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
/*
-- Here is an example of how the data is being imported
COPY public.products( 
 product_id, 
    product_category_name,
   product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
   product_length_cm,
   product_height_cm,
   product_width_cm)
FROM 'C:/Users/diego/Desktop/OLIST_~1/data/OL390F~1.CSV'
DELIMITER ',' 
CSV HEADER 
QUOTE '\"' ESCAPE '''';"" */

DROP TABLE IF EXISTS sellers; 
-- Creates sellers table
CREATE TABLE sellers(
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix VARCHAR(6),
    seller_city TEXT,
    seller_state VARCHAR(4)
);

DROP TABLE IF EXISTS translation; 
-- Creates translation table
CREATE TABLE translation(
    product_category_name TEXT,
    product_category_name_english TEXT
);

-- should be 99,441
SELECT COUNT(*) FROM customers;

-- should be 1,000,163
SELECT COUNT(*) FROM geolocation;

-- should be 112,650
SELECT COUNT(*) FROM order_items;

-- should be 103,886
SELECT COUNT(*) FROM order_payments;

-- should be 100,000
SELECT COUNT(*) FROM order_reviews;

-- should be 99,441
SELECT COUNT(*) FROM orders;

-- should be 32,951
SELECT COUNT(*) FROM products;

-- should be 3,095
SELECT COUNT(*) FROM sellers;

-- should be 71
SELECT COUNT(*) FROM translation;

/* NOTES: 
Maybe you have noticed that there are some Foreign keys and Primary keys missing here. 
That is because the data violates these constarints. For example, Primary keys do not admit duplicates. */
