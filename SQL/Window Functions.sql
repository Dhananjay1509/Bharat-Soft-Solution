# Window Functions in SQL
# Window functions in SQL perform calculations across a set of table rows related to the current row. Unlike aggregate functions, they do not collapse the result set into a single value per group. Below is a list of commonly used window functions:

# 1. Aggregate Functions as Window Functions
# These are typically used with an OVER() clause:
USE w1;

# SUM(): Calculates the running or partitioned sum.
SELECT 
    sales_employee, 
    fiscal_year, 
    sale,
    SUM(sale) OVER (PARTITION BY sales_employee ORDER BY fiscal_year) AS running_total
FROM sales;

# AVG(): Calculates the running or partitioned average.
SELECT 
    sales_employee,
    fiscal_year,
    sale,
    AVG(sale) OVER (PARTITION BY sales_employee ORDER BY fiscal_year) AS Running_Avg_Sale
FROM sales;

# COUNT(): Counts rows within the window.
SELECT 
    sales_employee,
    fiscal_year,
    sale,
    COUNT(*) OVER (PARTITION BY sales_employee) AS Sales_Count
FROM sales;

# MIN(): Finds the minimum value within the window.
SELECT 
    sales_employee,
    fiscal_year,
    sale,
    MIN(sale) OVER (PARTITION BY sales_employee) AS Min_Sale
FROM sales;

# MAX(): Finds the maximum value within the window.
SELECT 
    sales_employee,
    fiscal_year,
    sale,
    MAX(sale) OVER (PARTITION BY sales_employee) AS Max_Sale
FROM sales;


# 2. Ranking Functions
# Used to rank rows within a partition:

# ROW_NUMBER(): Assigns a unique, sequential number to rows within a partition.
SELECT 
    sales_employee, 
    fiscal_year, 
    sale,
    ROW_NUMBER() OVER (PARTITION BY sales_employee ORDER BY sale DESC) AS rnk
FROM sales;

# RANK(): Assigns a rank to rows, with gaps for ties.
SELECT 
    sales_employee, 
    fiscal_year, 
    sale,
    RANK() OVER (PARTITION BY sales_employee ORDER BY sale DESC) AS rnk
FROM sales;

# DENSE_RANK(): Similar to RANK(), but without gaps for ties.
SELECT 
    sales_employee, 
    fiscal_year, 
    sale,
    DENSE_RANK() OVER (PARTITION BY sales_employee ORDER BY sale DESC) AS dense_rnk
FROM sales;

# NTILE(n): Divides rows into n buckets and assigns a bucket number to each row.
SELECT 
    sales_employee, 
    fiscal_year, 
    sale,
    NTILE(4) OVER (PARTITION BY sales_employee ORDER BY sale DESC) AS quartile
FROM sales;
SELECT sum(sale) sales;


# 3. Value Functions
# Used to access values from other rows:

# LEAD(column, offset, default): Accesses a value in a subsequent row within the same partition.
SELECT 
    employee_name, 
    department, 
    hours,
    LEAD(hours, 1) OVER (PARTITION BY department ORDER BY hours) AS next_hours
FROM overtime;
# LAG(column, offset, default): Accesses a value in a preceding row within the same partition.
SELECT 
    employee_name, 
    department, 
    hours,
    LAG(hours, 1) OVER (PARTITION BY department ORDER BY hours) AS prev_hours
FROM overtime;
# FIRST_VALUE(column): Returns the first value in the window frame.
SELECT 
    employee_name, 
    department, 
    hours,
    FIRST_VALUE(hours) OVER (PARTITION BY department ORDER BY hours ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS first_hours
FROM overtime;
# LAST_VALUE(column): Returns the last value in the window frame.
SELECT 
    employee_name, 
    department, 
    hours,
    LAST_VALUE(hours) OVER (PARTITION BY department ORDER BY hours ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS last_hours
FROM overtime;
# NTH_VALUE(column, n): Returns the nth value in the window frame.
SELECT 
    employee_name, 
    department, 
    hours,
    NTH_VALUE(hours, 3) OVER (PARTITION BY department ORDER BY hours) AS third_hours
FROM overtime;


# 4. Statistical Functions
# Used to compute statistical metrics:

# CUME_DIST(): Calculates the cumulative distribution of a value within a partition.
SELECT 
    employee_name, 
    department, 
    hours,
    CUME_DIST() OVER (PARTITION BY department ORDER BY hours) AS cume_dst
FROM overtime;
# PERCENT_RANK(): Computes the percentage rank of a row within a partition.
SELECT 
    employee_name, 
    department, 
    hours,
    PERCENT_RANK() OVER (PARTITION BY department ORDER BY hours) AS percent_rnk
FROM overtime;

# NOT SUPPOERTED 
# PERCENTILE_CONT(): Calculates the continuous percentile.
# SELECT 
#     department,
#     PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY hours) 
#         OVER (PARTITION BY department) AS median_hours
# FROM overtime;
# PERCENTILE_DISC(): Calculates the discrete percentile.
# SELECT 
#     department,
#     PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY hours) OVER (PARTITION BY department) AS median_hours
# FROM overtime;


# 5. Row Navigation
# Defines the scope of rows for calculations:

# CURRENT ROW: Refers to the current row in the window frame.
SELECT 
    employee_name, 
    department, 
    hours,
    SUM(hours) OVER (PARTITION BY department ORDER BY hours ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_sum
FROM overtime;

# UNBOUNDED PRECEDING: Includes all rows from the beginning of the partition to the current row.
SELECT 
    employee_name, 
    department, 
    hours,
    SUM(hours) OVER (PARTITION BY department ORDER BY hours ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sum
FROM overtime;

# UNBOUNDED FOLLOWING: Includes all rows from the current row to the end of the partition.
SELECT 
    employee_name, 
    department, 
    hours,
    SUM(hours) OVER (PARTITION BY department ORDER BY hours ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS future_sum
FROM overtime;