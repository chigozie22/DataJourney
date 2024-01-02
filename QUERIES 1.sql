SELECT *

FROM CustomerTab.CustomerProductTabl

SELECT 
DISTINCT (ProductID)

FROM CustomerTab.CustomerOrdersTabl

SELECT *

FROM CustomerTab.CustomerProductTabl where Cost < 1

SELECT *

FROM CustomerTab.CustomerProductTabl where Cost BETWEEN 2 AND 5 

SELECT *

FROM CustomerTab.CustomerProductTabl where Cost > 6

SELECT * 

FROM CustomerTab.CustomerProductTabl where ProductID = 2 OR ProductID = 567 OR ProductID = 89

SELECT * 

FROM CustomerTab.CustomerProductTabl where ProductID IN (2, 567, 89)

SELECT ProductID, ProductDescription, Cost

FROM CustomerTab.CustomerProductTabl where ProductDescription = 'Phone Stand'

SELECT PRODUCTID, CustomerID, OrderQuantity, OrderDate

FROM CustomerTab.CustomerOrdersTabl WHERE NOT OrderQuantity = 5

SELECT ProductDescription, ProductID, COST

FROM CustomerTab.CustomerProductTabl WHERE ProductDescription LIKE '%Set%'