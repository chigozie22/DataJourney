SELECT COUNT (ALL EmployeeID)

FROM Employee.Pay

SELECT COUNT (DISTINCT JobTitle)
FROM Employee.Pay

SELECT COUNT (ALL Salary)
FROM Employee.Pay

SELECT COUNT(*) AS TotalRows
FROM Employee.Pay

SELECT SUM(Salary) AS SUM_SALARY
FROM Employee.Pay

SELECT MAX(Salary) AS MAX_SALARY , MIN(SALARY) AS MIN_SALARY

FROM Employee.Pay

SELECT EmployeeID, JobTitle, Salary, Salary + Bonus AS TotalCompensation
FROM Employee.Pay

SELECT AVG(Salary + Bonus) AS AvgCompensation
FROM Employee.Pay
-- GROUP BY EmployeeID

SELECT  EmployeeID, City
FROM Employee.Employee
GROUP BY EmployeeID, City

SELECT COUNT(EmployeeID) AS NumberofEmployees, City
FROM Employee.Employee
GROUP BY City


SELECT COUNT(EmployeeID) AS EmployeeCount, City
FROM Employee.Employee
GROUP BY City
ORDER BY EmployeeCount DESC

SELECT EmployeeID, SUM(Salary + Bonus) AS TotalCompensation
FROM Employee.Pay
GROUP BY EmployeeID
HAVING SUM(Salary + Bonus) >= 3000

SELECT COUNT(EmployeeID) AS EmployeeCount, City
FROM Employee.Employee
GROUP BY City
HAVING COUNT(EmployeeID) > 3
ORDER BY COUNT(EmployeeID) DESC

SELECT COUNT(*) AS EmployeeCount, City
FROM Employee.Employee
GROUP BY City
HAVING COUNT(EmployeeID) > 3
ORDER BY 2 DESC, 1

SELECT EmployeeID, FirstName + ' ' + LastName AS FullName
FROM Employee.Employee

SELECT EmployeeID, LastName, FirstName, TRANSLATE(Phone, '0123456789', 'xxxxxxxxxx') AS PROTECTEDPHONE
FROM Employee.Employee

SELECT EmployeeID, UPPER(LastName) AS UpperLast, UPPER(FirstName) AS UpperFirst
FROM Employee.Employee 

SELECT EmployeeID, SUBSTRING(Phone, 6, 4) AS PHONENUM
FROM Employee.Employee

SELECT EmployeeID, LTRIM(RTRIM(EmployeeAddress)) AS LTtrimmedAddress, City
FROM Employee.Employee

SELECT EmployeeID, LEN(FirstName) AS FirstNameLength
FROM Employee.Employee

-- COALESCE FUNTION
SELECT EmployeeID, JobTitle, COALESCE(HourlyRate, 0) + COALESCE(Salary, 0) + COALESCE(Bonus, 0) AS TotalCompensation
FROM Employee.Pay 


SELECT EmployeeID, FirstName, LastName, RIGHT(Phone + REPLICATE('-', 15), 15) AS TrimmedNumbers
FROM Employee.Employee 

SELECT * FROM Employee.Employee

SELECT ProductID, LEFT(REPLICATE('.', 30) + ProductDescription, 30) AS FormattedDescription
FROM CustomerTab.CustomerProductTabl

SELECT ProductID, ProductDescription, CONVERT(DECIMAL, Cost) AS ConvertedCost

FROM CustomerTab.CustomerProductTabl

SELECT ProductID, ProductDescription, CAST(Cost AS DECIMAL (10,2 )) AS ConvertedCost

FROM CustomerTab.CustomerProductTabl

SELECT EmployeeID, FirstName + ' ' + LastName AS FullName, CONCAT(SUBSTRING(Phone, 1,3), '-',  SUBSTRING(Phone, 4, 3), '-',
SUBSTRING(Phone, 7,4), '-' ) AS FormattedPhone
FROM Employee.Employee


SELECT EmployeeID, LastDate, HireDate, DATEDIFF(YEAR, HireDate, LastDate) AS NumberofYears 

