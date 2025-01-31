USE dn25;
SELECT * FROM workers;

# Q-17.  Write an SQL query to show the top n (say 10) records of a table.
SELECT * FROM workers LIMIT 10;
SELECT * FROM workers ORDER BY EmployeeID LIMIT 10;

# Q-18. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT SALARY FROM workers
WHERE SALARY < (SELECT MAX(SALARY) FROM workers)
ORDER BY SALARY DESC
LIMIT 1 OFFSET 3;

SELECT SALARY FROM Workers
ORDER BY SALARY DESC
LIMIT 1 OFFSET 4;
