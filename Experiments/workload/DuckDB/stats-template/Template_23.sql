SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND p.Id = pl.RelatedPostId
  AND p.Id = v.PostId
  AND p.Id = c.PostId
  AND u.Id = b.UserId
  AND p.Score >= ###
  AND p.Score <= ###
  AND pl.CreationDate <= &&& :: timestamp
  AND v.CreationDate >= &&& :: timestamp
  AND b.Date >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp
  AND u.DownVotes >= ###;