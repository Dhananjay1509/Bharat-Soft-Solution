USE w2;

-- Drop the table if it already exists
DROP TABLE IF EXISTS DateTimeData;

CREATE TABLE DateTimeData (
    ID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    EventTime TIME,
    EventDateTime DATETIME,
    EventTimestamp TIMESTAMP,
    EventYear YEAR,
    EventMonth INT,
    EventDay INT
);

INSERT INTO DateTimeData (ID, EventName, EventDate, EventTime, EventDateTime, EventTimestamp, EventYear, EventMonth, EventDay)
VALUES
(1, 'Makar Sankranti', '2025-01-14', '06:00:00', '2025-01-14 06:00:00', '2025-01-14 06:00:00', 2025, 1, 14),
(2, 'Republic Day', '2025-01-26', '08:00:00', '2025-01-26 08:00:00', '2025-01-26 08:00:00', 2025, 1, 26),
(3, 'Maha Shivaratri', '2025-02-26', '20:00:00', '2025-02-26 20:00:00', '2025-02-26 20:00:00', 2025, 2, 26),
(4, 'Holi', '2025-03-14', '12:00:00', '2025-03-14 12:00:00', '2025-03-14 12:00:00', 2025, 3, 14),
(5, 'Ugadi', '2025-03-30', '08:00:00', '2025-03-30 08:00:00', '2025-03-30 08:00:00', 2025, 3, 30),
(6, 'Ram Navami', '2025-04-06', '09:00:00', '2025-04-06 09:00:00', '2025-04-06 09:00:00', 2025, 4, 6),
(7, 'Mahavir Jayanti', '2025-04-10', '10:00:00', '2025-04-10 10:00:00', '2025-04-10 10:00:00', 2025, 4, 10),
(8, 'Good Friday', '2025-04-18', '14:00:00', '2025-04-18 14:00:00', '2025-04-18 14:00:00', 2025, 4, 18),
(9, 'Eid al-Fitr', '2025-03-31', '18:00:00', '2025-03-31 18:00:00', '2025-03-31 18:00:00', 2025, 3, 31),
(10, 'Buddha Purnima', '2025-05-12', '12:00:00', '2025-05-12 12:00:00', '2025-05-12 12:00:00', 2025, 5, 12),
(11, 'Eid al-Adha', '2025-06-07', '08:00:00', '2025-06-07 08:00:00', '2025-06-07 08:00:00', 2025, 6, 7),
(12, 'Independence Day', '2025-08-15', '08:00:00', '2025-08-15 08:00:00', '2025-08-15 08:00:00', 2025, 8, 15),
(13, 'Raksha Bandhan', '2025-08-09', '11:00:00', '2025-08-09 11:00:00', '2025-08-09 11:00:00', 2025, 8, 9),
(14, 'Janmashtami', '2025-08-16', '20:00:00', '2025-08-16 20:00:00', '2025-08-16 20:00:00', 2025, 8, 16),
(15, 'Ganesh Chaturthi', '2025-08-27', '09:00:00', '2025-08-27 09:00:00', '2025-08-27 09:00:00', 2025, 8, 27),
(16, 'Navratri Begins', '2025-09-22', '06:00:00', '2025-09-22 06:00:00', '2025-09-22 06:00:00', 2025, 9, 22),
(17, 'Dussehra', '2025-10-02', '12:00:00', '2025-10-02 12:00:00', '2025-10-02 12:00:00', 2025, 10, 2),
(18, 'Diwali', '2025-10-20', '19:00:00', '2025-10-20 19:00:00', '2025-10-20 19:00:00', 2025, 10, 20),
(19, 'Guru Nanak Jayanti', '2025-11-05', '10:00:00', '2025-11-05 10:00:00', '2025-11-05 10:00:00', 2025, 11, 5),
(20, 'Christmas', '2025-12-25', '00:00:00', '2025-12-25 00:00:00', '2025-12-25 00:00:00', 2025, 12, 25),
(21, 'New Year\'s Eve', '2025-12-31', '23:59:59', '2025-12-31 23:59:59', '2025-12-31 23:59:59', 2025, 12, 31);

# Query to Select Data

SELECT ID, EventName, EventDate, EventTime, EventDateTime, EventTimestamp, EventYear, EventMonth, EventDay 
FROM DateTimeData;

# To verify the data after insertion, you can use this query:
SELECT * FROM DateTimeData ORDER BY EventDate;
 
