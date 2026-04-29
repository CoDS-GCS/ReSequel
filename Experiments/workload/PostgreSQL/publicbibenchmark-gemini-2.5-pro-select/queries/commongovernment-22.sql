
SELECT DISTINCT CASE
                    WHEN CAST(SUBSTRING(signeddate, 6, 2) AS INTEGER) >= 10 THEN CAST(SUBSTRING(signeddate, 1, 4) AS INTEGER) + 1
                    ELSE CAST(SUBSTRING(signeddate, 1, 4) AS INTEGER)
                END AS yrsigneddateok
FROM commongovernment2
WHERE signeddate IS NOT NULL;