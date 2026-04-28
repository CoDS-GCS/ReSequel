SELECT taxpayer7.nppesproviderlastorgname AS nppesproviderlastorgname
FROM taxpayer7
WHERE ((taxpayer7.nppesproviderfirstname = &&&)
       AND (taxpayer7.nppesproviderstate = &&&))
GROUP BY taxpayer7.nppesproviderlastorgname;