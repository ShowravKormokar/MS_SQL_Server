
-- How many people in each department
SELECT W1.DEPARTMENT, COUNT(W1.WORKER_ID) AS NO_PEP_DEPT
FROM Worker W1
GROUP BY W1.DEPARTMENT;

-- Find the min or max salaries in each department
SELECT W.*, 'MAX' AS Salary_Type
FROM Worker W
JOIN (
    SELECT Department, MAX(Salary) AS Salary
    FROM Worker
    GROUP BY Department
) M
ON W.Department = M.Department
AND W.Salary = M.Salary

UNION ALL

SELECT W.*, 'MIN' AS Salary_Type
FROM Worker W
JOIN (
    SELECT Department, MIN(Salary) AS Salary
    FROM Worker
    GROUP BY Department
) M
ON W.Department = M.Department
AND W.Salary = M.Salary

ORDER BY Department, Salary_Type;

-- another way
SELECT W.FIRST_NAME, W.LAST_NAME, W.DEPARTMENT, W.SALARY
FROM Worker W JOIN 
(SELECT DEPARTMENT,
       MAX(SALARY) AS High_Salary,
       MIN(SALARY) AS Low_Salary
FROM Worker
GROUP BY DEPARTMENT)T ON (W.SALARY = T.High_Salary OR W.SALARY = T.Low_Salary) AND W.DEPARTMENT = T.DEPARTMENT ;