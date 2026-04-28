SELECT COUNT(*)
FROM comments AS c,
     postLinks AS pl,
     posts AS p,
     users AS u,
     badges AS b
WHERE u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND p.Id = c.PostId
  AND p.Id = pl.RelatedPostId
  AND c.CreationDate <= &&&
  AND pl.LinkTypeId = ###
  AND pl.CreationDate >= &&&
  AND pl.CreationDate <= &&&
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&;