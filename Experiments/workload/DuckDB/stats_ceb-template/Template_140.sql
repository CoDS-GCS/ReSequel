SELECT COUNT(*)
FROM comments AS c,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v,
     posts AS p
WHERE pl.PostId = p.Id
  AND c.PostId = p.Id
  AND v.PostId = p.Id
  AND ph.PostId = p.Id
  AND c.Score = ###
  AND pl.CreationDate >= &&& :: timestamp
  AND pl.CreationDate <= &&& :: timestamp;