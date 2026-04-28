SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl
WHERE c.UserId = p.OwnerUserId
  AND p.Id = pl.PostId
  AND p.CommentCount <= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp;