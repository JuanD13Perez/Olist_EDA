-- All the data is inserted using IMPORT/EXPORT CSV method from PgAdmin4
-- Creates customers table renamed customers
CREATE TABLE customers( 
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state VARCHAR(4) 
);

-- Creates geolocation table
CREATE TABLE geolocation( 
    geolocation_zip_code_prefix VARCHAR(50),
    geolocation_lat NUMERIC,
    geolocation_lng NUMERIC,
    geolocation_city TEXT,
    geolocation_state VARCHAR(4) 
);

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

-- Creates order_payments table
CREATE TABLE order_payments( 
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(15),
    payment_installments INT,
    payment_value REAL
);

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

-- copy public.products (product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm) FROM 'C:/Users/diego/Desktop/OLIST_~1/data/OL390F~1.CSV' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""





