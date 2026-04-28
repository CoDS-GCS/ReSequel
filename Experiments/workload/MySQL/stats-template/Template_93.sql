SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     badges AS b,
     users AS u
WHERE u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND p.Id = v.PostId
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CreationDate <= &&&
  AND b.Date <= &&&;