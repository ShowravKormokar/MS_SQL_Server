-- Create Database
CREATE DATABASE CompanyDB;
GO

-- Use Database
USE CompanyDB;
GO

-- Create Management Table
CREATE TABLE Tbl_Management (
    Mgt_id VARCHAR(10) PRIMARY KEY,
    Mgt_Name VARCHAR(50),
    Joining_date DATE,
    Salary DECIMAL(12,2),
    Position VARCHAR(50)
);

-- Insert Management Data
INSERT INTO Tbl_Management (Mgt_id, Mgt_Name, Joining_date, Salary, Position) VALUES
('M2015', 'Keshob', '2001-01-18', 250000, 'Managing Director'),
('M2016', 'Rana',   '2003-01-30', 180000, 'Secretary'),
('M2017', 'Jasim',  '2004-04-12', 150000, 'Join secretary'),
('M2018', 'Rajon',  '2004-06-18', 140000, 'Join secretary');

-- Create Employee Table
CREATE TABLE Tbl_Emp (
    Emp_id VARCHAR(10) PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Joining_Date DATE,
    Salary DECIMAL(12,2),
    Division VARCHAR(50)
);

-- Insert Employee Data
INSERT INTO Tbl_Emp (Emp_id, Emp_Name, Joining_Date, Salary, Division) VALUES
('E1001', 'Suman',   '2003-04-25', 92000, 'Software'),
('E1002', 'Rasel',   '2004-03-13', 86000, 'Network'),
('E1003', 'Hossain', '2004-06-21', 82000, 'Software'),
('E1004', 'Polash',  '2005-05-05', 9800,  'Network');

-- Create Project Table
CREATE TABLE Tbl_Project (
    P_id VARCHAR(10) PRIMARY KEY,
    P_Name VARCHAR(50),
    Mgt_id VARCHAR(10) FOREIGN KEY REFERENCES Tbl_Management(Mgt_id),
    E_id VARCHAR(10) FOREIGN KEY REFERENCES Tbl_Emp(Emp_id),
    P_Cost DECIMAL(12,2),
    Delivery_date DATE
);

-- Insert Project Data
INSERT INTO Tbl_Project (P_id, P_Name, Mgt_id, E_id, P_Cost, Delivery_date) VALUES
('P3001', 'Office Automation',   'M2016', 'E1001', 2050000, '2016-05-08'),
('P3002', 'Repair Hub',          'M2016', 'E1004', 1200000, '2017-06-14'),
('P3003', 'Server Installation', 'M2018', 'E1001', 1500500, '2018-02-13'),
('P3004', 'Network setup',       'M2017', 'E1002', 2505000, '2018-03-12');
