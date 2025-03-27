Use classicmodels;
-- 1. Running Total of creditLimit 
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  SUM(creditLimit) OVER (
    ORDER BY customerNumber
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM customers;

-- 2. Moving Average of creditLimit (3-row moving average)
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  AVG(creditLimit) OVER (
    ORDER BY customerNumber
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS moving_avg
FROM customers;

-- 3. Cumulative Sum of creditLimit by Country
SELECT 
  customerNumber,
  customerName,
  country,
  creditLimit,
  SUM(creditLimit) OVER (
    PARTITION BY country
    ORDER BY customerNumber
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_sum_by_country
FROM customers;

-- 4. Rank Customers by creditLimit Within Each Country
SELECT 
  customerNumber,
  customerName,
  country,
  creditLimit,
  RANK() OVER (
    PARTITION BY country
    ORDER BY creditLimit DESC
  ) AS rank_by_country
FROM customers;

-- 5. Difference Between Current and Previous creditLimit
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  LEAD(creditLimit, 1) OVER (ORDER BY customerNumber) - creditLimit AS lead_diff,
  creditLimit - LAG(creditLimit, 1) OVER (ORDER BY customerNumber) AS lag_diff
FROM customers;

-- 6. Sum of creditLimit for Current and Next Row
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  creditLimit + LEAD(creditLimit, 1) OVER (ORDER BY customerNumber) AS credit_limit_with_next
FROM customers;

-- 7. Sum of creditLimit for a Sliding Window of 3 Rows
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  SUM(creditLimit) OVER (
    ORDER BY customerNumber
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
  ) AS sliding_window_sum
FROM customers;

-- 8. Cumulative Sum of creditLimit Using RANGE
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  SUM(creditLimit) OVER (
    ORDER BY customerNumber
    RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_sum
FROM customers;

-- 9. Average creditLimit for the Current and Previous 2 Rows
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  AVG(creditLimit) OVER (
    ORDER BY customerNumber
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS avg_credit_limit
FROM customers;

-- 10. Sum of creditLimit for All Rows in the Partition
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  SUM(creditLimit) OVER (
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS total_credit_limit
FROM customers;

-- 11. Row Number Within Each Country
SELECT 
  customerNumber,
  customerName,
  country,
  ROW_NUMBER() OVER (
    PARTITION BY country
    ORDER BY customerNumber
  ) AS row_num_in_country
FROM customers;

-- 12. Sum of creditLimit for a Logical Range Based on customerNumber
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  SUM(creditLimit) OVER (
    ORDER BY customerNumber
    RANGE BETWEEN 10 PRECEDING AND 10 FOLLOWING
  ) AS range_sum
FROM customers;

-- 13. First and Last creditLimit in Each Country
SELECT 
  customerNumber,
  customerName,
  country,
  creditLimit,
  FIRST_VALUE(creditLimit) OVER (
    PARTITION BY country
    ORDER BY customerNumber
    RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW # Even if this line is not written, it will still work. Bcz It's Default Line 
  ) AS first_credit_limit,
  LAST_VALUE(creditLimit) OVER (
    PARTITION BY country
    ORDER BY customerNumber
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_credit_limit
FROM customers;

-- 14. Percentile Rank of creditLimit Within Each Country
SELECT 
  customerNumber,
  customerName,
  country,
  creditLimit,
  PERCENT_RANK() OVER (
    PARTITION BY country
    ORDER BY creditLimit
  ) AS percentile_rank
FROM customers;

-- 15. Cumulative Distribution of creditLimit
SELECT 
  customerNumber,
  customerName,
  creditLimit,
  CUME_DIST() OVER (
    ORDER BY creditLimit
  ) AS cumulative_distribution
FROM customers;
