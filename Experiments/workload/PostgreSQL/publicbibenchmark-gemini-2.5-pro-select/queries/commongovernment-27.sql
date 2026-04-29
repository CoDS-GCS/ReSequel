
SELECT COUNT(DISTINCT c.refidvidpiid) AS ctdrefidvidpiidok,
       c.fundingagencyname,
       SUM(c.obligatedamount) AS sumobligatedamountok
FROM commongovernment13 AS c
GROUP BY c.fundingagencyname;