SELECT COUNT(*)
FROM comments AS c,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND c.UserId = b.UserId
  AND c.Score = ###
  AND b.Date >= &&&
  AND u.DownVotes >= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;