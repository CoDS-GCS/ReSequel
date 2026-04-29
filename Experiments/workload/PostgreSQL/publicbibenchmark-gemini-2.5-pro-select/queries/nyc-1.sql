WITH t AS
  (SELECT DISTINCT complaint_type
   FROM nyc1)
SELECT complaint_type
FROM t
ORDER BY complaint_type ASC;