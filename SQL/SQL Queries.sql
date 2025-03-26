-- Display existing databases
SHOW DATABASES;

-- Create a new database named 'dn25'
CREATE DATABASE dn25;

-- Select the current database in use
SELECT DATABASE();

-- Switch to the 'dn25' database
USE dn25;
-- Switch to the 'w1' database
USE w1;

-- Create table 'dept' to store department information
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(14),
    loc VARCHAR(13)
);

-- Create table 'emp' to store employee information
CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal INT,
    comm INT,
    deptno INT,
    CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);

-- Create table 'bonus' to store bonus information
CREATE TABLE bonus (
    ename VARCHAR(10),
    job VARCHAR(9),
    sal INT,
    comm INT
);

-- Create table 'salgrade' to store salary grade information
CREATE TABLE salgrade (
    grade INT PRIMARY KEY,
    losal INT,
    hisal INT
);

-- Insert data into 'dept' table
INSERT INTO dept VALUES 
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- Insert data into 'emp' table
INSERT INTO emp VALUES 
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-19', 5000, NULL, 10),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-09-23', 3000, NULL, 20),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-22', 1250, 1400, 30),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-08-24', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

-- Insert data into 'salgrade' table
INSERT INTO salgrade VALUES 
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);

-- Commit the changes to save the data permanently
COMMIT;

-- Queries
-- Select all employees from the 'emp' table
SELECT * FROM emp;

-- Filter employees by department and job (CLERK in dept 10 or 20)
SELECT ename, sal, job, deptno 
FROM emp 
WHERE (deptno = 10 OR deptno = 20) AND job = 'CLERK';

-- Calculate total salary (salary + commission) for each employee
SELECT ename, job, sal, comm, sal + comm AS "TOTAL SALARY" 
FROM emp;

-- Filter employees based on name patterns
SELECT ename, job, deptno FROM emp WHERE ename LIKE 'S%'; -- Names starting with 'S'
SELECT ename, job, deptno FROM emp WHERE ename NOT LIKE 'S%'; -- Names not starting with 'S'
SELECT ename, job, deptno FROM emp WHERE ename LIKE '%S'; -- Names ending with 'S'
SELECT ename, job, deptno FROM emp WHERE ename LIKE '_A%'; -- Names with 'A' as the second character

-- Filter employees based on salary range (1500 to 4000)
SELECT ename, job, sal 
FROM emp 
WHERE sal BETWEEN 1500 AND 4000;

-- Sort employees by salary in ascending order
SELECT ename, sal, job FROM emp ORDER BY sal;
-- Sort employees by salary in descending order
SELECT ename, sal, job FROM emp ORDER BY sal DESC;
-- Sort employees by department number in ascending order
SELECT * FROM emp ORDER BY deptno;
-- Sort employees by department number in descending order
SELECT * FROM emp ORDER BY deptno DESC;

-- Calculate and filter gross salary (salary + commission)
SELECT ename, sal, deptno, sal + IFNULL(comm, 0) AS GROSS_SALARY 
FROM emp 
ORDER BY GROSS_SALARY;

-- Filter employees with gross salary greater than 2500
SELECT ename, sal, comm, deptno, sal + IFNULL(comm, 0) AS GROSS_SALARY 
FROM emp 
WHERE GROSS_SALARY > 2500;

-- String functions
SELECT SUBSTR('SMITH', -3, 3); -- Extract substring from 'SMITH'
SELECT LOWER('HELLO ALL WE ARE LEARNING SQL'); -- Convert string to lowercase
SELECT UPPER('hello'); -- Convert string to uppercase
SELECT LENGTH('hello how are you?'); -- Get length of the string
SELECT CONCAT('Hello', ' Bye'); -- Concatenate two strings
SELECT LPAD('SQL', 20, '*'); -- Left-pad 'SQL' with '*' to make it 20 characters long
SELECT TRIM(BOTH '*' FROM '************SQL*****'); -- Trim '*' from both sides of the string

-- String replacement and mathematical functions
SELECT REPLACE('SQL', 'Q', 'q'); -- Replace 'Q' with 'q' in 'SQL'
SELECT REPLACE('SQL', 'Q', 'hello'); -- Replace 'Q' with 'hello' in 'SQL'
SELECT ename, REPLACE(ename, 'SMITH', 'SACHIN') FROM emp; -- Replace 'SMITH' with 'SACHIN' in employee names
SELECT ROUND(45.926, 2); -- Round 45.926 to 2 decimal places
SELECT TRUNCATE(45.926, 2); -- Truncate 45.926 to 2 decimal places
SELECT MOD(8, 2); -- Get the remainder of 8 divided by 2

