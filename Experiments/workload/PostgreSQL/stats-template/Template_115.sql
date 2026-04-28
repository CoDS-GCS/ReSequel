SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     votes AS v
WHERE p.Id = c.PostId
  AND c.PostId = pl.PostId
  AND pl.PostId = v.PostId
  AND c.CreationDate >= &&& :: timestamp
  AND p.Score >= ###
  AND v.VoteTypeId = ###
  AND v.CreationDate <= &&& :: timestamp;