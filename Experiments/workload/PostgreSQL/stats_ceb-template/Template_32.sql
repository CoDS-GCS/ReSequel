SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND p.Id = v.PostId
  AND p.Id = c.PostId
  AND c.Score = ###
  AND c.CreationDate <= &&& :: timestamp
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.CommentCount <= ###
  AND p.CreationDate <= &&& :: timestamp
  AND v.CreationDate <= &&& :: timestamp
  AND u.DownVotes >= ###;