-- Date functions
SELECT CURDATE(); -- Get the current date
SELECT DATE_ADD('2020-09-24 11:20:20', INTERVAL 2 HOUR); -- Add 2 hours to the given date
SELECT DATE_ADD('2020-09-24 11:20:20', INTERVAL 13 HOUR); -- Add 13 hours to the given date
SELECT DATE_ADD('2020-09-24 11:20:20', INTERVAL -48 HOUR); -- Subtract 48 hours from the given date

-- Extract date parts from employee hire dates
SELECT ename, hiredate, DAY(hiredate) FROM emp; -- Extract day from hire date
SELECT ename, hiredate, MONTHNAME(hiredate) FROM emp; -- Extract month name from hire date
SELECT ename, hiredate, DAYNAME(hiredate), MONTHNAME(hiredate), 
       DAYOFWEEK(hiredate), DAYOFYEAR(hiredate) 
FROM emp; -- Extract day name, month name, day of week, and day of year from hire date

SELECT CURDATE(); -- Get the current date
SELECT SYSDATE(); -- Get the current system date and time

SELECT ename, hiredate, DAY(hiredate), DAYNAME(hiredate) FROM emp; -- Extract day and day name from hire date

SELECT ename, hiredate, DAY(hiredate), QUARTER(hiredate) FROM emp; -- Extract day and quarter from hire date
SELECT ename, hiredate, DAY(hiredate), DAYOFYEAR(hiredate) FROM emp; -- Extract day and day of year from hire date

-- Create a salary graph using LPAD
SELECT ename, sal, LPAD('*', ROUND(sal/100), '*') AS SALARY_GRAPH FROM emp;

SELECT ROUND(45.926); -- Round 45.926 to the nearest integer
SELECT TRUNCATE(45.926, 2); -- Truncate 45.926 to 2 decimal places

-- Create a name graph using LPAD
SELECT ename, sal, LPAD('*', LENGTH(ename), '*') AS NAME_GRAPH FROM emp;

-- Aggregate functions
SELECT SUM(sal) FROM emp; -- Calculate total salary of all employees
SELECT MIN(sal) FROM emp; -- Find the minimum salary
SELECT MAX(sal) FROM emp; -- Find the maximum salary
SELECT COUNT(sal) FROM emp; -- Count the number of employees
SELECT AVG(sal) FROM emp; -- Calculate the average salary

-- Multiple aggregate functions in one query
SELECT MIN(sal), MAX(sal), SUM(sal), AVG(sal), COUNT(sal) FROM emp;

SELECT COUNT(job) FROM emp; -- Count the number of jobs
SELECT COUNT(DISTINCT job) FROM emp; -- Count the number of distinct jobs

SELECT DISTINCT job FROM emp; -- Get distinct job titles

SELECT COUNT(DISTINCT deptno) FROM emp; -- Count the number of distinct departments

SELECT AVG(sal) FROM emp; -- Calculate the average salary
SELECT job, AVG(sal) FROM emp GROUP BY job; -- Calculate average salary by job
SELECT job, SUM(sal) FROM emp GROUP BY job; -- Calculate total salary by job
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno; -- Calculate total salary by department

SELECT job, deptno, SUM(sal) FROM emp GROUP BY deptno; -- Calculate total salary by job and department

-- Filter groups having total salary greater than 2000
SELECT job, deptno, SUM(sal) 
FROM emp 
GROUP BY job, deptno
HAVING SUM(sal) > 2000;

-- NEW
SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job; -- Calculate total salary by department and job

SELECT * FROM emp; -- Select all employees

SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno; -- Count employees by department
-- OR
SELECT deptno, COUNT(*) FROM emp GROUP BY deptno; -- Count employees by department

-- Calculate total salary by department where commission is not null
SELECT deptno, SUM(sal) FROM emp
WHERE comm IS NOT NULL
GROUP BY deptno;

-- Count employees by the first letter of their name
SELECT SUBSTR(ename, 1, 1) AS INITIAL, COUNT(*) FROM emp GROUP BY SUBSTR(ename, 1, 1);

-- Count employees by department and hire year
SELECT deptno, YEAR(hiredate), COUNT(*) FROM emp GROUP BY deptno, YEAR(hiredate);

SELECT deptno, YEAR(hiredate) AS year, COUNT(empno) FROM emp GROUP BY deptno, YEAR(hiredate); -- Count employees by department and hire year

