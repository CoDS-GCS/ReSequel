
SELECT awardtype,
       level1category,
       SUM(obligatedamount) AS sumobligatedamountok
FROM commongovernment13
GROUP BY awardtype,
         level1category;