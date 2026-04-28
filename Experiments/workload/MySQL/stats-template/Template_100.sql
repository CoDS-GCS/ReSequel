SELECT COUNT(*)
FROM comments AS c,
     postLinks AS pl,
     posts AS p,
     users AS u,
     badges AS b
WHERE p.Id = pl.RelatedPostId
  AND p.Id = c.PostId
  AND u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND c.CreationDate <= &&&
  AND p.ViewCount >= ###
  AND u.Reputation >= ###;