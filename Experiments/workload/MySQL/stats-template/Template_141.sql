SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     badges AS b,
     users AS u
WHERE u.Id = v.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND v.CreationDate <= &&&
  AND p.Score <= ###
  AND p.AnswerCount <= ###
  AND b.Date >= &&&
  AND b.Date <= &&&
  AND u.CreationDate >= &&&;