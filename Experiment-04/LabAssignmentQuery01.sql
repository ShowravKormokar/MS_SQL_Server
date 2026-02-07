--1. List all the employees except ‘Manager’ & ‘Asst. Manager’.
SELECT *
FROM Worker w JOIN Title b
ON w.WORKER_ID = b.WORKER_REF_ID
WHERE WORKER_TITLE NOT IN ('Manager','Asst. Manager');

--2. List the workers in the ascending order of Designations of those joined after April 2014.
SELECT w.WORKER_ID,
       w.FIRST_NAME,
       w.LAST_NAME,
       w.JOINING_DATE,
       t.WORKER_TITLE
FROM Worker w
JOIN Title t
    ON w.WORKER_ID = t.WORKER_REF_ID
WHERE w.JOINING_DATE > '2014-04-01'
ORDER BY t.WORKER_TITLE ASC;

--3. Write an SQL query to fetch the number of employees working in the department ‘Admin’.
SELECT DEPARTMENT, COUNT(*) AS NO_EMP
FROM Worker
GROUP BY DEPARTMENT
HAVING DEPARTMENT = 'Admin';

--4. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT FIRST_NAME + LAST_NAME AS FULL_NAME
FROM Worker
WHERE SALARY BETWEEN 50000 AND 100000;

--5. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(*) AS NO_EMP
FROM Worker
GROUP BY DEPARTMENT
ORDER BY NO_EMP DESC;

--6. Write an SQL query to print details of the Workers who are also Managers.
SELECT w.*,t.WORKER_TITLE
FROM Worker w JOIN Title t
ON w.WORKER_ID = t.WORKER_REF_ID
WHERE WORKER_TITLE = 'Manager';

--7. Write an SQL query to show only odd rows from a table.
SELECT *
FROM Worker
WHERE WORKER_ID % 2 = 1;

--8. Write an SQL query to show only even rows from a table.
SELECT *
FROM Worker
WHERE WORKER_ID % 2 = 0;

--9. Write an SQL query to clone a new table from another table. 
SELECT *
INTO WorkerClone
FROM Worker;

--10.  Write an SQL query to show the current date and time.
SELECT GETDATE() AS CurrentDateTime;

--11.  Write an SQL query to show the top n (say 10) records of a table with Name and Designation.
SELECT TOP 10 W.FIRST_NAME, W.LAST_NAME, T.WORKER_TITLE
FROM Worker W
JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID;

--12. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT DISTINCT SALARY
FROM Worker W1
WHERE 5 = (
    SELECT COUNT(DISTINCT SALARY)
    FROM Worker W2
    WHERE W2.SALARY >= W1.SALARY
);

--13. Write an SQL query to fetch the list of employees with the same salary.
SELECT W1.FIRST_NAME, W1.LAST_NAME, W1.SALARY
FROM Worker W1
JOIN Worker W2 ON W1.SALARY = W2.SALARY AND W1.WORKER_ID <> W2.WORKER_ID
ORDER BY W1.SALARY;
