-- https://leetcode.com/problems/department-highest-salary/description/
WITH RankedEmployees AS (
    SELECT 
        e.name AS Employee, 
        e.salary AS Salary, 
        d.name AS Department,
        RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS `rank`
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT 
    Department, 
    Employee, 
    Salary
FROM RankedEmployees
WHERE `rank` = 1;
