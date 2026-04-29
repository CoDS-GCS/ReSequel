
SELECT SUM(T1.n * T2.m)
FROM
  (SELECT UserId,
          COUNT(*) AS n
   FROM comments
   WHERE Score = 0
   GROUP BY UserId) AS T1
INNER JOIN
  (SELECT UserId,
          COUNT(*) AS m
   FROM badges
   WHERE Date <= '2014-09-11 14:33:06'
   GROUP BY UserId) AS T2 ON T1.UserId = T2.UserId;