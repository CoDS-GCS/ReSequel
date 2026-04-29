WITH FilteredProviders AS
  (SELECT nppesproviderstreet1
   FROM taxpayer9
   WHERE nppesproviderfirstname = 'JOHN'
     AND nppesproviderlastorgname = 'HOLDER'
     AND nppesproviderstate = 'WA')
SELECT DISTINCT nppesproviderstreet1
FROM FilteredProviders;