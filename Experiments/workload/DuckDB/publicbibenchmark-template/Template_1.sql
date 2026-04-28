SELECT cmsprovider2.hcpcsdescription AS hcpcsdescription,
       CAST(cmsprovider2.nppesproviderzip AS BIGINT) AS nppesproviderzip,
       AVG(CAST(cmsprovider2.averagesubmittedchrgamt AS DOUBLE PRECISION)) AS avgaveragesubmittedchrgamtok
FROM cmsprovider2
WHERE ((cmsprovider2.hcpcsdescription IN (N_SSS))
       AND (cmsprovider2.nppesproviderstate = &&&))
GROUP BY cmsprovider2.hcpcsdescription,
         cmsprovider2.nppesproviderzip,
         cmsprovider2.nppesproviderzip;