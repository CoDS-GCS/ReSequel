SELECT (CASE
            WHEN (commongovernment13.refidvidpiid IS NULL) THEN NULL
            WHEN (commongovernment13.refidvidpiid = ' ') THEN NULL
            ELSE commongovernment13.refidvidpiid
        END) AS refidvidpiidgroup,
       commongovernment13.awardtype AS awardtype,
       SUM(commongovernment13.obligatedamount) AS sumobligatedamountok
FROM commongovernment13
GROUP BY refidvidpiidgroup,
         commongovernment13.awardtype;