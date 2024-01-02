SELECT  * FROM DimProduct
WHERE DimProduct.Color iS NOT NULL AND DimProduct.Color NOT IN ('Black', 'Silver', 'White') AND DimProduct.ListPrice BETWEEN 75 AND 750



SELECT TOP(10) ProductKey, ModelName, Color, ProductAlternateKey

FROM dbo.DimProduct

WHERE ProductAlternateKey LIKE 'BK%'

ORDER BY ProductKey


SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    CONCAT(LEFT(LastName, 4), '', '@adventureworks.com') AS EMAIL,
    LEN(CONCAT(FirstName, '', LastName)) AS Name_Length

FROM dbo.DimCustomer

WHERE LEFT(LastName, 1) = LEFT(FirstName, 1)
AND LEFT(LastName, 4) = LEFT(EmailAddress, 4)

-- SELECT TOP(100) * FROM dbo.DimCustomer 
-- WHERE FirstName LIKE '%Edward%'
-- ORDER BY FirstName, Lastname


SELECT DP.ProductKey, DS.ProductSubcategoryKey, DaysToManufacture

 FROM dbo.DimProduct DP

INNER JOIN dbo.DimProductSubcategory  DS ON DP.ProductSubcategoryKey = DS.ProductSubcategoryKey
WHERE DaysToManufacture >= 3


SELECT EmployeeKey,
        CONCAT(FirstName, ' ', LastName ) AS FullName,
        DATEDIFF(YEAR, HireDate, GETDATE()) AS Years_Worked

FROM dbo.DimEmployee

WHERE (DATEDIFF(YEAR, HireDate, GETDATE()) +5) >= 20


SELECT EmployeeKey,
        CONCAT(FirstName, ' ', LastName) AS FullName,
        (65 - (DATEDIFF(YY, BirthDate, GETDATE()))) AS YearsTo65

FROM dbo.DimEmployee

WHERE (65 - (DATEDIFF(YY, BirthDate, GETDATE()))) >= 0



SELECT ProductKey, 
        Color,
        ModelName,
        ListPrice,
        
        
CASE 
    WHEN Color = 'White' THEN (ListPrice * 1.08)
    WHEN Color = 'Yellow' THEN (ListPrice *(1-0.075))
    WHEN Color = 'Black' THEN (ListPrice * 1.172)
    WHEN COLOR IN ('Silver/Black', 'Blue', 'Multi') THEN (2*(SQRT(ListPrice)))

    ELSE 
        ListPrice

END AS 'NewPricing',

CASE 
    WHEN Color = 'White' THEN (ListPrice * 1.08 * 0.375)
    WHEN Color = 'Yellow' THEN (ListPrice * (1-0.075) * 0.375)
    WHEN Color = 'Black' THEN (ListPrice * 1.172)
    WHEN Color IN ('Silver/Black', 'Blue', 'Multi') THEN (2*(SQRT(ListPrice))* 0.375)

    ELSE
        ListPrice * 0.375

END AS 'Commission'
FROM dbo.DimProduct


SELECT  FirstName, LastName, HireDate, SickLeaveHours, DT.SalesTerritoryRegion

 FROM DimEmployee DE

 INNER JOIN DimSalesTerritory DT ON DE.SalesTerritoryKey = DT.SalesTerritoryKey


 SELECT *  FROM FactResellerSales



 SELECT DISTINCT ProductKey,
        OrderDateKey,
         (TotalProductCost - DiscountAmount) * OrderQuantity AS ProductCost,
         ROUND(SalesAmount -(TotalProductCost- DiscountAmount), 2) * OrderQuantity AS Profit

FROM FactInternetSales

UNION

SELECT  ProductKey,
        SUM(TotalProductCost - DiscountAmount) * OrderQuantity AS ProductCost,
        ROUND(SUM(SalesAmount- (TotalProductCost - DiscountAmount)), 2) * OrderQuantity AS Profit

FROM FactResellerSales

GROUP BY ProductKey

