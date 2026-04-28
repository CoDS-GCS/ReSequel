SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND p.Id = v.PostId
  AND p.Id = c.PostId
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.ViewCount >= ###
  AND p.CreationDate <= &&&
  AND u.Reputation >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;