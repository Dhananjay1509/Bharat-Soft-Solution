USE dn25;

CREATE TABLE Workers (
    EmployeeID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(10, 2),
    JOIN_DATE DATE,
    Email VARCHAR(255)
);

INSERT INTO Worker (EmployeeID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOIN_DATE, Email)
VALUES
(1, 'Amitabh', 'Bachchan', 'Entertainment', 10000.00, '2014-02-15', 'amitabh.bachchan@example.com'),
(2, 'Vipul', 'Sharma', 'Finance', 12000.00, '2014-03-10', 'vipul.sharma@example.com'),
(3, 'Satish', 'Kumar', 'HR', 8000.00, '2014-02-20', 'satish.kumar@example.com'),
(4, 'Amit', 'Joshi', 'IT', 11000.00, '2014-04-12', 'amit.joshi@example.com'),
(5, 'Suresh', 'Verma', 'Finance', 15000.00, '2014-05-18', 'suresh.verma@example.com'),
(6, 'Rajesh', 'Mehta', 'Entertainment', 9500.00, '2014-06-25', 'rajesh.mehta@example.com'),
(7, 'Asha', 'Patel', 'HR', 8500.00, '2014-07-30', 'asha.patel@example.com'),
(8, 'Nisha', 'Gupta', 'IT', 12500.00, '2014-08-14', 'nisha.gupta@example.com'),
(9, 'Ravi', 'Singh', 'Finance', 14500.00, '2014-09-23', 'ravi.singh@example.com'),
(10, 'Deepika', 'Padukone', 'IT', 13500.00, '2014-10-11', 'deepika.padukone@example.com');



CREATE TABLE Contractors (
    EmployeeID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(10, 2),
    JOIN_DATE DATE,
    Email VARCHAR(255)
);

INSERT INTO Contractors (EmployeeID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOIN_DATE, Email)
VALUES
(5, 'Suresh', 'Verma', 'Finance', 15000.00, '2014-05-18', 'suresh.verma@example.com'),  
(6, 'Rajesh', 'Mehta', 'Entertainment', 9500.00, '2014-06-25', 'rajesh.mehta@example.com'), 
(11, 'Karan', 'Johar', 'Entertainment', 16000.00, '2014-11-01', 'karan.johar@example.com'),
(12, 'Preeti', 'Shah', 'HR', 9000.00, '2014-12-12', 'preeti.shah@example.com'),
(13, 'Rohan', 'Kapoor', 'IT', 14000.00, '2015-01-15', 'rohan.kapoor@example.com'); 

SELECT * FROM Contractors;


-- Add duplicate records to the Workers table
INSERT INTO Workers (EmployeeID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOIN_DATE, Email)
VALUES
(1, 'Amitabh', 'Bachchan', 'Entertainment', 10000.00, '2014-02-15', 'amitabh.bachchan@example.com'),
(2, 'Vipul', 'Sharma', 'Finance', 12000.00, '2014-03-10', 'vipul.sharma@example.com');