SELECT COUNT(*)
FROM comments AS c,
     votes AS v,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = v.UserId
  AND c.CreationDate >= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.Reputation <= ###;