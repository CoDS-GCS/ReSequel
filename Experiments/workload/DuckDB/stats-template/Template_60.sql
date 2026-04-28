SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v
WHERE p.Id = c.PostId
  AND p.Id = pl.PostId
  AND p.Id = ph.PostId
  AND p.Id = v.PostId
  AND c.CreationDate >= &&& :: timestamp
  AND p.Score <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND pl.LinkTypeId = ###
  AND pl.CreationDate <= &&& :: timestamp
  AND ph.CreationDate >= &&& :: timestamp
  AND v.CreationDate <= &&& :: timestamp;