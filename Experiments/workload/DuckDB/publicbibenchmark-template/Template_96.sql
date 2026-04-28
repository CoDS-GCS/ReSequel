SELECT cmsprovider1.hcpcsdescription AS hcpcsdescription,
       CAST(cmsprovider1.nppesproviderzip AS BIGINT) AS nppesproviderzip,
       AVG(CAST(cmsprovider1.averagesubmittedchrgamt AS DOUBLE PRECISION)) AS avgaveragesubmittedchrgamtok
FROM cmsprovider1
WHERE ((cmsprovider1.hcpcsdescription IN (N_SSS))
       AND (cmsprovider1.nppesproviderstate = &&&))
GROUP BY cmsprovider1.hcpcsdescription,
         cmsprovider1.nppesproviderzip,
         cmsprovider1.nppesproviderzip;