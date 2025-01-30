USE dn25;
SELECT * FROM worker;

# Q-19. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT SALARY FROM Workers
WHERE SALARY = (SELECT MAX(SALARY)FROM Workers
WHERE SALARY < (SELECT MAX(SALARY)FROM Workers
WHERE SALARY < (SELECT MAX(SALARY)FROM Workers
WHERE SALARY < (SELECT MAX(SALARY)FROM Workers
WHERE SALARY < (SELECT MAX(SALARY)FROM Workers)))));

SELECT DISTINCT SALARY FROM workers w1
WHERE 4 = (SELECT COUNT(DISTINCT Salary) FROM workers w2 WHERE w2.SALARY > w1.SALARY);

# Q-20. Write an SQL query to fetch the list of employees with the same salary.
SELECT FIRST_NAME, SALARY FROM workers
WHERE SALARY IN ( SELECT SALARY FROM Workers GROUP BY SALARY HAVING COUNT(*) > 1);



