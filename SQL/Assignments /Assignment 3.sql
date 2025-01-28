USE dn25;
SELECT * FROM Workers;

# Q-1. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) AS FIRST_NAME_TRIMMED
FROM Workers;

# Q-2. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) department_length from Workers;

# Q-3. Write an SQL query to fetch nth max salaries from a table.
SELECT SALARY FROM (SELECT SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS rnk FROM Workers) AS ranked_salaries
WHERE rnk = n;
# replace 'n' with the number corresponding to the position for which you want the salary.

WITH RankedSalaries AS (
SELECT salary,NTH_VALUE(salary, 5) OVER (ORDER BY salary DESC) AS nth_max_salary FROM workers)
SELECT DISTINCT nth_max_salary FROM RankedSalaries WHERE nth_max_salary IS NOT NULL;

SELECT FIRST_NAME, LAST_NAME, SALARY, NTH_VALUE(SALARY, 5) OVER(ORDER BY SALARY DESC) AS NTH_MAX_SALARY FROM workers LIMIT 1;







