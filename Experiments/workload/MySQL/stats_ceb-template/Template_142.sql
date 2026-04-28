SELECT COUNT(*)
FROM comments AS c,
     badges AS b,
     users AS u
WHERE c.UserId = u.Id
  AND b.UserId = u.Id
  AND c.Score = ###
  AND c.CreationDate >= &&&
  AND b.Date >= &&&
  AND b.Date <= &&&
  AND u.UpVotes >= ###;