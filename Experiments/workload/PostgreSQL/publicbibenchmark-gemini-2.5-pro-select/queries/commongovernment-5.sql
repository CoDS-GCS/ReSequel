
SELECT level1category,
       SUM(obligatedamount) AS sumobligatedamountok
FROM commongovernment13
GROUP BY ROLLUP(level1category)
HAVING level1category IS NOT NULL;