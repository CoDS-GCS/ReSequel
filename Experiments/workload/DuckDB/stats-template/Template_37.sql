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
  AND u.Views <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;