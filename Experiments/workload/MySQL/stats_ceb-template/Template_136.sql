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
  AND c.CreationDate >= &&&
  AND p.Score <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND pl.LinkTypeId = ###
  AND pl.CreationDate <= &&&
  AND ph.CreationDate >= &&&
  AND v.CreationDate <= &&&;