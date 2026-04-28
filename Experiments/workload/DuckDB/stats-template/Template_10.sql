SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND c.UserId = p.OwnerUserId
  AND p.OwnerUserId = v.UserId
  AND v.UserId = b.UserId
  AND c.Score = ###
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.ViewCount <= ###
  AND p.CommentCount = ###
  AND p.FavoriteCount >= ###
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.Views >= ###
  AND u.Views <= ###;