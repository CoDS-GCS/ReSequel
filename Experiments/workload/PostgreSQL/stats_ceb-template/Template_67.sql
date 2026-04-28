SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND c.UserId = u.Id
  AND c.Score = ###
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount <= ###
  AND u.Reputation >= ###;