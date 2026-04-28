SELECT COUNT(*)
FROM comments AS c,
     badges AS b,
     users AS u
WHERE c.UserId = u.Id
  AND b.UserId = u.Id
  AND c.Score = ###
  AND c.CreationDate >= &&& :: timestamp
  AND b.Date >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp
  AND u.UpVotes >= ###;