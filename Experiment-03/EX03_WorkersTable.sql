--USE EmployeeEx03;

-- Create the Worker table
CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50)
);

-- Insert all data into Worker table
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Rana', 'Hamid', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Sanjoy', 'Saha', 80000, '2014-02-20 09:00:00', 'HR'),
(3, 'Mahmudul', 'Hasan', 300000, '2014-06-11 09:00:00', 'Admin'),
(4, 'Asad', 'Zaman', 500000, '2014-02-20 09:00:00', 'HR'),
(5, 'Sajib', 'Mia', 500000, '2014-02-20 09:00:00', 'Admin'),
(6, 'Alamgir', 'Kabir', 200000, '2014-06-11 09:00:00', 'Admin'),
(7, 'Foridul', 'Islam', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Keshob', 'Ray', 90000, '2014-04-11 09:00:00', 'Admin');

-- Verify the data
SELECT * FROM Worker ORDER BY WORKER_ID;