SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = ph.UserId
  AND u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = c.UserId
  AND c.Score = ###
  AND p.PostTypeId = ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND p.FavoriteCount = ###
  AND p.CreationDate <= &&& :: timestamp;