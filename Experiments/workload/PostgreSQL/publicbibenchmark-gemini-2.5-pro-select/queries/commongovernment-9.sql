WITH t AS
  (SELECT DISTINCT vendvendorname
   FROM commongovernment13)
SELECT vendvendorname
FROM t
ORDER BY vendvendorname ASC;