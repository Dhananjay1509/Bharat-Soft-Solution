-- Display existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE dn25;

-- Select the current database
SELECT DATABASE();

-- Use the new database
USE dn25;

-- Create table 'dept'
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(14),
    loc VARCHAR(13)
);

-- Create table 'emp'
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

-- Create table 'bonus'
CREATE TABLE bonus (
    ename VARCHAR(10),
    job VARCHAR(9),
    sal INT,
    comm INT
);

-- Create table 'salgrade'
CREATE TABLE salgrade (
    grade INT PRIMARY KEY,
    losal INT,
    hisal INT
);

-- Insert data into 'dept'
INSERT INTO dept VALUES 
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- Insert data into 'emp'
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

-- Insert data into 'salgrade'
INSERT INTO salgrade VALUES 
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);

-- Commit the changes
COMMIT;

-- Queries
-- Select all employees
SELECT * FROM emp;

-- Filter by department and job
SELECT ename, sal, job, deptno 
FROM emp 
WHERE (deptno = 10 OR deptno = 20) AND job = 'CLERK';

-- Calculate total salary
SELECT ename, job, sal, comm, sal + comm AS "TOTAL SALARY" 
FROM emp;

-- Filter employees based on name patterns
SELECT ename, job, deptno FROM emp WHERE ename LIKE 'S%';
SELECT ename, job, deptno FROM emp WHERE ename NOT LIKE 'S%';
SELECT ename, job, deptno FROM emp WHERE ename LIKE '%S';
SELECT ename, job, deptno FROM emp WHERE ename LIKE '_A%';

-- Salary range filter
SELECT ename, job, sal 
FROM emp 
WHERE sal BETWEEN 1500 AND 4000;

-- Sorting results
SELECT ename, sal, job FROM emp ORDER BY sal;
SELECT ename, sal, job FROM emp ORDER BY sal DESC;
SELECT * FROM emp ORDER BY deptno;
SELECT * FROM emp ORDER BY deptno DESC;

-- Calculate and filter gross salary
SELECT ename, sal, deptno, sal + IFNULL(comm, 0) AS GROSS_SALARY 
FROM emp 
ORDER BY GROSS_SALARY;

SELECT ename, sal, comm, deptno, sal + IFNULL(comm, 0) AS GROSS_SALARY 
FROM emp 
WHERE GROSS_SALARY > 2500;

-- String functions
SELECT SUBSTR('SMITH', -3, 3);
SELECT LOWER('HELLO ALL WE ARE LEARNING SQL');
SELECT UPPER('hello');
SELECT LENGTH('hello how are you?');
SELECT CONCAT('Hello', ' Bye');
SELECT LPAD('SQL', 20, '*');
SELECT TRIM(BOTH '*' FROM '************SQL*****');

-- String replacement and mathematical functions
SELECT REPLACE('SQL', 'Q', 'q');
SELECT REPLACE('SQL', 'Q', 'hello');
SELECT ename, REPLACE(ename, 'SMITH', 'SACHIN') FROM emp;
SELECT ROUND(45.926, 2);
SELECT TRUNCATE(45.926, 2);
SELECT MOD(8, 2);

-- Date functions
SELECT CURDATE();
SELECT DATE_ADD('2020-09-24 11:20:20', INTERVAL 2 HOUR);
SELECT DATE_ADD('2020-09-24 11:20:20', INTERVAL 13 HOUR);
SELECT DATE_ADD('2020-09-24 11:20:20', INTERVAL -48 HOUR);

-- Extract date parts
SELECT ename, hiredate, DAY(hiredate) FROM emp;
SELECT ename, hiredate, MONTHNAME(hiredate) FROM emp;
SELECT ename, hiredate, DAYNAME(hiredate), MONTHNAME(hiredate), 
       DAYOFWEEK(hiredate), DAYOFYEAR(hiredate) 
FROM emp;

SELECT CURDATE();
SELECT SYSDATE();

SELECT ename, hiredate, DAY(hiredate), DAYNAME(hiredate) FROM emp;

SELECT ename, hiredate, DAY(hiredate), QUARTER(hiredate) FROM emp;
SELECT ename, hiredate, DAY(hiredate), DAYOFYEAR(hiredate) FROM emp;

SELECT ename, sal, LPAD('*', ROUND(sal/100), '*') AS SALARY_GRAPH FROM emp;

SELECT ROUND(45.926);
SELECT TRUNCATE(45.926, 2);

