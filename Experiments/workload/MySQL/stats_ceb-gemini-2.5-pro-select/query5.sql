
SELECT SUM(c.CommentCount)
FROM
  (SELECT UserId,
          COUNT(*) AS CommentCount
   FROM comments
   WHERE Score = 0
   GROUP BY UserId) AS c
JOIN votes AS v ON v.UserId = c.UserId;