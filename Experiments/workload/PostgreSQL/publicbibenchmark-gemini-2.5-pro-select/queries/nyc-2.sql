WITH t AS
  (SELECT DISTINCT borough
   FROM nyc2)
SELECT borough
FROM t
ORDER BY borough ASC;