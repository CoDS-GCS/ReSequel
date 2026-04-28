SELECT COUNT(*)
FROM comments AS c,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND c.UserId = b.UserId
  AND c.Score = ###
  AND c.CreationDate >= &&& :: timestamp
  AND b.Date >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp
  AND u.UpVotes >= ###;