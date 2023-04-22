-- TODO: This query will return a table with the top 10 revenue categories in 
-- English, the number of orders and their total revenue. The first column will 
-- be Category, that will contain the top 10 revenue categories; the second one 
-- will be Num_order, with the total amount of orders of each category; and the 
-- last one will be Revenue, with the total revenue of each catgory.
-- HINT: All orders should have a delivered status and the Category and actual 
-- delivery date should be not null.

SELECT
product_category_name_english AS Category,
COUNT(DISTINCT order_id) AS Num_order,
SUM(price) AS Revenue
FROM
order_items
JOIN orders ON order_items.order_id = orders.order_id
JOIN products ON order_items.product_id = products.product_id
WHERE
order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL AND product_category_name_english IS NOT NULL
GROUP BY
Category
ORDER BY
Revenue DESC
LIMIT 10;