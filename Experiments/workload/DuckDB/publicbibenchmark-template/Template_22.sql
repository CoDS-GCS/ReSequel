SELECT provider3.nppesproviderstreet1 AS nppesproviderstreet1
FROM provider3
WHERE ((provider3.nppesproviderstate = &&&)
       AND (provider3.providertype = &&&))
GROUP BY provider3.nppesproviderstreet1;