SELECT ename, sal, LPAD('*', LENGTH(ename), '*') AS NAME_GRAPH FROM emp;

SELECT SUM(sal) FROM emp;
SELECT MIN(sal) FROM emp;
SELECT MAX(sal) FROM emp;
SELECT COUNT(sal) FROM emp;
SELECT AVG(sal) FROM emp;

SELECT MIN(sal), MAX(sal), SUM(sal), AVG(sal), COUNT(sal) FROM emp;

SELECT COUNT(job) FROM emp;
SELECT COUNT(DISTINCT job) FROM emp;

SELECT DISTINCT job FROM emp;

SELECT COUNT(DISTINCT deptno) FROM emp;

SELECT AVG(sal) FROM emp;
SELECT job, AVG(sal) FROM emp GROUP BY job;
SELECT job, SUM(sal) FROM emp GROUP BY job;
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno;

SELECT job, deptno, SUM(sal) FROM emp GROUP BY deptno;

SELECT job, deptno, SUM(sal) 
FROM emp 
GROUP BY job, deptno
HAVING SUM(sal) > 2000;

-- NEW
SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job;

SELECT * FROM emp;

SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno;
-- OR
SELECT deptno, COUNT(*) FROM emp GROUP BY deptno;

SELECT deptno, SUM(sal) FROM emp
WHERE comm IS NOT NULL
GROUP BY deptno;

SELECT SUBSTR(ename, 1, 1) AS INITIAL, COUNT(*) FROM emp GROUP BY SUBSTR(ename, 1, 1);

SELECT deptno, YEAR(hiredate), COUNT(*) FROM emp GROUP BY deptno, YEAR(hiredate);

SELECT deptno, YEAR(hiredate) AS year, COUNT(empno) FROM emp GROUP BY deptno, YEAR(hiredate);

SELECT * FROM dept;

SELECT * FROM emp;

SELECT dept.loc, SUM(emp.sal) FROM emp, dept WHERE emp.deptno = dept.deptno GROUP BY dept.loc;

SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal) > 9000;

SELECT deptno, COUNT(*)  
FROM emp
WHERE job = 'CLERK'
GROUP BY deptno
HAVING COUNT(*) > 1
ORDER BY 2;

SELECT ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'MARTIN');

SELECT ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'MARTIN');

SELECT e.ename, e.deptno
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.loc = 'NEW YORK';
-- OR
SELECT ename, deptno FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'NEW YORK');

SELECT ename, sal 
FROM emp 
WHERE sal > (SELECT sal FROM emp WHERE ename = 'ALLEN');

SELECT deptno 
FROM emp 
WHERE ename = 'MILLER' OR ename = 'SMITH';

SELECT ename, sal 
FROM emp 
WHERE deptno IN (SELECT deptno FROM emp WHERE ename='MILLER' OR ename='SMITH');

SELECT ename, deptno 
FROM emp 
WHERE job = (SELECT job FROM emp WHERE ename = 'SMITH');

SELECT ename, sal 
FROM emp 
WHERE sal = (SELECT MAX(sal) FROM emp);

SELECT ename, sal 
FROM emp  
WHERE sal = (SELECT MAX(sal) FROM emp 
             WHERE sal < (SELECT MAX(sal) FROM emp));

SELECT ename, sal 
FROM emp 
ORDER BY sal DESC 
LIMIT 1 OFFSET 0;

SELECT ename, sal 
FROM emp 
ORDER BY sal DESC 
LIMIT 1 OFFSET 1;

SELECT ename, sal 
FROM emp 
ORDER BY sal DESC 
LIMIT 1 OFFSET 3;

SELECT ename, sal, deptno 
FROM emp 
WHERE sal IN (SELECT MAX(sal) FROM emp 
              GROUP BY deptno);

SELECT deptno, MAX(sal) 
FROM emp 
GROUP BY deptno;

CREATE TABLE employee_table (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    job VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);

DESC employee_table;

ALTER TABLE employee_table2 ADD city VARCHAR(10);

ALTER TABLE employee_table
ADD address VARCHAR(50) NOT NULL AFTER name,
ADD salary INT(20) NOT NULL AFTER age;

-- Force to accept null value
ALTER TABLE employee_table
MODIFY address VARCHAR(100) NULL;

CREATE TABLE t1(c1 INT(10), c2 VARCHAR(10));
DESC t1;

