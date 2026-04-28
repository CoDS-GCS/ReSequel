SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND u.Id = c.UserId
  AND u.Id = v.UserId
  AND c.Score = ###
  AND p.ViewCount >= ###
  AND u.Reputation <= ###
  AND u.UpVotes >= ###;