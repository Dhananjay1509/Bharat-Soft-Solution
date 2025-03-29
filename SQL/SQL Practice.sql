# purpose
# best practice
show create TABLE employees;
-- Switch to the database 'w2'
USE w2;
select * from employees;
DESCRIBE employees;
DESCRIBE departments;
-- Create the 'employees' table with various data types
CREATE TABLE employees (
    id INT PRIMARY KEY,                     -- Unique identifier for each employee
    first_name VARCHAR(50),                 -- Employee's first name
    last_name VARCHAR(50),                  -- Employee's last name
    department VARCHAR(20),                 -- Department the employee belongs to
    salary DECIMAL(10, 2),                  -- Employee's salary
    join_date DATE,                         -- Date the employee joined
    is_active BOOLEAN                       -- Whether the employee is active
);

-- Create the 'departments' table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each department
    department_name VARCHAR(50) UNIQUE NOT NULL    -- Name of the department
);

-- Add a 'department_id' column to the 'employees' table to establish a relationship with 'departments'
ALTER TABLE employees 
ADD COLUMN department_id INT;

-- Add a foreign key constraint to link 'department_id' in 'employees' to 'department_id' in 'departments'
ALTER TABLE employees
ADD CONSTRAINT employees_ibfk_1 FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Modify the 'department_id' column in the 'departments' table to be AUTO_INCREMENT
ALTER TABLE departments
MODIFY COLUMN department_id INT AUTO_INCREMENT;

-- Remove the UNIQUE constraint from 'department_name' in the 'departments' table
ALTER TABLE departments
DROP INDEX department_name;

-- Temporarily drop the foreign key constraint to truncate the 'departments' table
ALTER TABLE employees DROP FOREIGN KEY employees_ibfk_1;

-- Truncate the 'departments' table to clear all data
TRUNCATE TABLE departments;

