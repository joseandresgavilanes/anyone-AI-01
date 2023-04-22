-- TODO: This query will return a table with two columns; customer_state, and 
-- Revenue. The first one will have the letters that identify the top 10 states 
-- with most revenue and the second one the total revenue of each.
-- HINT: All orders should have a delivered status and the actual delivery date 
-- should be not null. 
SELECT customer_state, SUM(payment_value) as Revenue FROM orders WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL GROUP BY customer_state ORDER BY Revenue DESC LIMIT 10;