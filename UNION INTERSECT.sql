SELECT ProductID,
        ProductDescription,
        Cost,
        'Top Selling' AS SalesCategory

FROM CustomerTab.CustomerProductTabl
WHERE ProductID IN (SELECT TOP 5 ProductID FROM CustomerTab.CustomerProductTabl
    ORDER BY Cost DESC
    )

UNION

SELECT ProductID,
        ProductDescription,
        Cost,
        'Least Selling' AS SalesCategory

FROM CustomerTab.CustomerProductTabl

WHERE ProductID IN (SELECT TOP 5 ProductID FROM CustomerTab.CustomerProductTabl
    ORDER BY Cost ASC
    )