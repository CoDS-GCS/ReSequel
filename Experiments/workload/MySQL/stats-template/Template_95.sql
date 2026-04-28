SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND u.Id = c.UserId
  AND u.Id = v.UserId
  AND c.CreationDate >= &&&
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND u.Views >= ###
  AND u.CreationDate >= &&&;