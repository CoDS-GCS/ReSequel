SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     users AS u
WHERE v.PostId = p.Id
  AND v.UserId = u.Id
  AND v.CreationDate <= &&& :: timestamp
  AND p.Score >= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;