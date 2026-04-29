WITH UniqCounties AS
  (SELECT county
   FROM realestate24)
SELECT county
FROM UniqCounties
GROUP BY county
ORDER BY county ASC;