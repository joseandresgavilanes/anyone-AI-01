-- TODO: This query will return a table with two columns; State, and 
-- Delivery_Difference. The first one will have the letters that identify the 
-- states, and the second one the average difference between the estimate 
-- delivery date and the date when the items were actually delivered to the 
-- customer.
-- HINTS:
-- 1. You can use the julianday function to convert a date to a number.
-- 2. You can use the CAST function to convert a number to an integer.
-- 3. You can use the STRFTIME function to convert a order_delivered_customer_date to a string removing hours, minutes and seconds.
-- 4. order_status == 'delivered' AND order_delivered_customer_date IS NOT NULL

SELECT
  o.customer_state AS State, -- Use the customer_state column as the State column
  AVG(julianday(order_delivered_customer_date) - julianday(order_estimated_delivery_date)) AS Delivery_Difference -- Calculate the average delivery difference in days using julianday and subtracting the estimated delivery date from the actual delivery date
FROM
  orders o -- Select from the orders table
WHERE
  o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL -- Only include orders that have been delivered and have a delivery date
GROUP BY
  o.customer_state -- Group the results by customer_state to calculate averages for each state