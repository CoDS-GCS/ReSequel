WITH SUMMARY AS
  (SELECT level1category,
          obligatedamount
   FROM commongovernment9)
SELECT level1category,
       SUM(obligatedamount) AS sumobligatedamountok
FROM SUMMARY
GROUP BY level1category;