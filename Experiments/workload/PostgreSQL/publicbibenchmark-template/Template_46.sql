SELECT taxpayer9.nppesproviderstreet1 AS nppesproviderstreet1
FROM taxpayer9
WHERE ((taxpayer9.nppesproviderfirstname = &&&)
       AND (taxpayer9.nppesproviderlastorgname = &&&)
       AND (taxpayer9.nppesproviderstate = &&&))
GROUP BY taxpayer9.nppesproviderstreet1;