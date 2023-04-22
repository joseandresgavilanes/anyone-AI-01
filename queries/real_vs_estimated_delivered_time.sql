-- TODO: This query will return a table with the differences between the real 
-- and estimated delivery times by month and year. It will have different 
-- columns: month_no, with the month numbers going from 01 to 12; month, with 
-- the 3 first letters of each month (e.g. Jan, Feb); Year2016_real_time, with 
-- the average delivery time per month of 2016 (NaN if it doesn't exist); 
-- Year2017_real_time, with the average delivery time per month of 2017 (NaN if 
-- it doesn't exist); Year2018_real_time, with the average delivery time per 
-- month of 2018 (NaN if it doesn't exist); Year2016_estimated_time, with the 
-- average estimated delivery time per month of 2016 (NaN if it doesn't exist); 
-- Year2017_estimated_time, with the average estimated delivery time per month 
-- of 2017 (NaN if it doesn't exist) and Year2018_estimated_time, with the 
-- average estimated delivery time per month of 2018 (NaN if it doesn't exist).
-- HINTS
-- 1. You can use the julianday function to convert a date to a number.
-- 2. order_status == 'delivered' AND order_delivered_customer_date IS NOT NULL
-- 3. Take distinct order_id.

SELECT
  STRFTIME('%m', order_delivered_customer_date) AS month_no, -- Get the month number from the order_delivered_customer_date
  STRFTIME('%b', order_delivered_customer_date) AS month, -- Get the abbreviated month name from the order_delivered_customer_date
  AVG(julianday(order_delivered_customer_date) - julianday(order_estimated_delivery_date)) AS Year2016_real_time, -- Calculate the average delivery time for each month of 2016
  NULL AS Year2017_real_time, -- Return NULL for Year2017_real_time because it doesn't exist
  NULL AS Year2018_real_time, -- Return NULL for Year2018_real_time because it doesn't exist
  AVG(julianday(order_estimated_delivery_date) - julianday(order_purchase_timestamp)) AS Year2016_estimated_time, -- Calculate the average estimated delivery time for each month of 2016
  NULL AS Year2017_estimated_time, -- Return NULL for Year2017_estimated_time because it doesn't exist
  NULL AS Year2018_estimated_time -- Return NULL for Year2018_estimated_time because it doesn't exist
FROM
  orders -- Select from the orders table
WHERE
  order_status == 'delivered' AND order_delivered_customer_date IS NOT NULL -- Filter for only delivered orders where the order_delivered_customer_date is not NULL
  AND STRFTIME('%Y', order_delivered_customer_date) IN ('2016') -- Only include data for 2016
GROUP BY
  STRFTIME('%m', order_delivered_customer_date) -- Group the results by month number to calculate the average for each month