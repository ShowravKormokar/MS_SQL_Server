-- Create database
CREATE DATABASE WorkerDB

--1. Create a table Worker with following schema: (WORKER_ID(PK), FIRST_NAME, LAST_NAME, SALARY, DEPT_NAME)
CREATE TABLE Worker(
	WORKER_ID INT PRIMARY KEY,
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	SALARY VARCHAR(50),
	DEPT_NAME VARCHAR(50)
);

--DROP TABLE Worker; -- If needed when bigest mistake.

--2. Add a new column; JOINING_DATE to the existing relation.
ALTER TABLE Worker
ADD JOINING_DATE DATETIME;

SELECT * FROM Worker; -- Check Table

--3. Change the datatype of SALARY.
ALTER TABLE Worker
ALTER COLUMN SALARY INT;

--4. Change the name of column/field DEPT_NAME  to  DEPARTMENT.
EXEC sp_rename 'Worker.DEPT_NAME', 'DEPARTMENT', 'COLUMN';

--5. Modify the column width of the DEPARTMENT field of EMPLOYEE table
ALTER TABLE Worker
ALTER COLUMN DEPARTMENT VARCHAR(60);


-- Show Table
SELECT * FROM Worker;