-- Check Data Exists or Not!
SELECT * FROM Worker;

--1. Write an SQL query to print first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) AS FIRST_NAME_3CHAR
FROM Worker;

--2. Write an SQL query to print details of the Workers who have joined from Feb 2014 to March 2014.
SELECT *
FROM Worker
WHERE JOINING_DATE BETWEEN '2014-02-01 00:00:00' AND '2014-03-31 23:59:59';

-- Alternative using MONTH and YEAR functions
SELECT *
FROM Worker
WHERE YEAR(JOINING_DATE) = 2014 
  AND MONTH(JOINING_DATE) BETWEEN 2 AND 3;

--3. Write an SQL query to print details of the Workers who have served for at least 6 months.
SELECT *
FROM Worker
WHERE DATEDIFF(MONTH,JOINING_DATE,'2014-12-31') >= 6; --let's use '2014-12-31' as reference.

-- For current date calculation
SELECT *
FROM Worker
WHERE DATEDIFF(MONTH, JOINING_DATE, GETDATE()) >= 6;

--4. Write an SQL query to update all worker salary whose title is manager.
-- Note: We don't have a "title" column in the provided table structure

--5. Write an SQL query to update all worker bonus 10% whose joining_date before '2014-04-11 09:00:00' otherwise bonus update 5% and also check department name is 'Admin'.
-- Note: We don't have a "bonus" column.
UPDATE Worker
SET SALARY = 
	CASE
		WHEN JOINING_DATE < '2014-04-11 09:00:00' AND DEPARTMENT = 'Admin'
		THEN SALARY * 0.10
		WHEN JOINING_DATE > '2014-04-11 09:00:00' AND DEPARTMENT = 'Admin'
		THEN SALARY *0.05
		ELSE SALARY
	END
WHERE DEPARTMENT = 'Admin';

--Another way
UPDATE Worker
SET SALARY = 
    CASE
        WHEN JOINING_DATE < '2014-04-11 09:00:00' AND DEPARTMENT = 'Admin' 
        THEN SALARY * 1.10
        ELSE SALARY * 1.05
    END
WHERE DEPARTMENT = 'Admin';

--6. Write an SQL query to delete all workers who have not taken any bonus.
-- Note: We don't have a "bonus" column.
DELETE FROM Worker 
WHERE BONUS IS NULL OR BONUS = 0;

--7. Write an SQL query to print details for Workers with the first name "Rana" and "Sajib" from Worker table.
SELECT *
FROM Worker
WHERE FIRST_NAME = 'Rana' OR FIRST_NAME = 'Sajib';						

--Another way
SELECT *
FROM Worker
WHERE FIRST_NAME IN ('Rana','Sajib');

--8. Write an SQL query to print details of workers excluding first names, "Rana" and "Sajib" from Worker table.
SELECT *
FROM Worker
WHERE FIRST_NAME NOT IN ('Rana', 'Sajib');

--9. Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a%';

--10. Write an SQL query to print details of the Workers whose FIRST_NAME starts with 'k'.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE 'k%';

--11. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'r' and contains seven alphabets.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '______r';

--12. Write an SQL query to find the position of the alphabet ('n') in the FIRST_NAME column 'Sanjoy' from Worker table.
SELECT 
    FIRST_NAME,
    CHARINDEX('n', FIRST_NAME) AS First_Position_of_n
FROM Worker
WHERE FIRST_NAME = 'Sanjoy';

--13. Find the average salary of employees for each department.
SELECT 
    DEPARTMENT,
    AVG(SALARY) AS Average_Salary,
    COUNT(*) AS Employee_Count
FROM Worker
GROUP BY DEPARTMENT;

--14. List all the employees who have maximum or minimum salary in each department
-- Not understand fully
SELECT w.FIRST_NAME, w.SALARY, w.DEPARTMENT
FROM Worker w
JOIN (
    SELECT DEPARTMENT, MAX(SALARY) AS MAX_SALARY,
           MIN(SALARY) AS MIN_SALARY
    FROM Worker
    GROUP BY DEPARTMENT
) TempTable
ON w.DEPARTMENT = TempTable.DEPARTMENT
AND (w.SALARY = TempTable.MAX_SALARY OR w.SALARY = TempTable.MIN_SALARY);

--Another way
SELECT *
FROM Worker
WHERE SALARY IN (
    SELECT MAX(SALARY) FROM Worker GROUP BY DEPARTMENT
    UNION
    SELECT MIN(SALARY) FROM Worker GROUP BY DEPARTMENT
);


--15. Write an SQL query to find the position of the alphabet ('r') in the FIRST_NAME column 'Rana' from Worker table.
SELECT CHARINDEX('r', FIRST_NAME) AS Position_of_r
FROM Worker
WHERE FIRST_NAME = 'Rana';

--16. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) AS Trimmed_FirstName
FROM Worker;

--17. Write an SQL query that fetches the unique values of FIRST_NAME from Worker table and prints its length.
SELECT 
    DISTINCT FIRST_NAME,
    LEN(FIRST_NAME) AS Name_Length
FROM Worker
ORDER BY FIRST_NAME;

--18. Write an SQL query to print the FIRST_NAME from Worker table after replacing 'a' with 'A'.
SELECT 
    FIRST_NAME,
    REPLACE(FIRST_NAME, 'a', 'A') AS Modified_FirstName
FROM Worker;