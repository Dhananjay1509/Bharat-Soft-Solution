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
