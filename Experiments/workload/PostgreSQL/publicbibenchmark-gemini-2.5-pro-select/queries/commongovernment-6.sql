WITH Aggregates AS
  (SELECT naicscode,
          naicsname,
          SUM(obligatedamount) AS sumobligatedamountok
   FROM commongovernment13
   GROUP BY naicscode,
            naicsname)
SELECT naicscode,
       naicsname,
       sumobligatedamountok
FROM Aggregates;