SELECT * FROM dept; -- Select all departments

SELECT * FROM emp; -- Select all employees

-- Calculate total salary by location
SELECT dept.loc, SUM(emp.sal) FROM emp, dept WHERE emp.deptno = dept.deptno GROUP BY dept.loc;

-- Filter departments having total salary greater than 9000
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal) > 9000;

-- Filter departments having more than 1 CLERK
SELECT deptno, COUNT(*)  
FROM emp
WHERE job = 'CLERK'
GROUP BY deptno
HAVING COUNT(*) > 1
ORDER BY 2;

-- Find employees with salary greater than 'MARTIN's salary
SELECT ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'MARTIN');

-- Find employees with salary greater than 'MARTIN's salary
SELECT ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'MARTIN');

-- Find employees working in 'NEW YORK'
SELECT e.ename, e.deptno
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.loc = 'NEW YORK';
-- OR
SELECT ename, deptno FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'NEW YORK');

-- Find employees with salary greater than 'ALLEN's salary
SELECT ename, sal 
FROM emp 
WHERE sal > (SELECT sal FROM emp WHERE ename = 'ALLEN');

-- Find departments where 'MILLER' or 'SMITH' work
SELECT deptno 
FROM emp 
WHERE ename = 'MILLER' OR ename = 'SMITH';

-- Find employees working in the same departments as 'MILLER' or 'SMITH'
SELECT ename, sal 
FROM emp 
WHERE deptno IN (SELECT deptno FROM emp WHERE ename='MILLER' OR ename='SMITH');

-- Find employees with the same job as 'SMITH'
SELECT ename, deptno 
FROM emp 
WHERE job = (SELECT job FROM emp WHERE ename = 'SMITH');

-- Find the employee with the highest salary
SELECT ename, sal 
FROM emp 
WHERE sal = (SELECT MAX(sal) FROM emp);

-- Find the employee with the second-highest salary
SELECT ename, sal 
FROM emp  
WHERE sal = (SELECT MAX(sal) FROM emp 
             WHERE sal < (SELECT MAX(sal) FROM emp));

-- Find the top 1 employee with the highest salary
SELECT ename, sal 
FROM emp 
ORDER BY sal DESC 
LIMIT 1 OFFSET 0;

-- Find the second-highest paid employee
SELECT ename, sal 
FROM emp 
ORDER BY sal DESC 
LIMIT 1 OFFSET 1;

-- Find the fourth-highest paid employee
SELECT ename, sal 
FROM emp 
ORDER BY sal DESC 
LIMIT 1 OFFSET 3;

-- Find employees with the highest salary in each department
SELECT ename, sal, deptno 
FROM emp 
WHERE sal IN (SELECT MAX(sal) FROM emp 
              GROUP BY deptno);

-- Find the highest salary in each department
SELECT deptno, MAX(sal) 
FROM emp 
GROUP BY deptno;

-- Create a new table 'employee_table'
CREATE TABLE employee_table (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    job VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);

-- Describe the structure of 'employee_table'
DESC employee_table;

-- Add a new column 'city' to 'employee_table2'
ALTER TABLE employee_table2 ADD city VARCHAR(10);

-- Add new columns 'address' and 'salary' to 'employee_table'
ALTER TABLE employee_table
ADD address VARCHAR(50) NOT NULL AFTER name,
ADD salary INT(20) NOT NULL AFTER age;

-- Modify 'address' column to accept NULL values
ALTER TABLE employee_table
MODIFY address VARCHAR(100) NULL;

-- Create a new table 't1'
CREATE TABLE t1(c1 INT(10), c2 VARCHAR(10));
DESC t1;

-- Insert data into 't1'
INSERT INTO t1 VALUES(10, 'a');
INSERT INTO t1 VALUES(11, 'b');
INSERT INTO t1 VALUES(12, 'c');
INSERT INTO t1 VALUES(13, 'd');

-- Truncate 't1' to remove all data
TRUNCATE t1;

-- Rename table 't1' to 't1_new'
RENAME TABLE t1 TO t1_new;

-- Select all data from 't1'
SELECT * FROM t1;

-- Create a copy of 'emp' table as 'emp_copy'
CREATE TABLE emp_copy AS SELECT * FROM emp;

-- Disable safe update mode to allow updates without a key
SET SQL_SAFE_UPDATES = 0;
-- Update 'ename' to 'Rohit' for employee with 'empno' 7369
UPDATE emp_copy SET ename='Rohit' WHERE empno=7369;
-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

