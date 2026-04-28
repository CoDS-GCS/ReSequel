SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v,
     badges AS b,
     users AS u
WHERE p.Id = pl.RelatedPostId
  AND b.UserId = u.Id
  AND c.UserId = u.Id
  AND p.Id = v.PostId
  AND p.Id = c.PostId
  AND p.Id = ph.PostId
  AND c.Score = ###
  AND p.ViewCount >= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND pl.LinkTypeId = ###
  AND pl.CreationDate >= &&&
  AND pl.CreationDate <= &&&
  AND v.CreationDate >= &&&
  AND v.CreationDate <= &&&
  AND b.Date >= &&&
  AND b.Date <= &&&;