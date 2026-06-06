-- Use Database
USE CompanyDB;

-- 1. Write a sql query to show Project name, cost and Rank according to cost, assign 
--employee name and rearrange the project according to cost ascending order.
SELECT p.P_Name, 
       p.P_Cost, 
       e.Emp_Name,
       RANK() OVER (ORDER BY p.P_Cost ASC) AS CostRank
FROM Tbl_Project p
JOIN Tbl_Emp e ON p.E_id = e.Emp_id
ORDER BY p.P_Cost ASC;

-- 2. Write a sql create UDF query to show Project name, cost and assign employee name and 
--rearrange the project according to cost ascending order. Where Project name and 
--employee name pass by parameter.
CREATE FUNCTION fnProjectDetails
(
    @ProjectName VARCHAR(50),
    @EmpName VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        p.P_Name,
        p.P_Cost,
        e.Emp_Name
    FROM Tbl_Project p
    JOIN Tbl_Emp e
        ON p.E_id = e.Emp_id
    WHERE p.P_Name = @ProjectName
      AND e.Emp_Name = @EmpName
);

SELECT *
FROM fnProjectDetails('Network setup', 'Rasel')
ORDER BY P_Cost ASC;


-- 3. Write a sql query to find the rank of management Team according to their joining Date. 
SELECT Mgt_id, Mgt_Name, Joining_date,
       RANK() OVER (ORDER BY Joining_date ASC) AS JoinRank
FROM Tbl_Management;

-- 4. Write a sql create scalar function that has one parameter. In this function calculate the 
--Salary of employee whose salary is maximum and that salary increase 10%. Where salary column pass by parameter 
CREATE FUNCTION fnMaxSalaryIncrease (@Salary DECIMAL(12,2))
RETURNS DECIMAL(12,2)
AS
BEGIN
	DECLARE @Res DECIMAL(12,2);
	
	SELECT @Res = MAX(e.Salary) * 1.10
	FROM Tbl_Emp e
	WHERE e.Salary = @Salary;
	
	RETURN @Res;
END;

SELECT dbo.fnMaxSalaryIncrease((SELECT MAX(Salary) FROM Tbl_Emp));

-- 5. Write a sql UDF to show the Name of maximum Cost Project. 
CREATE FUNCTION fnMaxCostProject()
RETURNS TABLE
AS
RETURN
(
	SELECT TOP 1 p.P_Name
	FROM Tbl_Project p
	ORDER BY p.P_Cost DESC
)

SELECT * FROM fnMaxCostProject()

-- 6. Write a sql Inline Table Valued function to show the Project name and Cost where cost in 
-- between 1200000 and 2050000. Costs are passed by parameter. 
CREATE FUNCTION fnProjectCostRange
(
	@St_Cost DECIMAL(12,2),
	@Ed_Cost DECIMAL(12,2)
)
RETURNS TABLE
AS
RETURN
(
	SELECT p.P_Name, p.P_Cost
	FROM Tbl_Project p
	WHERE p.P_Cost BETWEEN @St_Cost AND @Ed_Cost
)

SELECT * FROM fnProjectCostRange(1200000,2050000);

-- 7. Create Inline Function like “fnEmployee”, in this function find the Mgt_id, Mgt_Name, 
--Emp_Name, Joining_Date, Salary, P_Name, P_Cost, Delivery_date. Where P_id, Mgt_id, 
--Emp_id  pass by parameter
CREATE FUNCTION fnEmployee
(
    @P_id VARCHAR(10),
    @Mgt_id VARCHAR(10),
    @Emp_id VARCHAR(10)
)
RETURNS TABLE
AS
RETURN
(
	SELECT m.Mgt_id, m.Mgt_Name, e.Emp_Name, e.Joining_Date, e.Salary, p.P_Name, p.P_Cost, p.Delivery_date
	FROM Tbl_Management m
	JOIN Tbl_Project p
	ON p.Mgt_id = m.Mgt_id
	JOIN Tbl_Emp e
	ON p.E_id = e.Emp_id
	WHERE p.P_id = @P_id AND m.Mgt_id = @Mgt_id AND e.Emp_id = @Emp_id
)

SELECT * FROM fnEmployee('P3001','M2016','E1001');
