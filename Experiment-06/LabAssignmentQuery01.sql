-- Use Database
USE BankDB;

-- 1. Create a simple stored procedure “SPdetails” to find Acc_holder_name, Amount, Branch_Name and Zone_Name.
CREATE PROC SPdetails
AS
BEGIN
	SELECT a.Account_no, a.Acc_holder_name, Amount,  b.Branch_Name, z.Name
	FROM Account_Detail a
	JOIN Branch b
	ON a.Branch_Id = b.Br_Id
	JOIN Zone z
	ON a.Zone_Id = z.Zone_Id
END;

EXEC SPdetails;

-- 2. Create a simple stored procedure “SPaverage” to find Branch_name and Amount of Branch where amount will be greater than 
	--particular amount (say 17000). Here branch_name and amount will be passed by parameter.
ALTER PROC SPaverage
@br_name varchar(20),
@amt DECIMAL(12,2)
AS
BEGIN
	SELECT b.Branch_Name, a.Amount
	FROM Account_Detail a
	JOIN Branch b
	ON a.Branch_Id = b.Br_Id
	WHERE b.Branch_Name = @br_name AND a.Amount > @amt
END;

EXEC SPaverage @br_name = 'Romna', @amt=17000;

-- 3. Create a simple stored procedure “SPbalance” to find Amount of a particular zone. Here zone name will be passed by
	-- parameter and amount will be shown by using return value ().
ALTER PROC SPbalance
@zn_name varchar(20)
AS
BEGIN
	RETURN(
		SELECT TOP 1 a.Amount
		FROM Account_Detail a
		JOIN Zone z
		ON a.Zone_Id = z.Zone_Id
		WHERE z.Name = @zn_name
	)
END;

DECLARE @Amt DECIMAL(12,2)
EXEC @Amt=SPbalance @zn_name='Dhaka'

IF (@Amt IS NULL)
	PRINT 'No data found'
ELSE 
	PRINT @Amt
;

-- 4. Create a simple stored procedure “SPamount” to find all account holders name with their branch name and zone name whose
	-- name has substring ‘Mr.’ and Amount less than Maximum Amount.
CREATE PROC SPamount
AS
BEGIN
	DECLARE @MaxAmount DECIMAL(12,2);
    SELECT @MaxAmount = MAX(Amount) FROM Account_Detail;
    
	SELECT a.Acc_holder_name, a.Amount,  b.Branch_Name, z.Name
	FROM Account_Detail a
	JOIN Branch b
	ON a.Branch_Id = b.Br_Id
	JOIN Zone z
	ON a.Zone_Id = z.Zone_Id
	WHERE a.Acc_holder_name LIKE '%Mr.%'
	AND a.Amount < @MaxAmount;
END;

EXEC SPamount;

-- 5. Create a simple stored procedure “SPdetailsInfo” to find number of customer of each Zone. Here number of customers need to
	-- be printed as output parameter and zone_name will be passed as parameter.
CREATE PROC SPdetailsInfo
@zn_name varchar(20),
@Count_Cus int OUTPUT
AS BEGIN
	SELECT @Count_Cus = Count(*)
		FROM Account_Detail a
		JOIN Zone z
		ON a.Zone_Id = z.Zone_Id
		WHERE z.Name = @zn_name;
END;

DECLARE @Total_Cus INT;
EXEC SPdetailsInfo @zn_name = 'Dhaka', @Count_Cus = @Total_Cus OUTPUT;
PRINT @Total_Cus;

-- 6. Create procedure like “spEmployeeSalaryDetails1” which has four parameters. Three parameters match the StartAmount, EndAmount
		-- value, Branch_Name value and another parameter return this value. In this procedure find the number of Branch_Name where
		-- StartAmount, EndAmount value, Branch_Name value pass by parameter.
CREATE PROC spEmployeeSalaryDetails1
@StartAmount DECIMAL(12,2),
@EndAmount DECIMAL(12,2),
@BranchName VARCHAR(50),
@BranchCount INT OUTPUT
AS
BEGIN
	SELECT @BranchCount=COUNT(*)
	FROM Account_Detail a
	JOIN Branch b
	ON a.Branch_Id = b.Br_Id
	WHERE a.Amount BETWEEN @StartAmount AND @EndAmount
	AND b.Branch_Name = @BranchName;
END;

DECLARE @Total_Br INT
EXEC spEmployeeSalaryDetails1 @StartAmount = 100000, @EndAmount =200000, @BranchName ='Shaheb bazar', @BranchCount =  @Total_Br OUTPUT
PRINT  @Total_Br;

-- 7. Create a simple stored procedure “SPdetailsInfo” to find Zone_name, number of customer of a specific Zone.
CREATE PROC SPdetailsInfo2
@ZoneName VARCHAR(50)
AS
BEGIN
	SELECT COUNT(*) AS NO_CUS, z.Name
	FROM Account_Detail a
	JOIN Zone z
	ON a.Zone_Id = z.Zone_Id
	WHERE z.Name = @ZoneName
	GROUP BY z.Name;
END;

EXEC SPdetailsInfo2 @ZoneName='Dhaka';

-- 8. Create a simple stored procedure “SPdetailsInfo1” to find Zone_name, number of Branch of a specific Zone (Zone name pass by parameter).
CREATE PROC SPdetailsInfo3
@ZoneName VARCHAR(50)
AS
BEGIN
	SELECT COUNT(DISTINCT b.Br_Id) AS NO_Br, z.Name
	FROM Branch b
    JOIN Account_Detail a ON b.Br_Id = a.Branch_Id
    JOIN Zone z ON a.Zone_Id = z.Zone_Id
    WHERE z.Name = @ZoneName
    GROUP BY z.Name;
END;

EXEC SPdetailsInfo3 @ZoneName='Dhaka';