SELECT COUNT(*)
FROM comments AS c,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND c.UserId = b.UserId
  AND c.Score = ###
  AND c.CreationDate >= &&&
  AND b.Date >= &&&
  AND b.Date <= &&&
  AND u.UpVotes >= ###;