SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u,
     badges AS b
WHERE b.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND ph.PostHistoryTypeId = ###
  AND ph.CreationDate >= &&&
  AND ph.CreationDate <= &&&
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate <= &&&
  AND u.Reputation <= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&
  AND b.Date >= &&&
  AND b.Date <= &&&;