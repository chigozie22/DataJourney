SELECT E.FirstName,
        E.LastName,
        EP.Bonus


FROM Employee.Pay EP

INNER JOIN Employee.Employee E ON EP.EmployeeID = E.EmployeeID

-- CODE BELOW DOES NOT WORK IN SQL SERVER
-- WHERE EP.Bonus = (SELECT DISTINCT Bonus
--                 FROM Employee.Pay
--                 ORDER BY EP.Bonus DESC
--                  LIMIT 5)

WHERE EP.Bonus IN (SELECT TOP 5 Bonus FROM Employee.Pay)
ORDER BY EP.Bonus DESC


SELECT CU.CustomerName,
        CT.OrderQuantity


FROM CustomerTab.CustomerTabl CU 

INNER JOIN CustomerTab.CustomerOrdersTabl CT ON CU.CustomerID = CT.CustomerID
WHERE CT.OrderQuantity IN (SELECT OrderQuantity FROM CustomerTab.CustomerOrdersTabl 
    WHERE OrderQuantity > 25
    )

-- SELECT CustomerName 

-- FROM CustomerTab.CustomerTabl

-- WHERE CustomerID IN (SELECT CustomerID FROM CustomerTab.CustomerOrdersTabl
--     GROUP BY CustomerID
--     HAVING SUM(OrderQuantity) > 25
--     )


SELECT CT.CustomerID,
        CP.Cost
        

FROM CustomerTab.CustomerOrdersTabl CT

INNER JOIN CustomerTab.CustomerProductTabl CP ON CT.ProductID = CP.ProductID

WHERE CP.Cost IN (SELECT TOP 10 Cost FROM CustomerTab.CustomerProductTabl)

ORDER BY CP.Cost DESC





SELECT CustomerID, ROUND(SUM(Total_Order), 2) AS TotalAmount

FROM (SELECT CustomerID, CP.Cost * CO.OrderQuantity AS Total_Order

        FROM CustomerTab.CustomerOrdersTabl CO 
        INNER JOIN CustomerTab.CustomerProductTabl CP ON CO.ProductID = CP.ProductId) AS Customer_Order

GROUP BY CustomerID
ORDER BY TotalAmount DESC


SELECT CP.ProductDescription, CP.ProductID

FROM CustomerTab.CustomerProductTabl CP

LEFT JOIN CustomerTab.CustomerOrdersTabl CO ON CP.ProductID = CO.ProductID

WHERE CP.ProductID NOT IN (SELECT DISTINCT ProductID FROM CustomerTab.CustomerOrdersTabl)
ORDER BY CAST(CP.ProductID AS INT) ASC

-- ANOTHER METHOD 


SELECT CP.ProductDescription, CP.ProductID

FROM CustomerTab.CustomerProductTabl CP

LEFT JOIN (SELECT DISTINCT ProductID FROM CustomerTab.CustomerOrdersTabl) AS ordered_products

ON CP.ProductID =  ordered_products.ProductID

WHERE ordered_products.ProductID IS NULL

ORDER BY CP.ProductID DESC


SELECT CustomerID,  AVG(TotalPrice) AS AveragePrice


FROM (SELECT  CustomerID, CP.Cost * CO.OrderQuantity AS TotalPrice  FROM CustomerTab.CustomerProductTabl CP
LEFT JOIN CustomerTab.CustomerOrdersTabl CO ON CP.ProductID = CO.ProductID
    ) AS Customer

GROUP BY CustomerID
HAVING AVG(TotalPrice) > 50



SELE


INNER JOIN (SELECTEmployee.Employee E2 ON E1.HireDate = E2.HireDate

SELECT  MAX(Salary)

FROM  Employee.Pay