-- Tell us the total of sales per State and it's corresponding %.
-- Also it is included the number of customers and averega price of items purchased.
SELECT customers.customer_state AS state, 
       FLOOR(SUM(price)) AS Total_sales,
       ROUND( CAST((FLOOR(SUM(price))/SUM(FLOOR(SUM(price))) OVER() ) AS numeric ),4)*100 AS total_sales_percent,
       COUNT( DISTINCT customer_id) AS total_customers,
       ROUND(CAST(AVG(price) AS numeric),2) AS avg_price
FROM order_items 
LEFT JOIN orders USING(order_id)
LEFT JOIN customers USING(customer_id)
GROUP BY customer_state
ORDER BY SUM(price) DESC;

-- Tell us the total of sales of the entire period of time accordingly to the last table.
-- Should be 13591830. This is only done to verify that the percentage was calculated correctly. 
SELECT SUM(total_sales)
FROM(
    SELECT customers.customer_state AS state, 
           CEILING(SUM(price)) AS Total_sales
    FROM order_items 
    LEFT JOIN orders USING(order_id)
    LEFT JOIN customers USING(customer_id)
    GROUP BY customer_state
    ORDER BY SUM(price) DESC
    ) AS totals;
    
-- Count number of orders, we can see that the same order have different entries. One per item.
SELECT order_id , COUNT(order_id)
FROM order_items
GROUP BY order_id
ORDER BY COUNT(order_id) DESC
LIMIT 10;

-- This item appears several times, apparently order_item_id tell us how many items this order had.
SELECT * 
FROM order_items
WHERE order_id = '8272b63d03f5f79c56e9e4120aec44ef';

-- Calculate descriptive statistics of sales per state per month.
SELECT customer_state AS state,
       to_char(order_purchase_timestamp, 'YYYY-MM') AS date,
       FLOOR(SUM(price)) AS total_sales,
       COUNT(order_id) AS total_transactions,
       ROUND(CAST(percentile_cont(0.25) within group (order by price) AS numeric),0) AS q25th,
       ROUND(CAST(percentile_cont(0.5) within group (order by price) AS numeric) ,0) AS median,
       ROUND(CAST(AVG(price) AS numeric),0) AS avg_price,
       ROUND(CAST(percentile_cont(0.75) within group (order by price) AS numeric),0) AS q75th,
       ROUND(CAST(MIN(price) AS numeric),0) AS min_price,
       ROUND(CAST(MAX(price) AS numeric),0) AS max_price
FROM order_items
LEFT JOIN orders
USING(order_id)
LEFT JOIN customers
USING(customer_id)
GROUP BY state, date
ORDER BY state, date;

-- Show day of the week in which the order was made alongside with the hour
-- With the porpuse of determine which is the most active purchase hour and day
SELECT customer_state AS state,
       to_char(order_purchase_timestamp, 'YYYY-MM') AS date,
       to_char(order_purchase_timestamp, 'Day') AS day,
       to_char(order_purchase_timestamp, 'HH24') AS hour
FROM order_items
LEFT JOIN orders
USING(order_id)
LEFT JOIN customers
USING(customer_id);