/*
current_date_time_functions;
+---------------------+---------------------------------------------------------+
| Function            | Description                                             |
+---------------------+---------------------------------------------------------+
| CURDATE()           | Returns the current date (YYYY-MM-DD)                   |
| CURRENT_DATE()      | Synonym for CURDATE()                                   |
| CURTIME()           | Returns the current time (HH:MM:SS)                     |
| CURRENT_TIME()      | Synonym for CURTIME()                                   |
| NOW()               | Returns the current date and time                       |
| SYSDATE()           | Returns the date and time when executed                 |
| UTC_DATE()          | Returns the current UTC date                            |
| UTC_TIME()          | Returns the current UTC time                            |
| UTC_TIMESTAMP()     | Returns the current UTC date and time                   |
+---------------------+---------------------------------------------------------+

date_time_extraction_functions
+------------------------+-----------------------------------------------+
| Function               | Description                                   |
+------------------------+-----------------------------------------------+
| EXTRACT(unit FROM date)| Extracts specific parts of the date           |
| YEAR(date)             | Returns the year from a date                  |
| MONTH(date)            | Returns the month from a date                 |
| DAY(date)              | Returns the day of the month                  |
| HOUR(time)             | Returns the hour from a time                  |
| MINUTE(time)           | Returns the minute from a time                |
| SECOND(time)           | Returns the second from a time                |
| DAYOFWEEK(date)        | Returns the weekday index (1 = Sunday)        |
| DAYOFMONTH(date)       | Returns the day of the month                   |
| DAYOFYEAR(date)        | Returns the day of the year                    |
| WEEK(date)             | Returns the week number                        |
| QUARTER(date)          | Returns the quarter (1-4)                      |
+------------------------+-----------------------------------------------+

date_time_manipulation_functions
+-------------------------------------+---------------------------------------------------------+
| Function                            | Description                                             |
+-------------------------------------+---------------------------------------------------------+
| ADDDATE(date, INTERVAL value unit)  | Adds an interval to a date                              |
| DATE_ADD(date, INTERVAL value unit) | Synonym for ADDDATE()                                   |
| SUBDATE(date, INTERVAL value unit)  | Subtracts an interval from a date                       |
| DATE_SUB(date, INTERVAL value unit) | Synonym for SUBDATE()                                   |
| DATEDIFF(date1, date2)              | Difference between two dates in days                    |
| TIMEDIFF(time1, time2)              | Difference between two times                            |
| DATE_FORMAT(date, format)           | Formats a date with a specific pattern                  |
| TIME_FORMAT(time, format)           | Formats a time with a specific pattern                  |
+-------------------------------------+---------------------------------------------------------+

conversion_functions
+-----------------------------+---------------------------------------------------------+
| Function                    | Description                                             |
+-----------------------------+---------------------------------------------------------+
| STR_TO_DATE(str, format)    | Parses a string into a date                             |
| DATE()                      | Extracts the date part from a datetime value            |
| TIME()                      | Extracts the time part from a datetime value            |
| UNIX_TIMESTAMP()            | Converts date-time to Unix timestamp                    |
| FROM_UNIXTIME(timestamp)    | Converts a timestamp to date-time                       |
| CAST(date_time AS DATE)     | Converts a value to a date                              |
+-----------------------------+---------------------------------------------------------+

*/

# 1. Select all events in the year 2025:
SELECT * FROM DateTimeData WHERE EventYear = 2025;

# 2. Select events that occurred in August:
SELECT * FROM DateTimeData WHERE EventMonth = 8;

# 3. Select events that occurred at 12:00 PM:
SELECT * FROM DateTimeData WHERE EventTime = '12:00:00';

# 4. Select events that occurred on or after March 1, 2025:
SELECT * FROM DateTimeData WHERE EventDate >= '2025-03-01';

# 5. Select events that occurred between 10:00 AM and 2:00 PM:
SELECT * FROM DateTimeData WHERE EventTime BETWEEN '10:00:00' AND '14:00:00';

# 6. Extract the day of the week for each event:
SELECT EventName, EventDate, DAYNAME(EventDate) AS DayOfWeek
FROM DateTimeData;

# 7. Find the number of events that occurred on a weekend:
SELECT COUNT(*) AS WeekendEvents
FROM DateTimeData
WHERE DAYOFWEEK(EventDate) IN (1, 7);

# 8. Extract the month name for each event:
SELECT EventName, EventDate, MONTHNAME(EventDate) AS MonthName
FROM DateTimeData;

# 9. Find the total number of events in each month:
SELECT MONTHNAME(EventDate) AS MonthName, COUNT(*) AS TotalEvents
FROM DateTimeData
GROUP BY MONTHNAME(EventDate), MONTH(EventDate)
ORDER BY MONTH(EventDate);

# 10. Find the earliest and latest event dates:
SELECT 
    MIN(EventDate) AS EarliestEventDate,
    MAX(EventDate) AS LatestEventDate
FROM DateTimeData;

# 11. Extract the hour from the EventTime column:
SELECT 
    EventName, 
    EventTime, 
    HOUR(EventTime) AS EventHour
FROM DateTimeData;

# 12. Find events that occurred in the afternoon:
SELECT 
    EventName, 
    EventTime
FROM DateTimeData
WHERE HOUR(EventTime) BETWEEN 12 AND 17;

# 13. Calculate the number of days between each event and New Year's Day (2025-01-01):
SELECT 
    EventName, 
    EventDate, 
    DATEDIFF(EventDate, '2025-01-01') AS DaysFromNewYear
