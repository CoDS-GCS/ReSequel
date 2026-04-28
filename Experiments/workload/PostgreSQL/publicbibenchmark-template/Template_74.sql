SELECT taxpayer3.nppesproviderstate AS nppesproviderstate
FROM taxpayer3
WHERE ((taxpayer3.nppesproviderfirstname = &&&)
       AND (taxpayer3.nppesproviderlastorgname = &&&))
GROUP BY taxpayer3.nppesproviderstate;