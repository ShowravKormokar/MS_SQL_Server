--1. Allow NULL for all columns except WORKER_ID.
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL,
    FIRST_NAME VARCHAR(50) NULL,
    LAST_NAME VARCHAR(50) NULL,
    SALARY DECIMAL(10,2) NULL,
    DEPT_NAME VARCHAR(50) NULL,
    JOINING_DATE DATETIME NULL
);

--2. Add constraints to check, while entering the SALARY value (i.e) SALARY > 100.
ALTER TABLE Worker
ADD CONSTRAINT CHK_Salary CHECK (SALARY > 100);


--3. Define the field FIRST_NAME as UNIQUE.
ALTER TABLE Worker
ADD CONSTRAINT UQ_FirstName UNIQUE (FIRST_NAME);

--4. Create a primary key constraint for the column (WORKER_ID).
ALTER TABLE Worker
ADD CONSTRAINT PK_Worker PRIMARY KEY (WORKER_ID);