-- Select all data from 'dept'
SELECT * FROM dept;

-- Any DDL statement by default means commit
-- START TRANSACTION;

-- Join 'emp' and 'dept' tables to get employee details with department location
SELECT e.ename, e.sal, e.job, e.deptno AS Edeptno, d.deptno AS Ddeptno, d.loc 
FROM emp e 
INNER JOIN dept d 
ON e.deptno = d.deptno;

-- Join 'emp' and 'dept' tables to get employee details with department location
SELECT e.ename, e.sal, e.job, e.deptno AS Edeptno, d.deptno AS Ddeptno, d.loc 
FROM emp e 
INNER JOIN dept d 
ON e.deptno = d.deptno;

-- Left join 'emp' and 'dept' tables to get employee details with department information
SELECT e.ename, e.job, e.deptno AS Edeptno, d.deptno AS Ddeptno 
FROM emp e 
LEFT JOIN dept d 
ON e.deptno = d.deptno;

-- Self join 'emp' table to get employee and manager names
SELECT A.empno, A.ename, A.mgr, B.ename AS 'Manager Name' 
FROM emp A 
LEFT JOIN emp B 
ON A.mgr = B.empno;

-- Mask salary by replacing the last two digits with '**'
SELECT sal, CONCAT(LEFT(sal, LENGTH(sal) - 2), '**') AS masked_sal FROM emp;

-- Select employees with even employee numbers
SELECT * FROM emp 
WHERE MOD(empno, 2) = 0;

-- Calculate average salary and display it alongside employee details
SELECT ename, sal, ROUND((AVG(sal) OVER()), 2) AS avg_sal FROM emp;
-- Calculate average salary by job
SELECT job, AVG(sal) FROM emp GROUP BY job;
-- Calculate average salary by job and display it alongside employee details
SELECT ename, job, sal, AVG(sal) OVER(PARTITION BY job) AS avg_sal FROM emp;

-- Switch to 'w1' database
USE w1;

-- Create 'sales' table to store sales data
CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

-- Insert data into 'sales' table
INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
      
-- Select all data from 'sales'
SELECT * FROM sales;
-- Calculate total sales
SELECT SUM(sale) FROM sales;
-- Calculate total sales by fiscal year
SELECT fiscal_year, SUM(sale) FROM sales GROUP BY fiscal_year;
-- Calculate total sales by fiscal year and display it alongside employee details
SELECT fiscal_year, sales_employee, sale, SUM(sale) OVER(PARTITION BY fiscal_year) AS TotalSales FROM sales;
-- Calculate total sales and display it alongside employee details
SELECT fiscal_year, sales_employee, sale, SUM(sale) OVER() AS TotalSales FROM sales;

-- Create 'scores' table to store score data
CREATE TABLE scores (
    name VARCHAR(20) PRIMARY KEY,
    score INT NOT NULL
);

-- Insert data into 'scores' table
INSERT INTO
	scores(name, score)
VALUES
	('Smith',81),
	('Jones',55),
	('Williams',55),
	('Taylor',62),
	('Brown',62),
	('Davies',84),
	('Evans',87),
	('Wilson',72),
	('Thomas',72),
	('Johnson',100);
    
-- Select all data from 'scores'
SELECT * FROM scores;
-- Assign row numbers to each row in 'scores'
SELECT name, score, ROW_NUMBER() OVER() FROM scores;
-- Assign row numbers and cumulative distribution values to each row in 'scores'
SELECT name, score, ROW_NUMBER() OVER(ORDER BY score) AS row_num, CUME_DIST() OVER(ORDER BY score) AS cume_dist_value FROM scores;
-- Assign row numbers to each row in 'scores' ordered by score
SELECT name, score, ROW_NUMBER() OVER(ORDER BY score) AS row_num FROM scores;
-- Assign row numbers and cumulative distribution values to each row in 'scores' ordered by score
SELECT name, score, ROW_NUMBER() OVER(ORDER BY score) AS row_num, CUME_DIST() OVER(ORDER BY score) AS cume_dist_value FROM scores;

-- Create 't' table to store integer values
CREATE TABLE t (val INT);

-- Insert data into 't' table
INSERT INTO t(val)
VALUES(1),(2),(2),(3),(4),(4),(5);