INSERT INTO t1 VALUES(10, 'a');
INSERT INTO t1 VALUES(11, 'b');
INSERT INTO t1 VALUES(12, 'c');
INSERT INTO t1 VALUES(13, 'd');

TRUNCATE t1;

RENAME TABLE t1 TO t1_new;

SELECT * FROM t1;

CREATE TABLE emp_copy AS SELECT * FROM emp;

SET SQL_SAFE_UPDATES = 0;
UPDATE emp_copy SET ename='Rohit' WHERE empno=7369;
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM dept;

-- Any DDL statement by default means commit
-- START TRANSACTION;

SELECT e.ename, e.sal, e.job, e.deptno AS Edeptno, d.deptno AS Ddeptno, d.loc 
FROM emp e 
INNER JOIN dept d 
ON e.deptno = d.deptno;

SELECT e.ename, e.sal, e.job, e.deptno AS Edeptno, d.deptno AS Ddeptno, d.loc 
FROM emp e 
INNER JOIN dept d 
ON e.deptno = d.deptno;

SELECT e.ename, e.job, e.deptno AS Edeptno, d.deptno AS Ddeptno 
FROM emp e 
LEFT JOIN dept d 
ON e.deptno = d.deptno;

SELECT A.empno, A.ename, A.mgr, B.ename AS 'Manager Name' 
FROM emp A 
LEFT JOIN emp B 
ON A.mgr = B.empno;

SELECT sal, CONCAT(LEFT(sal, LENGTH(sal) - 2), '**') AS masked_sal FROM emp;

SELECT * FROM emp 
WHERE MOD(empno, 2) = 0;

SELECT ename, sal, ROUND((AVG(sal) OVER()), 2) AS avg_sal FROM emp;
SELECT job, AVG(sal) FROM emp GROUP BY job;
SELECT ename, job, sal, AVG(sal) OVER(PARTITION BY job) AS avg_sal FROM emp;





USE w1;

CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);


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
      
SELECT * FROM sales;
SELECT SUM(sale) FROM sales;
SELECT fiscal_year, SUM(sale) FROM sales GROUP BY fiscal_year;
SELECT fiscal_year, sales_employee, sale, SUM(sale) OVER(PARTITION BY fiscal_year) AS TotalSales FROM sales;
SELECT fiscal_year, sales_employee, sale, SUM(sale) OVER() AS TotalSales FROM sales;


CREATE TABLE scores (
    name VARCHAR(20) PRIMARY KEY,
    score INT NOT NULL
);


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
    
SELECT * FROM scores;
SELECT name, score, ROW_NUMBER() OVER() FROM scores;
SELECT name, score, ROW_NUMBER() OVER(ORDER BY score) AS row_num, CUME_DIST() OVER(ORDER BY score) AS cume_dist_value FROM scores;
SELECT name, score, ROW_NUMBER() OVER(ORDER BY score) AS row_num FROM scores;
SELECT name, score, ROW_NUMBER() OVER(ORDER BY score) AS row_num, CUME_DIST() OVER(ORDER BY score) AS cume_dist_value FROM scores;


CREATE TABLE t (val INT);

INSERT INTO t(val)
VALUES(1),(2),(2),(3),(4),(4),(5);

SELECT * FROM t;
SELECT val, DENSE_RANK() OVER(ORDER BY val) AS value_rank FROM t;
SELECT sales_employee, fiscal_year, sale, DENSE_RANK() OVER(PARTITION BY fiscal_year ORDER BY sale DESC) AS Rank_Sales FROM sales;
SELECT sales_employee, fiscal_year, sale, DENSE_RANK() OVER(ORDER BY sale DESC) AS Rank_Sales FROM sales;


CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
     PRIMARY KEY (employee_name , department)
);

DESCRIBE overtime;

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

SELECT * FROM overtime;
SELECT employee_name, hours, FIRST_VALUE(employee_name) OVER(ORDER BY hours) AS Least_over_time FROM overtime;
SELECT employee_name, department, hours, FIRST_VALUE(employee_name) OVER(PARTITION BY department ORDER BY hours) AS Least_over_time FROM overtime;
SELECT sales_employee, fiscal_year, sale, LAG(sale, 1, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS "Previous Year Sale" FROM sales;
SELECT sales_employee, fiscal_year, sale, LAG(sale, 1, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS "Previous Year Sale", sale - LAG(sale, 1, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS Sale_Vs_previous_year FROM sales;
