CREATE DATABASE VU_Em;

USE VU_Em;

--1st table structure
CREATE TABLE Employee (
    TID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Dept NVARCHAR(50),
    Age INT,
    Salary INT
);

--2nd table structure
CREATE TABLE Department (
    deptID INT PRIMARY KEY,
    deptName NVARCHAR(50),
    location NVARCHAR(50)
);

-- Insert data on 1st table (Employee)
INSERT INTO Employee (TID, FirstName, LastName, Dept, Age, Salary)
VALUES
(1, 'Mizanur', 'Rahman', 'CSE', 28, 35000),
(2, 'Delwar', 'Hossain', 'CSE', 26, 33000),
(3, 'Shafiul', 'Islam', 'EEE', 24, 30000),
(4, 'Faisal', 'Imran', 'CSE', 30, 50000),
(5, 'Ahsan', 'Habib', 'English', 28, 28000);

-- Insert data on 2nd table (Depertment)
INSERT INTO Department (deptID, deptName, location)
VALUES
(1, 'CSE', 'Talaimari'),
(2, 'EEE', 'Talaimari'),
(3, 'English', 'Kazla'),
(4, 'BBA', 'Talaimari');

-- fetch to verify the inserted data
SELECT * FROM Employee;
SELECT * FROM Department;
