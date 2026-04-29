
SELECT DISTINCT nppesproviderstate
FROM
  (SELECT nppesproviderstate
   FROM taxpayer5
   WHERE nppesproviderfirstname = 'JOHN'
     AND nppesproviderlastorgname = 'HOLDER') AS filtered_data;