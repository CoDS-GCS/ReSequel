
SELECT DISTINCT nppesprovidercity
FROM taxpayer4
WHERE nppesproviderfirstname = 'JOHN'
  AND nppesproviderlastorgname = 'HOLDER'
  AND nppesproviderstate = 'WA'
ORDER BY nppesprovidercity;