-- Select all data from 't'
SELECT * FROM t;
-- Assign dense rank to each value in 't'
SELECT val, DENSE_RANK() OVER(ORDER BY val) AS value_rank FROM t;
-- Assign dense rank to sales by fiscal year
SELECT sales_employee, fiscal_year, sale, DENSE_RANK() OVER(PARTITION BY fiscal_year ORDER BY sale DESC) AS Rank_Sales FROM sales;
-- Assign dense rank to sales
SELECT sales_employee, fiscal_year, sale, DENSE_RANK() OVER(ORDER BY sale DESC) AS Rank_Sales FROM sales;

-- Create 'overtime' table to store overtime data
CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
     PRIMARY KEY (employee_name , department)
);

-- Describe the structure of 'overtime' table
DESCRIBE overtime;

-- Insert data into 'overtime' table
INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);

-- Select all data from 'overtime'
SELECT * FROM overtime;
-- Find the employee with the least overtime hours
SELECT employee_name, hours, FIRST_VALUE(employee_name) OVER(ORDER BY hours) AS Least_over_time FROM overtime;
-- Find the employee with the least overtime hours in each department
SELECT employee_name, department, hours, FIRST_VALUE(employee_name) OVER(PARTITION BY department ORDER BY hours) AS Least_over_time FROM overtime;
-- Calculate the previous year's sale for each employee
SELECT sales_employee, fiscal_year, sale, LAG(sale, 1, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS "Previous Year Sale" FROM sales;
-- Calculate the difference between current and previous year's sale for each employee
SELECT sales_employee, fiscal_year, sale, LAG(sale, 1, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS "Previous Year Sale", sale - LAG(sale, 1, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS Sale_Vs_previous_year FROM sales;

-- Select all data from 'sales'
SELECT * FROM sales;

-- Calculate the previous year's sale for each employee
SELECT sales_employee, fiscal_year, sale,
LAG(sale, 1, 0) OVER (PARTITION BY sales_employee ORDER BY fiscal_year) AS sale_prev_year
FROM sales;

-- Find the employee with the highest overtime hours
SELECT employee_name, hours,
LAST_VALUE(employee_name) OVER (ORDER BY hours RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS highest_overtime_employee
FROM overtime;

-- Find the employee with the highest overtime hours in each department
SELECT employee_name, department, hours,
LAST_VALUE(employee_name) OVER ( PARTITION BY department ORDER BY hours RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS highest_overtime_employee
FROM overtime;

-- Calculate the next year's sale and the percentage change for each employee
SELECT sales_employee, fiscal_year, sale,
LEAD(sale) OVER (PARTITION BY sales_employee ORDER BY fiscal_year) AS next_year_sale,
ROUND((sale - LEAD(sale) OVER (PARTITION BY sales_employee ORDER BY fiscal_year)) / sale * 100, 2) AS vs_next_year_sale
FROM sales;

-- Create 'basic_pays' table to store salary data
CREATE TABLE basic_pays(
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);

-- Insert data into 'basic_pays' table
INSERT INTO basic_pays(employee_name, department, salary)
VALUES
	('Diane Murphy','Accounting',8435),
	('Mary Patterson','Accounting',9998),
	('Jeff Firrelli','Accounting',8992),
	('William Patterson','Accounting',8870),
	('Gerard Bondur','Accounting',11472),
	('Anthony Bow','Accounting',6627),
	('Leslie Jennings','IT',8113),
	('Leslie Thompson','IT',5186),
	('Julie Firrelli','Sales',9181),
	('Steve Patterson','Sales',9441),
	('Foon Yue Tseng','Sales',6660),
	('George Vanauf','Sales',10563),
	('Loui Bondur','SCM',10449),
	('Gerard Hernandez','SCM',6949),
	('Pamela Castillo','SCM',11303),
	('Larry Bott','SCM',11798),
	('Barry Jones','SCM',10586);
    
-- Select all data from 'basic_pays'
select * from basic_pays;

-- Query to find the second-highest earner per department
SELECT employee_name, department, salary,
NTH_VALUE(employee_name, 2) OVER (PARTITION BY department ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS second_highest_earner
FROM basic_pays;

-- Create table 't1'
CREATE TABLE t1 (val INT NOT NULL);
INSERT INTO t1(val) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9);

-- Split 't1' into 4 groups
SELECT val,
NTILE(4) OVER (ORDER BY val) AS group_number 
FROM t1;

-- Split 't1' into 3 groups
SELECT val, NTILE(3) OVER (ORDER BY val) AS group_number 
FROM t1;

-- Assign row numbers to products ordered by product name
select row_number() over(order by productName) row_num,productname,msrp from products order by productname;