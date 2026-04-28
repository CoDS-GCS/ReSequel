SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND c.UserId = u.Id
  AND c.CreationDate >= &&&
  AND p.AnswerCount >= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND u.Reputation >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;