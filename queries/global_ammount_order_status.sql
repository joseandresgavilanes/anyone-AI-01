-- TODO: This query will return a table with two columns; order_status, and
-- Ammount. The first one will have the different order status classes and the
-- second one the total ammount of each.
SELECT
  order_status, -- Use the order_status column as the order_status column
  COUNT(*) AS Amount -- Count the number of rows in each group and name it Amount
FROM
  orders -- Select from the orders table
GROUP BY
  order_status -- Group the results by order_status to calculate totals for each status
