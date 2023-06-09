-- TODO: This query will return a table with the revenue by month and year. It
-- will have different columns: month_no, with the month numbers going from 01
-- to 12; month, with the 3 first letters of each month (e.g. Jan, Feb);
-- Year2016, with the revenue per month of 2016 (0.00 if it doesn't exist);
-- Year2017, with the revenue per month of 2017 (0.00 if it doesn't exist) and
-- Year2018, with the revenue per month of 2018 (0.00 if it doesn't exist).
SELECT
    RIGHT(CONCAT('0', MONTH(OrderDate)), 2) AS month_no,
    LEFT(DATENAME(month, OrderDate), 3) AS month,
    SUM(CASE WHEN YEAR(OrderDate) = 2016 THEN (UnitPrice * Quantity) ELSE 0 END) AS Year2016,
    SUM(CASE WHEN YEAR(OrderDate) = 2017 THEN (UnitPrice * Quantity) ELSE 0 END) AS Year2017,
    SUM(CASE WHEN YEAR(OrderDate) = 2018 THEN (UnitPrice * Quantity) ELSE 0 END) AS Year2018
FROM
    Orders
    JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY
    MONTH(OrderDate),
    DATENAME(month, OrderDate)
ORDER BY
    MONTH(OrderDate)