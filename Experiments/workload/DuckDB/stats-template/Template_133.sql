SELECT COUNT(*)
FROM comments AS c,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = b.UserId
  AND u.Id = c.UserId
  AND u.Id = v.UserId
  AND c.Score = ###
  AND c.CreationDate >= &&& :: timestamp
  AND v.VoteTypeId = ###
  AND v.CreationDate >= &&& :: timestamp
  AND v.CreationDate <= &&& :: timestamp
  AND b.Date <= &&& :: timestamp
  AND u.Reputation >= ###;