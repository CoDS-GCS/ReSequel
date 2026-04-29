
SELECT SUM(bc.Cnt * vc.Cnt)
FROM posts AS p
JOIN users AS u ON p.OwnerUserId = u.Id
JOIN
  (SELECT UserId,
          COUNT(*) AS Cnt
   FROM badges
   GROUP BY UserId) AS bc ON u.Id = bc.UserId
JOIN
  (SELECT PostId,
          COUNT(*) AS Cnt
   FROM votes
   GROUP BY PostId) AS vc ON p.Id = vc.PostId
WHERE p.Score <= 22
  AND u.Reputation >= 1;