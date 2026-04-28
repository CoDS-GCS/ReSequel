SELECT COUNT(*)
FROM comments AS c,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = v.UserId
  AND u.Id = b.UserId
  AND c.Score = ###
  AND v.BountyAmount >= ###
  AND v.BountyAmount <= ###
  AND v.CreationDate >= &&& :: timestamp
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###;