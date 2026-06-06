-- Create Database
CREATE DATABASE BankDB;
GO

-- Use Database
USE BankDB;
GO

-- Create Zone Table
CREATE TABLE Zone (
    Zone_Id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50)
);

-- Insert Zone Data
INSERT INTO Zone (Zone_Id, Name) VALUES
('Z-801', 'Sirajgonj'),
('Z-802', 'Rajshahi'),
('Z-803', 'Dhaka'),
('Z-804', 'Chittagong');

-- Create Branch Table
CREATE TABLE Branch (
    Br_Id VARCHAR(10) PRIMARY KEY,
    Branch_Name VARCHAR(50)
);

-- Insert Branch Data
INSERT INTO Branch (Br_Id, Branch_Name) VALUES
('B-101', 'Bonani'),
('B-102', 'Romna'),
('B-103', 'Shaheb bazar'),
('B-104', 'Ullapara');

-- Create Account_Detail Table
CREATE TABLE Account_Detail (
    Account_no INT PRIMARY KEY,
    Acc_holder_name VARCHAR(50),
    Amount DECIMAL(12,2),
    Branch_Id VARCHAR(10) FOREIGN KEY REFERENCES Branch(Br_Id),
    Zone_Id VARCHAR(10) FOREIGN KEY REFERENCES Zone(Zone_Id)
);

-- Insert Account_Detail Data
INSERT INTO Account_Detail (Account_no, Acc_holder_name, Amount, Branch_Id, Zone_Id) VALUES
(1992212, 'Mr. Nazmuzzaman', 200000, 'B-101', 'Z-803'),
(1992213, 'Mr. Jibon',       170000, 'B-102', 'Z-803'),
(1882212, 'Bushra',          180000, 'B-103', 'Z-802'),
(1882213, 'Sajib',           170000, 'B-104', 'Z-801');

select * from Account_Detail
select * from Zone
select * from Branch
