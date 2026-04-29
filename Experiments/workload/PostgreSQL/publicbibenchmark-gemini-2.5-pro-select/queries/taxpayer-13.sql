WITH filtered_taxpayers AS
  (SELECT nppesproviderlastorgname
   FROM taxpayer7
   WHERE nppesproviderfirstname = 'JOHN'
     AND nppesproviderstate = 'WA')
SELECT DISTINCT nppesproviderlastorgname
FROM filtered_taxpayers;