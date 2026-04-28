SELECT taxpayer6.nppesprovidercity AS nppesprovidercity
FROM taxpayer6
WHERE ((taxpayer6.hcpcsdescription = &&&)
       AND (taxpayer6.nppesproviderstate = &&&))
GROUP BY taxpayer6.nppesprovidercity;