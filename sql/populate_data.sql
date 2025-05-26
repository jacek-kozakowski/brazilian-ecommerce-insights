
INSERT INTO customers
SELECT *
FROM olist_customers_dataset
WHERE customer_id IN (
    SELECT DISTINCT customer_id FROM olist_orders_dataset
)
AND rowid IN (
    SELECT MIN(rowid)
    FROM olist_customers_dataset
    GROUP BY customer_id
);


INSERT INTO orders
SELECT *
FROM olist_orders_dataset
WHERE customer_id IN (SELECT customer_id FROM customers)
AND rowid IN (
    SELECT MIN(rowid)
    FROM olist_orders_dataset
    GROUP BY order_id
);


INSERT INTO products
SELECT *
FROM olist_products_dataset
WHERE rowid IN (
    SELECT MIN(rowid)
    FROM olist_products_dataset
    GROUP BY product_id
);


INSERT INTO sellers
SELECT *
FROM olist_sellers_dataset
WHERE rowid IN (
    SELECT MIN(rowid)
    FROM olist_sellers_dataset
    GROUP BY seller_id
);


INSERT INTO order_items
SELECT *
FROM olist_order_items_dataset
WHERE order_id IN (SELECT order_id FROM orders)
  AND product_id IN (SELECT product_id FROM products)
  AND seller_id IN (SELECT seller_id FROM sellers);


INSERT INTO order_payments
SELECT *
FROM olist_order_payments_dataset
WHERE order_id IN (SELECT order_id FROM orders);


INSERT INTO order_reviews
SELECT *
FROM (
    SELECT *
    FROM olist_order_reviews_dataset
    WHERE order_id IN (SELECT order_id FROM orders)
    GROUP BY review_id
);


INSERT INTO geolocation
SELECT * FROM olist_geolocation_dataset;


INSERT INTO product_category_name_translation
SELECT * FROM product_category_name_translation;
