
SELECT naicsname AS tempattrnaicsnamenk37095325490,
       naicsname AS tempattrnaicsnamenk7664506490,
       naicscode,
       COUNT(*) AS sumnumberofrecordsok,
       SUM(obligatedamount) AS sumobligatedamountok
FROM commongovernment8
GROUP BY naicscode,
         naicsname;