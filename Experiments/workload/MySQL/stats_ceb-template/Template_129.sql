SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u,
     badges AS b
WHERE b.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND p.AnswerCount >= ###
  AND p.FavoriteCount >= ###
  AND p.CreationDate <= &&&
  AND u.CreationDate <= &&&;