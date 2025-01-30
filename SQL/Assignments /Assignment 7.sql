USE dn25;
SELECT * FROM Workers;

# Q-13. Write an SQL query to show only odd rows from a table.
SELECT * FROM Workers 
WHERE MOD(EmployeeID, 2) = 1;

# Q-14. Write an SQL query to clone a new table from another table.
CREATE TABLE Worker_Clone AS SELECT * FROM Workers;
