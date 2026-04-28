SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND c.UserId = p.OwnerUserId
  AND p.OwnerUserId = v.UserId
  AND v.UserId = b.UserId
  AND c.Score = ###
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND v.BountyAmount <= ###
  AND b.Date <= &&& :: timestamp
  AND u.DownVotes <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;