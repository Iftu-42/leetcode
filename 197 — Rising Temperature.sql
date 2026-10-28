SELECT t1.id
FROM Weather AS t1
JOIN Weather AS t2
    ON t1.recordDate = DATE_ADD(t2.recordDate, INTERVAL 1 DAY)
WHERE t1.temperature > t2.temperature;


/*
Concepts to understand before solving:
1. SQL Aliases: Give a table a temporary name.
2. Self Join: Join a table to itself to compare different rows.
3. ON: Define how rows from the two table references match.
4. DATE_ADD(): Add a time interval to a date.
5. WHERE: Filter rows based on a condition.
6. SELECT: Choose which columns to return.

Key takeaway:
Use a self join and date arithmetic to compare each day's
temperature with the previous calendar day's temperature.
*/
