USE dn25;
SELECT * FROM Workers;

# Q-1. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT FIRST_NAME, REPLACE(FIRST_NAME, 'a', 'A') NEW_NAME FROM Workers;

# Q-2. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Workers
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

# Q-3. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME FROM Workers
WHERE SALARY = (SELECT MAX(SALARY) FROM Workers);









