USE dn25;
SELECT * FROM Workers;

# Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME
FROM Workers;

# Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT
FROM Workers;

# Q-3. Write an SQL query to show the last 5 record from a table.
SELECT * FROM Workers
ORDER BY JOIN_DATE DESC
LIMIT 5;

