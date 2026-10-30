/*
LeetCode 177: Nth Highest Salary
Difficulty: Medium
Topics: DISTINCT, ORDER BY, LIMIT, OFFSET, Subquery

CONCEPTS:

1. DISTINCT:
   Removes duplicate salaries because we need the Nth highest
   UNIQUE salary, not the Nth employee.

2. ORDER BY salary DESC:
   Sorts salaries from highest to lowest.

3. LIMIT 1:
   Returns only one row (the salary at the requested position).

4. OFFSET:
   Skips a specified number of rows before returning results.
   For example, OFFSET 1 skips the highest salary and starts
   from the second-highest salary.

5. SET N = N - 1:
   OFFSET starts counting from 0, but salary ranks start from 1.
   Therefore, we subtract 1 from N to get the correct offset.

   Example:
   N = 1 → OFFSET 0 (skip 0 rows)
   N = 2 → OFFSET 1 (skip 1 row)
   N = 3 → OFFSET 2 (skip 2 rows)

6. Subquery:
   Returns the selected salary. If no salary exists at that
   position, the subquery returns NULL automatically.

KEY IDEA:
   Find the Nth highest unique salary by removing duplicates,
   sorting in descending order, and skipping N-1 rows.*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;

    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END;
