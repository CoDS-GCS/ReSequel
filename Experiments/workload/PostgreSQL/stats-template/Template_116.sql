SELECT COUNT(*)
FROM badges AS b,
     posts AS p
WHERE b.UserId = p.OwnerUserId
  AND b.Date<=&&&::timestamp
  AND p.AnswerCount>=###
  AND p.AnswerCount<=###
  AND p.CommentCount>=###
  AND p.CommentCount<=###;