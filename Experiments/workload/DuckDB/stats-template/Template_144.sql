SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND p.Id = c.PostId
  AND p.Id = ph.PostId
  AND p.Id = v.PostId
  AND c.Score = ###
  AND p.Score <= ###
  AND p.AnswerCount <= ###
  AND p.FavoriteCount >= ###
  AND v.CreationDate >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp
  AND u.Reputation <= ###;