SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v,
     badges AS b
WHERE p.Id = c.PostId
  AND p.Id = pl.RelatedPostId
  AND p.Id = ph.PostId
  AND p.Id = v.PostId
  AND b.UserId = c.UserId
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND p.Score <= ###
  AND p.ViewCount <= ###
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND v.VoteTypeId = ###
  AND v.CreationDate >= &&& :: timestamp
  AND b.Date >= &&& :: timestamp;