SELECT taxpayer4.nppesprovidercity AS nppesprovidercity
FROM taxpayer4
WHERE ((taxpayer4.nppesproviderfirstname = &&&)
       AND (taxpayer4.nppesproviderlastorgname = &&&)
       AND (taxpayer4.nppesproviderstate = &&&))
GROUP BY taxpayer4.nppesprovidercity;