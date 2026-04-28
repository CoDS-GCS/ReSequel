SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl
WHERE c.UserId = p.OwnerUserId
  AND p.Id = pl.PostId
  AND c.Score = ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND pl.LinkTypeId = ###
  AND pl.CreationDate >= &&& :: timestamp;