-- Re-add the foreign key constraint after truncating the table
ALTER TABLE employees
ADD CONSTRAINT employees_ibfk_1 FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Insert new data into the 'departments' table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Finance'),
(2, 'HR'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Operations'),
(6, 'IT'),
(7, 'R&D'),
(8, 'Customer Service');

ALTER TABLE employees
MODIFY id INT NOT NULL AUTO_INCREMENT;

-- To avoid duplicates by enforcing uniqueness:
ALTER TABLE employees ADD UNIQUE (last_name, department, first_name);

ALTER TABLE employees AUTO_INCREMENT = 1;
-- Insert initial data into the 'employees' table
INSERT INTO employees (first_name, last_name, department, salary, join_date, is_active, department_id)
VALUES
('John', 'Doe', 'Marketing', 60000.00, '2023-05-15', 1, 3),
('Alice', 'Johnson', 'Sales', 55000.00, '2023-06-20', 1, 4),
('David', 'Wilson', 'Operations', 50000.00, '2023-07-25', 1, 5),
('Emma', 'Brown', 'R&D', 80000.00, '2023-08-30', 1, 7),
('James', 'Miller', 'Customer Service', 48000.00, '2023-09-10', 1, 8),
('Olivia', 'Davis', 'Finance', 72000.00, '2023-10-15', 1, 1),
('William', 'Garcia', 'IT', 77000.00, '2023-11-20', 1, 6),
('Sophia', 'Martinez', 'HR', 53000.00, '2023-12-25', 1, 2),
('Michael', 'Taylor', 'Marketing', 62000.00, '2023-05-16', 1, 3),
('Emily', 'Anderson', 'Sales', 56000.00, '2023-06-21', 1, 4),
('Daniel', 'Thomas', 'Operations', 51000.00, '2023-07-26', 1, 5),
('Mia', 'Jackson', 'R&D', 81000.00, '2023-08-31', 1, 7),
('Ethan', 'White', 'Customer Service', 49000.00, '2023-09-11', 1, 8),
('Ava', 'Harris', 'Finance', 73000.00, '2023-10-16', 1, 1),
('Alexander', 'Martin', 'IT', 78000.00, '2023-11-21', 1, 6),
('Charlotte', 'Thompson', 'HR', 54000.00, '2023-12-26', 1, 2),
('Benjamin', 'Moore', 'Marketing', 63000.00, '2023-05-17', 1, 3),
('Amelia', 'Clark', 'Sales', 57000.00, '2023-06-22', 1, 4),
('Lucas', 'Lewis', 'Operations', 52000.00, '2023-07-27', 1, 5),
('Harper', 'Walker', 'R&D', 82000.00, '2023-09-01', 1, 7),
('Henry', 'Hall', 'Customer Service', 50000.00, '2023-09-12', 1, 8),
('Ella', 'Young', 'Finance', 74000.00, '2023-10-17', 1, 1),
('Sebastian', 'Allen', 'IT', 79000.00, '2023-11-22', 1, 6),
('Grace', 'King', 'HR', 55000.00, '2023-12-27', 1, 2),
('Jackson', 'Wright', 'Marketing', 64000.00, '2023-05-18', 1, 3),
('Lily', 'Scott', 'Sales', 58000.00, '2023-06-23', 1, 4),
('Jack', 'Green', 'Operations', 53000.00, '2023-07-28', 1, 5),
('Chloe', 'Adams', 'R&D', 83000.00, '2023-09-02', 1, 7),
('Samuel', 'Baker', 'Customer Service', 51000.00, '2023-09-13', 1, 8),
('Zoe', 'Nelson', 'Finance', 75000.00, '2023-10-18', 1, 1),
('Owen', 'Carter', 'IT', 80000.00, '2023-11-23', 1, 6),
('Riley', 'Mitchell', 'HR', 56000.00, '2023-12-28', 1, 2),
('Gabriel', 'Perez', 'Marketing', 65000.00, '2023-05-19', 1, 3),
('Hannah', 'Roberts', 'Sales', 59000.00, '2023-06-24', 1, 4),
('Carter', 'Turner', 'Operations', 54000.00, '2023-07-29', 1, 5),
('Victoria', 'Phillips', 'R&D', 84000.00, '2023-09-03', 1, 7),
('Wyatt', 'Campbell', 'Customer Service', 52000.00, '2023-09-14', 1, 8),
('Addison', 'Parker', 'Finance', 76000.00, '2023-10-19', 1, 1),
('Jayden', 'Evans', 'IT', 81000.00, '2023-11-24', 1, 6),
('Layla', 'Edwards', 'HR', 57000.00, '2023-12-29', 1, 2),
('Luke', 'Collins', 'Marketing', 66000.00, '2023-05-20', 1, 3),
('Nora', 'Stewart', 'Sales', 60000.00, '2023-06-25', 1, 4),
('Grayson', 'Sanchez', 'Operations', 55000.00, '2023-07-30', 1, 5),
('Eleanor', 'Morris', 'R&D', 85000.00, '2023-09-04', 1, 7),
('Levi', 'Rogers', 'Customer Service', 53000.00, '2023-09-15', 1, 8),
('Hazel', 'Reed', 'Finance', 77000.00, '2023-10-20', 1, 1),
('Mateo', 'Cook', 'IT', 82000.00, '2023-11-25', 1, 6),
('Violet', 'Morgan', 'HR', 58000.00, '2023-12-30', 1, 2),
('Lincoln', 'Bell', 'Marketing', 67000.00, '2023-05-21', 1, 3),
('Ellie', 'Murphy', 'Sales', 61000.00, '2023-06-26', 1, 4),
('Julian', 'Bailey', 'Operations', 56000.00, '2023-07-31', 1, 5),
('Stella', 'Rivera', 'R&D', 86000.00, '2023-09-05', 1, 7),
('Anthony', 'Cooper', 'Customer Service', 54000.00, '2023-09-16', 1, 8),
('Mila', 'Richardson', 'Finance', 78000.00, '2023-10-21', 1, 1),
('Dylan', 'Cox', 'IT', 83000.00, '2023-11-26', 1, 6),
('Luna', 'Howard', 'HR', 59000.00, '2023-12-31', 1, 2),
('Ezra', 'Ward', 'Marketing', 68000.00, '2023-05-22', 1, 3),
('Scarlett', 'Torres', 'Sales', 62000.00, '2023-06-27', 1, 4),
('Hudson', 'Peterson', 'Operations', 57000.00, '2023-08-01', 1, 5),
('Aurora', 'Gray', 'R&D', 87000.00, '2023-09-06', 1, 7),
('Christopher', 'Ramirez', 'Customer Service', 55000.00, '2023-09-17', 1, 8),
('Savannah', 'James', 'Finance', 79000.00, '2023-10-22', 1, 1),
('Isaiah', 'Watson', 'IT', 84000.00, '2023-11-27', 1, 6),
('Bella', 'Brooks', 'HR', 60000.00, '2023-12-31', 1, 2),
('Andrew', 'Kelly', 'Marketing', 69000.00, '2023-05-23', 1, 3),
('Claire', 'Sanders', 'Sales', 63000.00, '2023-06-28', 1, 4),
('Joshua', 'Price', 'Operations', 58000.00, '2023-08-02', 1, 5),
('Skylar', 'Bennett', 'R&D', 88000.00, '2023-09-07', 1, 7),
('Ryan', 'Wood', 'Customer Service', 56000.00, '2023-09-18', 1, 8),
('Paisley', 'Barnes', 'Finance', 80000.00, '2023-10-23', 1, 1),
('Nathan', 'Ross', 'IT', 85000.00, '2023-11-28', 1, 6),
('Lillian', 'Henderson', 'HR', 61000.00, '2023-12-31', 1, 2),
('Caleb', 'Coleman', 'Marketing', 70000.00, '2023-05-24', 1, 3),
('Aaliyah', 'Jenkins', 'Sales', 64000.00, '2023-06-29', 1, 4),
('Christian', 'Perry', 'Operations', 59000.00, '2023-08-03', 1, 5),
('Nova', 'Powell', 'R&D', 89000.00, '2023-09-08', 1, 7),
('Eli', 'Long', 'Customer Service', 57000.00, '2023-09-19', 1, 8),
('Emilia', 'Patterson', 'Finance', 81000.00, '2023-10-24', 1, 1),
('Landon', 'Hughes', 'IT', 86000.00, '2023-11-29', 1, 6),
('Elena', 'Flores', 'HR', 62000.00, '2023-12-31', 1, 2),
('Aaron', 'Washington', 'Marketing', 71000.00, '2023-05-25', 1, 3),
('Anna', 'Butler', 'Sales', 65000.00, '2023-06-30', 1, 4),
('Hunter', 'Simmons', 'Operations', 60000.00, '2023-08-04', 1, 5),
('Ariana', 'Foster', 'R&D', 90000.00, '2023-09-09', 1, 7),
('Connor', 'Gonzales', 'Customer Service', 58000.00, '2023-09-20', 1, 8),
('Caroline', 'Bryant', 'Finance', 82000.00, '2023-10-25', 1, 1),
('Evan', 'Alexander', 'IT', 87000.00, '2023-11-30', 1, 6),
('Natalie', 'Russell', 'HR', 63000.00, '2023-12-31', 1, 2);

-- Retrieve all data from the 'employees' table
SELECT * FROM employees;

-- Retrieve all data from the 'departments' table
SELECT * FROM departments;

-- Describe the structure of the 'departments' table
DESCRIBE employees;
DESCRIBE departments;

-- Select specific columns based on a condition (employees in the HR department)
SELECT first_name, last_name, department
FROM employees
WHERE department = 'HR';

-- Insert a new record into the 'employees' table
INSERT INTO employees (first_name, last_name, department, salary, department_id)
VALUES ('John', 'Doe', 'Finance', 60000, 1);

-- Disable safe update mode for the current session to allow updates without a key
SET SQL_SAFE_UPDATES = 0;

-- Update the salary for a specific employee
UPDATE employees
SET salary = 65000
WHERE first_name = 'John' AND last_name = 'Doe';

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

-- Disable safe update mode again for deletion
SET SQL_SAFE_UPDATES = 0;

-- Delete an employee record
DELETE FROM employees
WHERE first_name = 'John' AND last_name = 'Doe';

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

-- Calculate a 10% bonus for each employee
SELECT first_name, last_name, salary, salary * 0.10 AS bonus
FROM employees;

-- Retrieve employees with a salary greater than 50,000
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 50000;

-- Select employees with complex conditions (Finance department and salary > 50,000)
SELECT first_name, last_name
FROM employees
WHERE department = 'Finance' AND salary > 50000;

-- Find employees who joined after January 1, 2023
SELECT first_name, last_name, join_date
FROM employees
WHERE join_date > '2023-01-01';

-- Create a 'test' table to demonstrate fixed-length and variable-length strings
CREATE TABLE test (
    fixed_length CHAR(5),       -- Fixed-length string (5 characters)
    variable_length VARCHAR(5)  -- Variable-length string (up to 5 characters)
);

-- Insert data into the 'test' table
INSERT INTO test (fixed_length, variable_length)
VALUES ('abc', 'abc');

-- Retrieve distinct departments from the 'employees' table
SELECT DISTINCT department
FROM employees;

-- Retrieve the top 3 highest-paid employees
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Retrieve employees from the Finance department
SELECT first_name, last_name
FROM employees
WHERE department = 'Finance';

-- Group employees by department and calculate the total salary for each department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Filter departments with total salaries greater than 100,000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 10000;

-- Retrieve employees sorted by salary in descending order
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

-- Use column aliases to rename columns in the output
SELECT first_name AS name, salary AS income
FROM employees;

-- Use table aliases to simplify queries
SELECT e.first_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- INNER JOIN: Retrieve only matching rows from both tables
SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- FULL OUTER JOIN: Retrieve all rows from both tables (MySQL does not support FULL OUTER JOIN directly)
-- Use a combination of LEFT JOIN and RIGHT JOIN with UNION to simulate FULL OUTER JOIN
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id

UNION

SELECT e.first_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- Alternative approach using UNION ALL to include duplicates (if any)
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id

UNION ALL

SELECT e.first_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.id IS NULL;  -- Avoid duplicates

-- CROSS JOIN example.
SELECT e.first_name, d.department_name
FROM employees e
CROSS JOIN departments d;

-- Correlated subquery to find employees earning above the average salary in their department.
SELECT e1.first_name, e1.salary
FROM employees e1
WHERE e1.salary > (
SELECT AVG(e2.salary)
FROM employees e2
WHERE e2.department_id = e1.department_id
);

-- Using LEFT JOIN to retain rows with NULL values.
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
-- Filtering rows with NULL values.
SELECT * FROM employees WHERE department_id IS NULL;

SELECT first_name, department_id, salary,
RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
FROM employees;






/* INDEX 
+------------------+---------------------------+---------------------------+
| Aspect           | With Index                | Without Index             |
+------------------+---------------------------+---------------------------+
| Query Speed      | Fast                      | Slow                      |
+------------------+---------------------------+---------------------------+
| Storage          | Extra space for index     | No extra storage needed   |
+------------------+---------------------------+---------------------------+
| Insert/Update    | Slightly slower           | No additional cost        |
+------------------+---------------------------+---------------------------+
| Best Use Case    | Large tables, frequent    | Small tables, few searches|
|                  | searches                  |                           |
+------------------+---------------------------+---------------------------+
*/ 

-- Query that benefits from the index.
EXPLAIN SELECT * FROM employees WHERE salary > 71000;

-- Creating an index on the salary column.
CREATE INDEX idx_salary ON employees(salary);

EXPLAIN SELECT * FROM employees WHERE salary > 71000;

-- ROLLBACK above command
DROP INDEX idx_salary ON employees;


# ACID compliance
START TRANSACTION;
-- Deducting 1000 from John Doe's salary (id = 1)
UPDATE employees SET salary = salary - 1000 WHERE id = 1;
-- Adding 1000 to Alice Johnson's salary (id = 2)
UPDATE employees SET salary = salary + 1000 WHERE id = 2;
COMMIT;

-- Creating a stored procedure to give a bonus to employees
DELIMITER //
CREATE PROCEDURE give_bonus (IN bonus_amount DECIMAL(10, 2))
BEGIN
  UPDATE employees
  SET salary = salary + bonus_amount
  WHERE is_active = 1; -- Ensuring the bonus is given only to active employees
END //
DELIMITER ;

-- Calling the stored procedure to give a bonus of 500
CALL give_bonus(500);

