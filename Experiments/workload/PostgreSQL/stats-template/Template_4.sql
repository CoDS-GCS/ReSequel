SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     badges AS b,
     users AS u
WHERE u.Id = v.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.CommentCount = ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp;