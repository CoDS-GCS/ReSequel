
SELECT commongovernment13.refidvidpiid AS refidvidpiidgroup,
       commongovernment13.awardtype,
       SUM(commongovernment13.obligatedamount) AS sumobligatedamountok
FROM commongovernment13
WHERE commongovernment13.refidvidpiid IS NOT NULL
  AND commongovernment13.refidvidpiid <> ' '
GROUP BY commongovernment13.refidvidpiid,
         commongovernment13.awardtype;