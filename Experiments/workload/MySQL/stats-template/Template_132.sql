SELECT COUNT(*)
FROM comments AS c,
     votes AS v,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = v.UserId
  AND c.CreationDate >= &&&
  AND c.CreationDate <= &&&
  AND v.BountyAmount <= ###
  AND u.UpVotes = ###
  AND u.CreationDate <= &&&;