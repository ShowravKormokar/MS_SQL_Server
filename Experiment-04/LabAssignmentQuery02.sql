-- Using database:
USE VU_Em;

--1. Update the Salary of Teacher by 15% whose DeptName is ‘CSE, otherwise update by 10% Salary.
UPDATE Employee
SET Salary = CASE
    WHEN Dept = 'CSE'
    THEN Salary * 1.15
    ELSE Salary * 1.10
END;

--2. Write a query to insert/copy the values of all attributes from one table to another using (ID in) subquery.
INSERT INTO EmployeeCopy (TID, FirstName, LastName, Dept, Age, Salary)
SELECT TID, FirstName, LastName, Dept, Age, Salary
FROM Employee
WHERE TID IN (SELECT TID FROM Employee);

--3. Write  a query to find firstname and lastname as fullname , age whose salary is maximum.
SELECT FirstName + ' ' + LastName AS FullName, Age
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

--4. Write  a query to find firstname, age,dept whose age is between 23 to 27.
SELECT FirstName, Age, Dept
FROM Employee
WHERE Age BETWEEN 23 AND 27;

--5. Write a query to find TID,firstname whose salary is less than average salary.
SELECT TID, FirstName, Salary
FROM Employee
WHERE Salary < (SELECT AVG(Salary) FROM Employee);

--6. Write a query to update Dept  by  ‘English’ where Dept is ‘EEE’ using subquery.
UPDATE Employee
SET Dept = 'English'
WHERE Dept IN (SELECT deptName FROM DeptLocation WHERE deptName = 'EEE');

--7. Write a query to update salary by multiplying the salary by 100 where salary is greater than 5000 using subquery.
UPDATE Employee
SET Salary = Salary * 100
WHERE Salary IN (SELECT Salary FROM Employee WHERE Salary > 5000);

--8. Write a query to find the name that starts with ‘k/s’ using a subquery.
SELECT FirstName
FROM Employee
WHERE FirstName IN (
    SELECT FirstName  FROM Employee WHERE FirstName LIKE 'k%' OR FirstName LIKE 's%'
);

--9. Find the Firstname,salary for all the teachers of CSE who have a higher salary than Delwar Hossain using subquery.
SELECT FirstName, Salary
FROM Employee
WHERE Dept = 'CSE'
    AND Salary > (
        SELECT Salary FROM Employee WHERE FirstName = 'Delwar' AND LastName = 'Hossain'
    );

--10. Find out the id,names of all teachers who belong to the same department as the teacher ‘Mizanur’.
SELECT TID, FirstName, LastName
FROM Employee
WHERE Dept = (
    SELECT Dept FROM Employee WHERE FirstName = 'Mizanur'
);

--11. Find TID, salary, deptID  whose salary is greater than average salary.
SELECT E.TID, E.Salary, D.deptID
FROM Employee E
JOIN Department D ON E.Dept = D.deptName
WHERE E.Salary > (SELECT AVG(Salary) FROM Employee);

--12. Find min salary from Teacher for each department where min salary is less than average salary.
SELECT Dept, MIN(Salary) AS MinSalary
FROM Employee
GROUP BY Dept
HAVING MIN(Salary) < (SELECT AVG(Salary) FROM Employee);

--13. Find firstname, lastname, Dept where location name is kajla using subquery.
SELECT E.FirstName, E.LastName, E.Dept
FROM Employee E
WHERE E.Dept IN (SELECT deptName FROM Department WHERE location = 'Kazla');

--14. Write a query to find the TID,firsname,salary where the length of the firstname is at least 6.
SELECT TID, FirstName, Salary
FROM Employee
WHERE LEN(FirstName) >= 6;