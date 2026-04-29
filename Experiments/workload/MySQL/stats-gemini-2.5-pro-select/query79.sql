
SELECT COUNT(*)
FROM posts AS p
JOIN users AS u ON p.OwnerUserId = u.Id
JOIN comments AS c ON p.Id = c.PostId
JOIN votes AS v ON p.Id = v.PostId
JOIN postHistory AS ph ON p.Id = ph.PostId
JOIN badges AS b ON u.Id = b.UserId
WHERE p.Score <= 21
  AND p.AnswerCount <= 3
  AND p.FavoriteCount >= 0
  AND u.Reputation <= 240
  AND c.Score = 0
  AND v.CreationDate >= '2010-07-19 00:00:00'
  AND b.Date <= '2014-09-11 18:35:08';