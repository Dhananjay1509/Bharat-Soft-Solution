USE w1;

-- Drop tables if they already exist
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS overtime;

-- Create the sales table
CREATE TABLE sales (
    sales_employee VARCHAR(50),
    fiscal_year INT,
    sale DECIMAL(10,2)
);

-- Insert 50 diverse rows into sales table
INSERT INTO sales (sales_employee, fiscal_year, sale) VALUES
('Alice', 2020, 5000), ('Alice', 2021, 7000), ('Alice', 2022, 8000),
('Alice', 2023, 6000), ('Alice', 2024, 9000), ('Alice', 2025, 10000),
('Bob', 2020, 4000), ('Bob', 2021, 6000), ('Bob', 2022, 7500),
('Bob', 2023, 7200), ('Bob', 2024, 8500), ('Bob', 2025, 9500),
('Charlie', 2020, 3000), ('Charlie', 2021, 5000), ('Charlie', 2022, 7000),
('Charlie', 2023, 6800), ('Charlie', 2024, 7800), ('Charlie', 2025, 8800),
('David', 2020, 5500), ('David', 2021, 7700), ('David', 2022, 8300),
('David', 2023, 6200), ('David', 2024, 9100), ('David', 2025, 9900),
('Emma', 2020, 4700), ('Emma', 2021, 6600), ('Emma', 2022, 7600),
('Emma', 2023, 6900), ('Emma', 2024, 8700), ('Emma', 2025, 9700),
('Frank', 2020, 5100), ('Frank', 2021, 7100), ('Frank', 2022, 8200),
('Frank', 2023, 6500), ('Frank', 2024, 9200), ('Frank', 2025, 10100),
('Grace', 2020, 4500), ('Grace', 2021, 6700), ('Grace', 2022, 7400),
('Grace', 2023, 7300), ('Grace', 2024, 8600), ('Grace', 2025, 9600),
('Hank', 2020, 5300), ('Hank', 2021, 6900), ('Hank', 2022, 7800),
('Hank', 2023, 6400), ('Hank', 2024, 9000), ('Hank', 2025, 9800);

-- Create the overtime table
CREATE TABLE overtime (
    employee_name VARCHAR(50),
    department VARCHAR(50),
    hours INT
);

-- Insert 50 diverse rows into overtime table
INSERT INTO overtime (employee_name, department, hours) VALUES
('Alice', 'HR', 5), ('Alice', 'HR', 10), ('Alice', 'HR', 15),
('Bob', 'HR', 8), ('Bob', 'HR', 12), ('Bob', 'HR', 18),
('Charlie', 'Finance', 6), ('Charlie', 'Finance', 14), ('Charlie', 'Finance', 20),
('David', 'Finance', 9), ('David', 'Finance', 11), ('David', 'Finance', 17),
('Emma', 'IT', 7), ('Emma', 'IT', 13), ('Emma', 'IT', 19),
('Frank', 'IT', 4), ('Frank', 'IT', 16), ('Frank', 'IT', 22),
('Grace', 'Marketing', 5), ('Grace', 'Marketing', 10), ('Grace', 'Marketing', 15),
('Hank', 'Marketing', 6), ('Hank', 'Marketing', 12), ('Hank', 'Marketing', 18),
('Ivy', 'Sales', 8), ('Ivy', 'Sales', 14), ('Ivy', 'Sales', 20),
('Jack', 'Sales', 7), ('Jack', 'Sales', 11), ('Jack', 'Sales', 19),
('Kate', 'HR', 5), ('Kate', 'HR', 9), ('Kate', 'HR', 13),
('Leo', 'Finance', 6), ('Leo', 'Finance', 12), ('Leo', 'Finance', 18),
('Mia', 'IT', 4), ('Mia', 'IT', 14), ('Mia', 'IT', 22),
('Noah', 'Marketing', 5), ('Noah', 'Marketing', 11), ('Noah', 'Marketing', 17),
('Olivia', 'Sales', 7), ('Olivia', 'Sales', 15), ('Olivia', 'Sales', 21),
('Paul', 'HR', 8), ('Paul', 'HR', 10), ('Paul', 'HR', 16),
('Quinn', 'Finance', 6), ('Quinn', 'Finance', 12), ('Quinn', 'Finance', 19);
