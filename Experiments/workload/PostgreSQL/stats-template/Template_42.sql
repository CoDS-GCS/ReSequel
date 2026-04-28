SELECT COUNT(*)
FROM votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = v.UserId
  AND v.UserId = b.UserId
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###;