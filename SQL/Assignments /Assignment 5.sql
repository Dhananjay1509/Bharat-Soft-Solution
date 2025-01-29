USE dn25;
SELECT * FROM Workers;

# Q-1. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM Workers
WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

# Q-2. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM Workers
WHERE FIRST_NAME like '_____h';

# Q-3. Write a query to validate Email of Employee.
SELECT * FROM Workers
WHERE Email like '%@%.%';


