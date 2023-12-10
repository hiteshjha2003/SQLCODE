/*
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  HireDate DATE,
  DepartmentID INT,
  Salary DECIMAL(10,2)
);


CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  DepartmentName VARCHAR(50),
  Location VARCHAR(50)
);



CREATE TABLE Projects (
  ProjectID INT PRIMARY KEY,
  ProjectName VARCHAR(50),
  StartDate DATE,
  EndDate DATE,
  DepartmentID INT,
  Budget DECIMAL(10,2)
);
*/



CREATE DATABASE SQL_JOINS

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);



CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);




INSERT INTO Customers (customer_id, customer_name, email)
VALUES
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'jane.smith@example.com'),
    (3, 'Michael Johnson', 'michael.johnson@example.com'),
    (4, 'Emily Davis', 'emily.davis@example.com'),
    (5, 'David Brown', 'david.brown@example.com'),
    (6, 'Sarah Wilson', 'sarah.wilson@example.com'),
    (7, 'Robert Taylor', 'robert.taylor@example.com'),
    (8, 'Olivia Anderson', 'olivia.anderson@example.com'),
    (9, 'Daniel Martinez', 'daniel.martinez@example.com'),
    (10, 'Sophia Thompson', 'sophia.thompson@example.com');



INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 1, '2023-07-01', 50.00),
    (2, 2, '2023-07-02', 75.50),
    (3, 3, '2023-07-03', 120.75),
    (4, 4, '2023-07-04', 200.00),
    (5, 5, '2023-07-05', 80.25),
    (6, 6, '2023-07-06', 150.50),
    (7, 7, '2023-07-07', 90.00),
    (8, 8, '2023-07-08', 60.75),
    (9, 9, '2023-07-09', 175.25),
    (10, 10, '2023-07-10', 100.00);



INSERT INTO Products (product_id, product_name, price)
VALUES
    (1, 'Laptop', 10.00),
    (2, 'PC', 15.50),
    (3, 'Phone', 20.25),
    (4, 'Earphone', 8.75),
    (5, 'Earpod', 12.50),
    (6, 'Speakers', 18.00),
    (7, 'Microphone', 14.75),
    (8, 'TV', 9.99),
    (9, 'Smart_TVs', 22.50),
    (10, 'Watch', 17.25);


SELECT * FROM Orders
SELECT * FROM Customers
SELECT * FROM Products
USE SQL_JOINS

SELECT  C.customer_id , O.order_date , C.customer_name
FROM Customers AS C
INNER JOIN 
Orders AS O
On
C.customer_id= O.order_id



SELECT  C.customer_id , O.order_date , C.customer_name
FROM Orders AS O
INNER JOIN 
Customers AS C
On
C.customer_id= O.order_id


-- WITHOUT ALIASES
SELECT Orders.order_id , Customers.customer_name , Products.product_name
FROM  Orders 
INNER JOIN Customers
ON Orders.order_id = Customers.customer_id
INNER JOIN Products
ON  Orders.order_id = Products.product_id

-- WITH ALIASES

SELECT O.order_id , C.customer_name , P.product_name
FROM  Orders AS O
INNER JOIN Customers AS C
ON O.order_id = C.customer_id
INNER JOIN Products AS P
ON  O.order_id = P.product_id


/*

LEFT JOIN:-
Return all the records from the left table(table1) and matching records from right table(table2) .

SELECT Column_names
FROM table_1(Left_table)
LEFT JOIN table_2 (right_table)
ON Table1.common_column = table2.common_columns


In different databases this LEFT JOIN is also called as LEFT OUTER JOIN

*/
--With ALiases
SELECT C.customer_name , O.order_date
FROM Customers AS C
LEFT JOIN  Orders AS O
ON C.customer_id = O.order_id


/*
RIGHT JOIN:--
Return all the records from the right table(table2) and matching records from left table(table1) .


SELECT Column_names
FROM table_1(Left_table)
RIGHT JOIN table_2 (right_table)
ON Table1.common_column = table2.common_columns


*/
SELECT C.customer_name , P.product_name
FROM Customers AS C
RIGHT JOIN  Products AS P
ON C.customer_id = P.product_id


