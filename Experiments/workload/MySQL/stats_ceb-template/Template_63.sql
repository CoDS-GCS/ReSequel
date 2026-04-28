SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     users AS u
WHERE v.UserId = p.OwnerUserId
  AND p.OwnerUserId = u.Id
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;