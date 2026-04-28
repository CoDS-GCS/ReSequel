SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND c.UserId = u.Id
  AND c.CreationDate>=&&&::timestamp
  AND p.AnswerCount>=###
  AND p.AnswerCount<=###
  AND p.CommentCount>=###
  AND p.CommentCount<=###
  AND p.CreationDate>=&&&::timestamp
  AND p.CreationDate<=&&&::timestamp
  AND u.Reputation>=###
  AND u.CreationDate>=&&&::timestamp
  AND u.CreationDate<=&&&::timestamp;