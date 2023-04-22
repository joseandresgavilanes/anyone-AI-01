-- TODO: This query will return a table with the top 10 least revenue categories 
-- in English, the number of orders and their total revenue. The first column 
-- will be Category, that will contain the top 10 least revenue categories; the 
-- second one will be Num_order, with the total amount of orders of each 
-- category; and the last one will be Revenue, with the total revenue of each 
-- catgory.
-- HINT: All orders should have a delivered status and the Category and actual 
-- delivery date should be not null.

SELECT
    c.Category,
    COUNT(DISTINCT o.OrderID) AS Num_order,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM
    Categories c
    JOIN Products p ON c.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
WHERE
    o.ShippedDate IS NOT NULL
GROUP BY
    c.Category
HAVING
    SUM(od.Quantity * od.UnitPrice) < (
        SELECT
            SUM(od.Quantity * od.UnitPrice) as Total_revenue
        FROM
            OrderDetails od
            JOIN Orders o ON od.OrderID = o.OrderID
        WHERE
            o.ShippedDate IS NOT NULL
    ) / 10
ORDER BY
    SUM(od.Quantity * od.UnitPrice) ASC
LIMIT
    10;