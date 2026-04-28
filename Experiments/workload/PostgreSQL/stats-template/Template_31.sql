SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND u.Id = c.UserId
  AND u.Id = v.UserId
  AND p.Score <= ###
  AND p.AnswerCount >= ###
  AND v.CreationDate >= &&& :: timestamp
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;