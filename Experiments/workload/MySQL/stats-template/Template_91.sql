SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = v.UserId
  AND c.Score = ###
  AND c.CreationDate <= &&&
  AND p.CreationDate >= &&&
  AND v.BountyAmount <= ###
  AND v.CreationDate <= &&&
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&&;