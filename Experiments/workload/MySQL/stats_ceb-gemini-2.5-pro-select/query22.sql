
SELECT SUM(T1.PostCount * T2.VoteCount)
FROM
  (SELECT u.Id,
          COUNT(p.Id) AS PostCount
   FROM users u
   JOIN posts p ON u.Id = p.OwnerUserId
   WHERE u.CreationDate >= '2010-07-22 04:38:06'
     AND u.CreationDate <= '2014-09-08 15:55:02'
     AND p.CommentCount >= 0
     AND p.CommentCount <= 12
   GROUP BY u.Id) AS T1
JOIN
  (SELECT UserId,
          COUNT(Id) AS VoteCount
   FROM votes
   GROUP BY UserId) AS T2 ON T1.Id = T2.UserId;