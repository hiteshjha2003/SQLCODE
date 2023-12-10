/*
SQL Injection:--
I allows the attackers to spoof the identity  ,tamperr with the data  , able to destroy the data
change the trasanactions .

WITH PHP , and ASP 



*/
CREATE LOGIN sqlclass 
WITH PASSWORD = '1234'


/*
Dynamic Queries:--
is a Programming technique that can be used to write a sql queries during the runtime

DECLARE  , @

*/

DECLARE 
@variable_name data_type;

set @variable_name = value;

DECLARE  @MY_Var int
SET @MY_Var = 10
print @MY_Var

SELECT * FROM Customers$



DECLARE 
@FN VARCHAR(50)
SELECT @FN  = FirstName
FROM Customers$ 
WHERE CustomerKey = 11000
print @FN


DECLARE 
@find VARCHAR(50)
SET @find = 'J%'
SELECT * FROM Customers$
WHERE LastName LIKE @find


DECLARE
@Salary int
SELECT @Salary = AnnualIncome
FROM Customers$
WHERE CustomerKey = 12580
If @Salary > 150000
	print ' The Customer is Rich'
else
	print 'The Customer is from Middle Class'


-- Begin - End
DECLARE
@Salaries int
SELECT @Salaries = AnnualIncome
FROM Customers$
WHERE CustomerKey = 11000
If @Salaries =  90000
	BEGIN 
	   print ' The Customer  is fine with her income'
	   UPDATE Customers$ 
	   Set FirstName = 'Shreya' 
	   WHERE CustomerKey = 11000
	END

else
	print 'The Customer is good'




SELECT FirstName FROM Customers$
WHERE CustomerKey = 11000;

SELECT * FROM Customers$
-- WHILE 
WHILE
(SELECT AnnualIncome FROM Customers$ where CustomerKey = 29483) < 100000
BEGIN
	Update Customers$ SET AnnualIncome = AnnualIncome*2
END 
SELECT * FROM Customers$


/*


DBMS Normalization:--
	It is a process to eliminate data redundancy(Duplicate data) so that it can ensures the
	data integrity in SQL.


	Failure to eliminate the anomalies leads to Data redundancy

	Normalization works with through series of stages and these stages is called 
	Normal Forms
	We have five types of Normal Forms
	1NF:----
		Eliminate the Repeating groups
	2NF:---
		Eliminate the Partial Functional Dependency
	3NF:--
		Eliminate  repeating Clusters
	BCNF:--
		Will Use all the abobe NFs
	5NF:---
		JOIN <FUNVCTONL , MULTIVAL ,FUCTIN 
*/


/*   
Hands-On Projects;--








*/


SELECT @@SERVERNAME