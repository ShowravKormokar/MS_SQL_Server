-- Show only even rows from a table.
SELECT * 
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY _ID) AS ROW_NUM
    FROM TABLE_NAME_
) T
WHERE ROW_NUM % 2 = 0

-- Show only odd rows from a table.
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY _ID) AS ROW_NUM
    FROM TABLE_NAME_
) T
WHERE ROW_NUM % 2 = 1

-- Show only first 50% rows from table.
SELECT TOP 50 PERCENT *
FROM TABLE_NAME_
ORDER BY _ID

-- Without PERCENT keyword
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY _ID) AS ROW_NUM,
    COUNT(*) OVER() AS TRs
    FROM TABLE_NAME_
) T
WHERE ROW_NUM <= TRs /2

-- Show only last 50% rows from table.
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY _ID) AS ROW_NUM,
    COUNT(*) OVER() AS TRs
    FROM TABLE_NAME_
) T
WHERE ROW_NUM > TRs /2

-- Show middle 50% rows from table.
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER(ORDER BY _ID) AS R_N,
        COUNT(*) OVER() AS T_R
    FROM TABLE_NAME
) T
WHERE R_N BETWEEN T_R * 0.25 AND T_R * 0.75

-- Show first N rows from table
SELECT TOP 10 *
FROM Employees
ORDER BY ID;

-- Show every 3rd rows from table.
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY _ID) AS ROW_NUM
    FROM TABLE_NAME_
) T
WHERE ROW_NUM % 3 = 0