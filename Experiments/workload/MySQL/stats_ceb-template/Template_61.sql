SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     users AS u
WHERE v.PostId = p.Id
  AND v.UserId = u.Id
  AND v.CreationDate <= &&&
  AND p.Score >= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;