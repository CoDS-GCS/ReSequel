SELECT taxpayer5.nppesproviderstate AS nppesproviderstate
FROM taxpayer5
WHERE ((taxpayer5.nppesproviderfirstname = &&&)
       AND (taxpayer5.nppesproviderlastorgname = &&&))
GROUP BY taxpayer5.nppesproviderstate;