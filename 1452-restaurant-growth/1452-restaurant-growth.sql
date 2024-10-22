# Write your MySQL query statement below
WITH DayAmt AS(
    SELECT visited_on, SUM(amount) as amt
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on 
)

SELECT a.visited_on, 
SUM(b.amt) AS amount,
ROUND(AVG(b.amt),2) AS average_amount
FROM DayAmt a, DayAmt b
WHERE DATEDIFF(a.visited_on, b.visited_on) BETWEEN 0 AND 6
GROUP BY a.visited_on
HAVING COUNT(*)>6

