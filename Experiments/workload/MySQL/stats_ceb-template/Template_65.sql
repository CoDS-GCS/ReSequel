SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     votes AS v,
     badges AS b,
     users AS u
WHERE p.Id = c.PostId
  AND p.Id = pl.RelatedPostId
  AND p.Id = v.PostId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND c.CreationDate >= &&&
  AND c.CreationDate <= &&&
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.FavoriteCount >= ###
  AND pl.LinkTypeId = ###
  AND pl.CreationDate >= &&&
  AND v.VoteTypeId = ###
  AND v.CreationDate <= &&&
  AND u.Reputation >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;