/*
FULL OUTER JOIN:-
Returns all records when there is a match in left table (tabl1) and Right_table(Table2) 

SELECT Column_names
FROM table_1(Left_table)
FULL OUTER JOIN  table_2 (right_table)
ON Table1.common_column = table2.common_columns
WHERE Conditions

*/

SELECT Customers.customer_name  , Orders.total_amount  
FROM Customers
FULL OUTER JOIN  Orders ON
Customers.customer_id = Orders.order_id
ORDER BY Customers.customer_name


SELECT Customers.customer_name  , Orders.total_amount  
FROM Customers
FULL OUTER JOIN  Orders ON
Customers.customer_id = Orders.order_id
WHERE Customers.customer_id = 9



/*
SELF JOIN :--
Its a regular join  without using any JOIN KEYWORDS but the table is joined itself

SELECT Column_names 
FROM table1 , table2
WHERE COnditions


*/

SELECT A.customer_name  AS Customer_name1 , 
B.customer_name AS Customer_name2 , 
A.email
FROM Customers AS A , Customers AS B
WHERE A.customer_id <> B.customer_id
AND A.email = B.email
ORDER BY A.email


/*
GROUP BY :--
It will grp the rows that have same values into summary rows like

GROUP BY always implemented with Aggregate Functions

SQL having some functions:-
To perform particular task
Two type of Functions:
1) Aggregate Functions:-
COUNT() :--
MAX():--
MIN():--
SUM():--
AVG():--

2) Scalar Functions:-
LTRIM():-
RTRIM():--
CHARINDEX():-
SUBSTRING ():--
LEFT():-
RIGHT():-
UPPER():-
LOWER():-
INSTRING():--


Windows Functions:---

LEAD() :-
LAG() :--
RANK():-
ROW_NUMBER():--
OVER():--

...
...
....
...
...
.


3) User_Defined_Functions:--

*/


USE Hitesh
SELECT * FROM [dbo].[Customers$]

SELECT COUNT(customer_id)  AS Groups_Columns , customer_name
FROM Customers
GROUP BY customer_name

SELECT COUNT(CustomerKey) AS ANY_NAME  , Occupation
FROM Customers$
GROUP BY Occupation
ORDER BY COUNT(CustomerKey) DESC

SELECT MAX(AnnualIncome) AS Maximum_income  , Occupation
FROM Customers$
GROUP BY Occupation
ORDER BY COUNT(AnnualIncome) DESC



SELECT MIN(AnnualIncome) AS Minimum_income  , Occupation
FROM Customers$
GROUP BY Occupation
ORDER BY COUNT(AnnualIncome) DESC

/*


Views:----
Virtual Table

CRAETE  VIEW :----
CREATE VIEW view_name AS 
SELECT Column1  , column2,....
FROM table_name
WHERE Condition


RETRIEVE VIEW:-
SELECT * FROM View_name
Views will always show up-to-data 
*/


CREATE VIEW [MY VIEWS] AS 
SELECT FirstName, LastName , EmailAddress
FROM Customers$
WHERE CustomerKey = 11010

CREATE VIEW MYVIEWS AS 
SELECT * FROM Customers$
WHERE CustomerKey = 11010

SELECT * FROM [MY VIEWS]

SELECT * FROM MYVIEWS

CREATE VIEW [ Maximum Annual Income of Occupation] AS 
SELECT FirstName , LastName , EmailAddress  , AnnualIncome
FROM Customers$
WHERE AnnualIncome > (SELECT AVG(AnnualIncome) FROM Customers$)


CREATE VIEW [TOP_10 Maximum Annual Income of Occupation] AS 
SELECT TOP 10 FirstName , LastName , EmailAddress  , AnnualIncome
FROM Customers$
WHERE AnnualIncome > (SELECT AVG(AnnualIncome) FROM Customers$) 

SELECT * FROM [ Maximum Annual Income of Occupation]

SELECT * FROM [TOP_10 Maximum Annual Income of Occupation]




CREATE VIEW [SORTED TOP_10 Maximum Annual Income of Occupation] AS 
SELECT TOP 10 FirstName , LastName , EmailAddress  , AnnualIncome
FROM Customers$ 
WHERE AnnualIncome > (SELECT AVG(AnnualIncome) FROM Customers$ ) 
ORDER BY FirstName ASC  , LastName DESC


SELECT * FROM [SORTED TOP_10 Maximum Annual Income of Occupation]




