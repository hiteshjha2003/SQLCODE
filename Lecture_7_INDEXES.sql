/*
SQL INDEX:-------


Indexes:--

Inorder to retreive the data very fast.
Special Lookup Tables

SQL Index:--
It is an effective way to quickly retrieve data from Databases.


Indexes Types:--

1) Clustered Indexes:-
		Sort the data and store rows data in a table or view based on fundamental values
2) Non-Clustered Indexes:-
	Non-Clustered key -- Row Locator 

3) Unique Indexes:-
Avoid Redundant data 


4) Filtered Indexes:-
Filtering with which Clause (WHERE)

5) Full-text Indexes:- Quering the large datawarehouses.

6) Hash Indexes:-  N- Buckets or slots contains pointer this pointer will apply Hash Functon(K, n) 



*/


/*
CREATE INDEX index_name 
ON
Table_name (Column_Namess)

*/


USE Hitesh
SELECT * FROM Customers$



-- CReating the index on Single Field:-
CREATE INDEX cust_index 
ON 
Customers$(CustomerKey)

EXEC sys.sp_helpindex @objname = N'Customers$';


-- Craeting the index on multiple fields:-

CREATE INDEX cust_indexs
ON 
Customers$(CustomerKey , FirstName)

EXEC sys.sp_helpindex @objname = N'Customers$';

DROP INDEX cust_index
on Customers$



CREATE  UNIQUE INDEX cust_indexes 
ON 
Customers$(CustomerKey)




--Clsutered Index:-
/*
CREATE CLUSTERED INDEX <index_name>
ON [schema].<table_name> (Column_name[asc|desc]);

*/
CREATE CLUSTERED INDEX CIX_Customers_table_CustKey
on dbo.Customers$ (CustomerKey DESC)
SELECT * FROM Customers$




/*

Built-in Functions:--





*/

-- Date Functions:-

SET DATEFIRST 5
SELECT @@DATEFIRST AS FirstDay


SET LANGUAGE us_english;
SELECT @@DATEFIRST AS Result

SET DATEFIRST 7
SELECT @@DATEFIRST AS FirstDay
SELECT GETDATE() AS TodayDate ,
DATEPART(dw , SYSDATETIME()) AS TODAY; 

SELECT CURRENT_TIMESTAMP


-- DATEADD() functions:-

-- DATEADD( datepart , number , date)
/*
Datepart :-
year , yyyy , yy :- year
quarter  , qq , q :- Quarter
month , mm ,m :- Month
dayofyear , dy :- 

*/
SELECT DATEADD(YEAR , 7 , '2023/02/14') AS RESULTS_DATE

/*
DATEDIFF():-
Used to return the difference between two dates or times


DATEDIFF(datepart , date1 , date2)
*/
SELECT  DATEDIFF(YEAR , '2023/03/15' , '2033/02/14')



/*

AGGREGATE FUNCTION:--
MAX()
MIN()
AVG()
COUNT()

*/

SELECT MAX(AnnualIncome) FROM Customers$


SELECT MIN(AnnualIncome) FROM Customers$


SELECT AVG(AnnualIncome) FROM Customers$

SELECT COUNT(AnnualIncome) FROM Customers$

SELECT STDEV(AnnualIncome) FROM Customers$


SELECT VAR(AnnualIncome) FROM Customers$

SELECT AnnualIncome   , SUM(AnnualIncome) AS SALARY_SUM , 
GROUPING(AnnualIncome) AS GROUPING
FROM Customers$ GROUP BY AnnualIncome 



/*
STRING FUNCTIONS:--
ASCII()

CHAR()

CHARINDEX()

CONCAT()


DIFFERENCE()

FORMAT()

LEN()
LOWER()
UPPER()
LTRIM()
RTRIM()
TRIM()
PATINDEX()

REPLACE()

REVERSE()
RIGHT()
LEFT()
STR()
SUBSTRING()


*/


SELECT ASCII('SQL Is a Structured Query Language')

SELECT ASCII('b')

--CHAR():--


SELECT CHAR(97) AS aCOLUMN   , CHAR(65) AS ACOLUMNS


--CHARINDEX(substring , string , start):-

SELECT * FROM Customers$

SELECT CHARINDEX('s' ,'ql is a very bad bad langauge' ) AS CHARINDEXS

SELECT CHARINDEX('A' , FirstName )  AS EACHROWS FROM Customers$

--CONCAT(str1 , str2) 

SELECT CONCAT('Snehal ' , 'Patil') AS NAMEs

SELECT CONCAT(FirstName ,'  ' , LastName) AS FULL_NAME FROM Customers$

--LEFT(str , length)
SELECT LEFT('Strcutured' , 5) AS LeftFunction


SELECT RIGHT('   Strcutured' , 5) AS LeftFunction


SELECT RTRIM('Strcutured   ') AS RTRIMFunction

SELECT LTRIM('   Strcutured   ') AS LTRIMFunction

-- SBSTRING(string , Start , length)
SELECT SUBSTRING('SQL Classes' , 2 , 6) AS SUBSTRINGFUNCTION


/*
AND 
OR 
CASE 

*/

-- AND :- If both condition is true then it is true otherwise it is false
/*
P  Q     Result
T  T        T
T  F        F
F  T        F
F  F        F
*/

SELECT * FROM Customers$


SELECT FirstName 
FROM Customers$
WHERE AnnualIncome > 150000  AND TotalChildren >3

/*
OR:- If any one of the condition is true then  result  is true
P  Q     Result
T  T        T
T  F        T
F  T        T
F  F        F
*/


SELECT FirstName 
FROM Customers$
WHERE AnnualIncome > 15000000 OR  TotalChildren >5




/*

CASE :--

*/

SELECT FirstName  , LastName ,
CASE
	WHEN AnnualIncome > 150000 THEN 'He is Rich'
	WHEN  AnnualIncome < 15000 THEN 'He is Also Rich'
	WHEN  AnnualIncome > 15000 AND AnnualIncome < 150000 THEN 'He is Middle Class'
	ELSE 'He is Poor'
END AS RESULT
FROM 
Customers$


/*

Injection:-
Normalization:-
Dynamic Queries:-
Cusrors:-
CTE :-


HANDS-ON PROJECT WITH Visualizations

*/


