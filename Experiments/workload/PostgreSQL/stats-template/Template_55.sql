SELECT COUNT(*)
FROM comments AS c,
     badges AS b
WHERE c.UserId = b.UserId
  AND c.Score = ###
  AND b.Date <= &&& :: timestamp;