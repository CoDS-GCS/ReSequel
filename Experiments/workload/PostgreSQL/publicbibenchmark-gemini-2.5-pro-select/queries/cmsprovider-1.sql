
SELECT T1.hcpcsdescription,
       CAST(T1.nppesproviderzip AS BIGINT) AS nppesproviderzip,
       SUM(T1.averagesubmittedchrgamt) / COUNT(T1.averagesubmittedchrgamt) AS avgaveragesubmittedchrgamtok
FROM cmsprovider1 AS T1
WHERE T1.hcpcsdescription IN ('Removal of joint lining from two or more knee joint compartments using an endoscope', 'Removal of knee cap', 'Removal of knee joint covering')
  AND T1.nppesproviderstate = 'CA'
GROUP BY T1.hcpcsdescription,
         T1.nppesproviderzip;