USE dn25;
SELECT * FROM worker;

# Q-15. Write an SQL query to fetch intersecting records of two tables.
SELECT Workers.*
FROM Workers
INNER JOIN Contractors
ON Workers.EmployeeID = Contractors.EmployeeID;

SELECT * FROM Workers WHERE EmployeeID IN (SELECT EmployeeID FROM Contractors);


# Q-16. Write an SQL query to show records from one table that another table does not have.
SELECT Workers.*
FROM Workers
LEFT JOIN Contractors
ON Workers.EmployeeID = Contractors.EmployeeID
WHERE Contractors.EmployeeID IS NULL;

SELECT Contractors.*
FROM Contractors
LEFT JOIN Workers
ON Workers.EmployeeID = Contractors.EmployeeID
WHERE Workers.EmployeeID IS NULL;

SELECT * FROM Workers WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Contractors);
SELECT * FROM Contractors WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Workers);


