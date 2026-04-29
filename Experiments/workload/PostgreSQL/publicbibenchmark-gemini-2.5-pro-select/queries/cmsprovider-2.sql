
SELECT hcpcsdescription,
       CAST(nppesproviderzip AS BIGINT) AS nppesproviderzip,
       AVG(averagesubmittedchrgamt) AS avgaveragesubmittedchrgamtok
FROM cmsprovider2
WHERE nppesproviderstate = 'CA'
  AND hcpcsdescription = ANY(ARRAY['Removal of joint lining from two or more knee joint compartments using an endoscope', 'Removal of knee cap', 'Removal of knee joint covering'])
GROUP BY hcpcsdescription,
         nppesproviderzip;