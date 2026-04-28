SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u,
     badges AS b
WHERE b.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND ph.PostHistoryTypeId = ###
  AND ph.CreationDate >= &&& :: timestamp
  AND ph.CreationDate <= &&& :: timestamp
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate <= &&& :: timestamp
  AND u.Reputation <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp
  AND b.Date >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp;