SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v
WHERE p.Id = pl.PostId
  AND p.Id = v.PostId
  AND p.Id = ph.PostId
  AND p.Id = c.PostId
  AND c.Score = ###
  AND p.FavoriteCount >= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND pl.LinkTypeId = ###
  AND pl.CreationDate >= &&& :: timestamp
  AND v.VoteTypeId = ###;