USE dn25;
SELECT * FROM Workers;

# Q-1. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3) short_name FROM Workers; 

SELECT FIRST_NAME, LEFT(FIRST_NAME, 3) AS First_3_char FROM Workers;

# Q-2. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') Position_a FROM Workers;

SELECT POSITION('a' IN FIRST_NAME) AS POSITION_OF_A
FROM Workers
WHERE FIRST_NAME = 'Amitabh';

# Q-3. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT FIRST_NAME, DEPARTMENT, SALARY
FROM Workers
WHERE SALARY IN (SELECT MAX(SALARY) FROM Worker GROUP BY DEPARTMENT);
