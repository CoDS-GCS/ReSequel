SELECT COUNT(*)
FROM comments AS c,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v
WHERE pl.PostId = c.PostId
  AND c.PostId = ph.PostId
  AND ph.PostId = v.PostId
  AND ph.CreationDate >= &&& :: timestamp
  AND ph.CreationDate <= &&& :: timestamp;