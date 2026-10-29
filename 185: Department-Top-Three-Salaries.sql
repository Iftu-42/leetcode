SELECT
    d.name AS Department,
    employee_rank.name AS Employee,
    employee_rank.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee
) AS employee_rank
JOIN Department AS d
    ON employee_rank.departmentId = d.id
WHERE salary_rank <= 3;

/*
LeetCode 185: Department Top Three Salaries
Difficulty: Hard
Topics: DENSE_RANK(), PARTITION BY, Subquery, JOIN

CONCEPTS:

DENSE_RANK(): Ranks distinct salary levels; ties share a rank.

PARTITION BY: Ranks employees separately by department.

ORDER BY salary DESC: Ranks highest salaries first.

Subquery: Calculates salary ranks before filtering.

JOIN: Connects employees to department names.

WHERE salary_rank <= 3: Keeps the top three salary ranks.

KEY IDEA:
Use DENSE_RANK() with PARTITION BY to find the top three unique
salary levels in each department, including employees with tied salaries.
*/
