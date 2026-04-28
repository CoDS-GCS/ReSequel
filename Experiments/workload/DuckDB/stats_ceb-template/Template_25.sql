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
  AND c.CreationDate <= &&& :: timestamp
  AND pl.LinkTypeId = ###
  AND pl.CreationDate >= &&& :: timestamp
  AND pl.CreationDate <= &&& :: timestamp
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp;