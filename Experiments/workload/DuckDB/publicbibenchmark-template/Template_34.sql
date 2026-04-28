SELECT taxpayer2.nppesproviderlastorgname AS nppesproviderlastorgname
FROM taxpayer2
WHERE ((taxpayer2.nppesproviderfirstname = &&&)
       AND (taxpayer2.nppesproviderstate = &&&))
GROUP BY taxpayer2.nppesproviderlastorgname;