FROM Employee.Pay
WHERE DATEDIFF(YEAR, HireDate, LastDate) >= 7 AND YEAR(HireDate) BETWEEN 2001 AND 2009 
AND YEAR(LastDate) BETWEEN 2011 AND 2012


SELECT EmployeeID, 
        HireDate,
        LastDate,
        Salary AS CurrentSalary, Bonus,

        CASE
            WHEN    
                DATEDIFF(YEAR, HireDate, LastDate) >= 2 AND YEAR(LastDate) BETWEEN 2011 AND 2012
                THEN Salary * 1.05 

            ELSE    
                Salary
        END AS FutureSalary

    FROM Employee.Pay


    SELECT EmployeeID, 
            JobTitle, 
            HireDate,
            LastDate,
            Salary as NormalSalary, Bonus,
            
            CASE 
                WHEN    
                    JobTitle LIKE '%Manager%' 
                    THEN Salary * 1.1 
                
                ELSE
                    Salary * 1.05
            END AS ExpectedSalary

         
    
    FROM Employee.Pay

    WHERE YEAR(LastDate) BETWEEN 2011 AND 2012


    -- BONUS ON SALARY

    SELECT EmployeeID,
            HireDate,
            LastDate,
            JobTitle,
            Salary, Bonus as CurrentBonus,
            
            CASE 
                WHEN
                    JobTitle = 'Manager' AND MONTH(LastDate) = 1 THEN Salary * 0.10
                
                WHEN MONTH(GETDATE()) = 7  AND JobTitle <> 'Manager' THEN SALARY * 0.07

                ELSE 
                    SALARY * 0.05

            END AS ExpectedBonus

            FROM Employee.Pay

    
SELECT EmployeeID, 
        JobTitle, 
        HireDate,
        LastDate,
        Salary AS CurrentSalary,

        CASE 
            WHEN JobTitle = 'Salesman' AND DATEDIFF(YEAR, HireDate, GETDATE()) >= 5 
                THEN
                    Salary * 1.1
            
            WHEN JobTitle = 'Shipper' AND DATEDIFF(YEAR, HireDate, GETDATE()) >= 3
                THEN
                    Salary * 1.05

            ELSE
                Salary
        END AS SalaryIncrease

FROM Employee.Pay


SELECT EmployeeID, 
        JobTitle, 
        HourlyRate,
        Salary as NormalSalary,

        CASE    
            WHEN HourlyRate IS NOT NULL AND DATEDIFF(WEEK, HireDate, GETDATE()) > 0 THEN (40 * HourlyRate) + 
            ((CASE WHEN HourlyRate > 40 THEN (HourlyRate * 1.5) ELSE 0 END) * (DATEDIFF(WEEK, HireDate, GETDATE()) -1) * 40)

        ELSE
            Salary

        END AS AdjustedSalary



SELECT EmployeeID,
        HireDate, LastDate, JobTitle,

        CASE 
            WHEN    
                DATEDIFF(YEAR, HireDate, GETDATE()) > 5 THEN 15
            
            ELSE 
                10
            
            END AS VacationDays

FROM Employee.Pay

SELECT EmployeeID,
        HireDate, LastDate, JobTitle,

        CASE 
            WHEN    
                DATEDIFF(YEAR, HireDate, GETDATE()) >= 20 THEN 'Eligible For Retirement'
            
            ELSE 
                'Not Eligible'
                
            
            
            END AS RetirementList

FROM Employee.Pay


SELECT EmployeeID, JobTitle,
    CONVERT( NVARCHAR(10), HireDate, 120) AS HireDateFormatted,
    CONVERT(NVARCHAR(10), LastDate, 120) AS LastDayFormatted


FROM Employee.Pay

-- Anniversary message

SELECT EmployeeID, JobTitle, HireDate, LastDate,

CONCAT('Congratulations, " ', JobTitle,  ' " on your ', DATEDIFF(YEAR, HireDate, GETDATE()), ' -year Work Anniversary with us')
 AS AnniversaryMessage

FROM Employee.Pay