FROM DateTimeData;

# 14. Find events that occurred in the first quarter:
SELECT 
    EventName, 
    EventDate
FROM DateTimeData
WHERE QUARTER(EventDate) = 1;

# 15. Extract the year from the EventDateTime column:
SELECT 
    EventName, 
    EventDateTime, 
    YEAR(EventDateTime) AS EventYear
FROM DateTimeData;
#16. Find events that occurred on the last day of the month:
SELECT 
    EventName, 
    EventDate
FROM DateTimeData
WHERE EventDate = LAST_DAY(EventDate);

# 17. Calculate the difference in hours between EventDateTime and EventTimestamp:
SELECT 
    EventName, 
    EventDateTime, 
    EventTimestamp, 
    TIMESTAMPDIFF(HOUR, EventDateTime, EventTimestamp) AS HourDifference
FROM DateTimeData;

# 18. Find events that occurred in the same month as Republic Day (2025-01-26):
SELECT 
    EventName, 
    EventDate
FROM DateTimeData
WHERE MONTH(EventDate) = MONTH('2025-01-26');

# 19. Extract the week of the year for each event:
SELECT 
    EventName, 
    EventDate, 
    WEEK(EventDate) AS WeekOfYear
FROM DateTimeData;

# 20. Find events that occurred on a Sunday:
SELECT 
    EventName, 
    EventDate
FROM DateTimeData
WHERE DAYOFWEEK(EventDate) = 1;
# 21. Calculate the age of each event in days:

SELECT 
    EventName, 
    EventDate, 
    DATEDIFF(CURDATE(), DATE(EventDate)) AS AgeInDays
FROM DateTimeData;

# 22. Find events that occurred in the last 6 months:
SELECT 
    EventName, 
    EventDate
FROM DateTimeData
WHERE EventDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

# 23. Extract the minute part of the EventTime column:
SELECT 
    EventName, 
    EventTime, 
    MINUTE(EventTime) AS EventMinute
FROM DateTimeData;

# 24. Find events that occurred on the same day as Independence Day (2025-08-15):
SELECT 
    EventName, 
    EventDate
FROM DateTimeData
WHERE EventDate = '2025-08-15';

# 25. Calculate the total number of events per year:
SELECT 
    YEAR(EventDate) AS EventYear, 
    COUNT(*) AS TotalEvents
FROM DateTimeData
GROUP BY YEAR(EventDate);


-- System Date/Time Functions
-- Basic Date Extraction Functions
-- Extract year from a date
SELECT YEAR('2025-01-14') AS Year;  

-- Extract month from a date
SELECT MONTH('2025-01-14') AS Month;  

-- Extract day from a date
SELECT DAY('2025-01-14') AS Day;  

-- Extract quarter from a date
SELECT QUARTER('2025-01-14') AS Quarter;

-- Time Extraction Functions
-- Extract time components
SELECT 
    HOUR('15:30:45') AS Hour,     
    MINUTE('15:30:45') AS Minute,  
    SECOND('15:30:45') AS Second; 

-- Extract microsecond precision
SELECT MICROSECOND('15:30:45.123456') AS Microseconds; 

-- Week and Day Functions
-- Extract week information
SELECT 
    WEEK('2025-01-14') AS WeekNumber,  -- Returns: 2
    WEEKDAY('2025-01-14') AS Weekday;  -- Returns: 1 (Monday = 0)

-- Extract day name
SELECT 
    DAYNAME('2025-01-14') AS DayName, 
    DAYOFWEEK('2025-01-14') AS DayOfWeek;  
    
-- Extract various date/time components using EXTRACT
SELECT 
    EXTRACT(YEAR FROM '2025-01-14') AS Year,
    EXTRACT(MONTH FROM '2025-01-14') AS Month,
    EXTRACT(DAY FROM '2025-01-14') AS Day,
    EXTRACT(HOUR FROM '2025-01-14 15:30:45') AS Hour,
    EXTRACT(MINUTE FROM '2025-01-14 15:30:45') AS Minute,
    EXTRACT(SECOND FROM '2025-01-14 15:30:45') AS Second;
    
-- Extract multiple components at once
SELECT 
    YEAR(EventDate) AS Year,
    QUARTER(EventDate) AS Quarter,
    MONTH(EventDate) AS Month,
    WEEK(EventDate) AS Week,
    DAY(EventDate) AS Day,
    HOUR(EventDateTime) AS Hour,
    MINUTE(EventDateTime) AS Minute
FROM DateTimeData;

-- Extract components with grouping
SELECT 
    YEAR(EventDate) AS Year,
    QUARTER(EventDate) AS Quarter,
    COUNT(*) AS Events,
    GROUP_CONCAT(DISTINCT MONTH(EventDate)) AS Months
FROM DateTimeData
GROUP BY YEAR(EventDate), QUARTER(EventDate)
ORDER BY Year, Quarter;