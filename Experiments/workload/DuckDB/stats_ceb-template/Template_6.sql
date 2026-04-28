SELECT COUNT(*)
FROM comments AS c,
     votes AS v,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = v.UserId
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND v.CreationDate >= &&& :: timestamp
  AND v.CreationDate <= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;