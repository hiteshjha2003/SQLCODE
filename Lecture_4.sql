SELECT * FROM Class
SELECT * FROM Customer
SELECT * FROM Orders





-- Adding new columns
ALTER TABLE  Orders
ADD Item_name VARCHAR(50)


-- DELETING the Columns
ALTER TABLE Orders
DROP COLUMN  Item_name 


-- To change the DATATYPE
ALTER TABLE Orders
ALTER COLUMN OrderDesc Text



SELECT * FROM Customer



UPDATE Customer
SET
AreaCode = 400032
WHERE 
Cust_Id = 6




-- Delete specific  rowsss

DELETE FROM Orders
WHERE OrderId = 3


-- Deleting whole rows from table
DELETE FROM Orders







---- SELECT STATEMENT

SELECT * FROM [dbo].[Customers$]

SELECT * FROM Customers$


SELECT
CustomerKey , 
FirstName, 
LastName
FROM 
Customers$


SELECT 
CustomerKey 
FROM
Customers$






--- ORDER BY Keyword
 -- In Ascending Order
SELECT  
LastName , 
CustomerKey 
FROM 
Customers$
ORDER BY  LastName 


-- IN descending Order
SELECT  
LastName , 
CustomerKey 
FROM 
Customers$
ORDER BY  LastName DESC



-- Select Unique Records from the table:-

SELECT DISTINCT 
FirstName
FROM 
Customers$


SELECT * FROM Customers$
-- WHERE CLAUSE :--

-- Selecting the whole rows
SELECT * FROM
Customers$
WHERE CustomerKey = 11009



-- Selecting Specific column of that row
SELECT 
FirstName  , 
LastName
FROM 
Customers$
WHERE 
CustomerKey = 11009




-- Give me that records whose annual income is greater then 500000

SELECT * FROM 
Customers$
WHERE
AnnualIncome > 100000


SELECT * FROM 
Customers$
WHERE
AnnualIncome <= 100000


SELECT * FROM
Customers$
WHERE 
LastName = 'ZHU'


SELECT 
FirstName , 
LastName , 
CustomerKey
FROM 
Customers$
WHERE
FirstName <> 'JEFFERY'





-- I want firstname  , lastname and customerkey whose annual income is between 30000 to 90000

SELECT
FirstName , LastName , CustomerKey
FROM Customers$
WHERE AnnualIncome BETWEEN 30000 AND 90000


SELECT EmailAddress
FROM 
Customers$
WHERE  TotalChildren BETWEEN  2 AND 4


-- IN Operator :--

SELECT * FROM 
Customers$
WHERE CustomerKey IN (11000 , 11020 , 11002 ,11003)



SELECT EmailAddress FROM 
Customers$
WHERE FirstName IN ('JON', 'CHRISTY' , 'JORDAN' ,'RUBEN')


SELECT * FROM Customers$
-- Like Operators :--

--%

-- Starting with some letter then LIKE 'a%' or LIKE 'A%'
SELECT * FROM 
Customers$
WHERE FirstName LIKE 'J%'



-- Ending with some letter then LIKE '%a' or LIKE '%A'
SELECT * FROM
Customers$
WHERE FirstName LIKE '%A'


--IN between word LIKE '%A%'
SELECT * FROM
Customers$
WHERE FirstName LIKE '%Q%'


-- (_) Wildcards:--


--2nd Position
SELECT * FROM
Customers$
WHERE FirstName LIKE '_A%'


SELECT * FROM
Customers$
WHERE FirstName LIKE 'A_%'



-- 3rd Position
SELECT * FROM
Customers$
WHERE FirstName LIKE '__A%'


SELECT * FROM
Customers$
WHERE FirstName LIKE '%__A%'



-- Start with something and end with something

SELECT * FROM
Customers$
WHERE FirstName LIKE 'S%A'


--COmbination of two or three letters in betweeen

SELECT * FROM 
Customers$
WHERE FirstName LIKE '%IE%'


SELECT * FROM 
Customers$
WHERE FirstName LIKE '%AAA%'






-- AND Operators




-- OR Operators





-- NOT Operators




-- TOP Clause



-- ALIAS







