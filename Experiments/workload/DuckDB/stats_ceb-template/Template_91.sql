SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = v.UserId
  AND c.Score = ###
  AND c.CreationDate <= &&& :: timestamp
  AND p.CreationDate >= &&& :: timestamp
  AND v.BountyAmount <= ###
  AND v.CreationDate <= &&& :: timestamp
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&& :: timestamp;