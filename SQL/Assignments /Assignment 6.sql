USE dn25;
SELECT * FROM Workers;


# Q-1. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Workers
WHERE JOIN_DATE BETWEEN '2014-02-01' AND '2014-02-28';

SELECT * FROM Workers
WHERE MONTH(JOIN_DATE) = 2 AND YEAR(JOIN_DATE) = 2014;

# Q-2. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT, COUNT(*) AS DuplicateCount
FROM Workers
GROUP BY FIRST_NAME, LAST_NAME, DEPARTMENT
HAVING COUNT(*) > 1;

# Q-3. How to remove duplicate rows from Employees table.
WITH CTE AS (
SELECT EmployeeID,FIRST_NAME,LAST_NAME,DEPARTMENT,SALARY,JOIN_DATE,Email,
	ROW_NUMBER() OVER (PARTITION BY FIRST_NAME, LAST_NAME, DEPARTMENT ORDER BY EmployeeID) AS row_num FROM Workers)
DELETE FROM Workers
WHERE EmployeeID IN (SELECT EmployeeID FROM CTE WHERE row_num > 1);

