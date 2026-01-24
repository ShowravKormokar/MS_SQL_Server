IF EXISTS (SELECT name FROM sys.databases WHERE name = 'WorkersDB')
    PRINT 'Database exists';
ELSE
    PRINT 'Database does not exist';


CREATE DATABASE WorkerDB

CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    DEPT_NAME VARCHAR(50),
    JOINING_DATE DATETIME
);

INSERT INTO Employees (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, DEPT_NAME, JOINING_DATE)
VALUES
(1, 'Rana', 'Hamid', 100000, 'HR', '2014-02-20 09:00:00'),
(2, 'Sanjoy', 'Saha', 80000, 'Admin', '2014-06-11 09:00:00'),
(3, 'Mahmudul', 'Hasan', 300000, 'HR', '2014-02-20 09:00:00'),
(4, 'Asad', 'Zaman', 500000, 'Admin', '2014-02-20 09:00:00'),
(5, 'Sajib', 'Mia', 500000, 'Admin', '2014-06-11 09:00:00'),
(6, 'Alamgir', 'Kabir', 200000, 'Account', '2014-06-11 09:00:00'),
(7, 'Foridul', 'Islam', 75000, 'Account', '2014-01-20 09:00:00'),
(8, 'Keshob', 'Ray', 90000, 'Admin', '2014-04-11 09:00:00');


SELECT * FROM Employees;