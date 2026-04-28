SELECT COUNT(*)
FROM comments AS c,
     votes AS v,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = v.UserId
  AND v.CreationDate <= &&&
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;