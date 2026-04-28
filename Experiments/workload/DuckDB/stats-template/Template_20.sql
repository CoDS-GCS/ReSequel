SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     users AS u
WHERE c.UserId = u.Id
  AND u.Id = p.OwnerUserId
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###;