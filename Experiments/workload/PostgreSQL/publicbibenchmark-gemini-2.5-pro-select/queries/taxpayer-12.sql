WITH filtered_taxpayers AS
  (SELECT nppesprovidercity
   FROM taxpayer6
   WHERE hcpcsdescription = 'Initial hospital care'
     AND nppesproviderstate = 'WA')
SELECT DISTINCT nppesprovidercity
FROM filtered_taxpayers;