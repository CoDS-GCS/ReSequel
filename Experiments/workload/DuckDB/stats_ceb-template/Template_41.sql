SELECT COUNT(*)
FROM votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = v.UserId
  AND v.UserId = b.UserId
  AND v.BountyAmount >= ###
  AND v.BountyAmount <= ###
  AND u.DownVotes = ###;