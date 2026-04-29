
SELECT nppesproviderlastorgname
FROM taxpayer2
WHERE nppesproviderfirstname = 'JOHN'
  AND nppesproviderstate = 'WA'
GROUP BY nppesproviderlastorgname;