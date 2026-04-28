SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     users AS u
WHERE p.Id = c.PostId
  AND p.Id = pl.RelatedPostId
  AND p.OwnerUserId = u.Id
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&& :: timestamp;