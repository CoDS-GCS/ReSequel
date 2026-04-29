WITH BadgeCounts AS
  (SELECT UserId,
          COUNT(*) AS Cnt
   FROM badges
   GROUP BY UserId)
SELECT SUM(bc.Cnt)
FROM users AS u
JOIN posts AS p ON u.Id = p.OwnerUserId
JOIN tags AS t ON p.Id = t.ExcerptPostId
JOIN BadgeCounts AS bc ON u.Id = bc.UserId
JOIN votes AS v ON u.Id = v.UserId
WHERE u.DownVotes >= 0;