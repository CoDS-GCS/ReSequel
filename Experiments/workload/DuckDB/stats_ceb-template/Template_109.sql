SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = ph.UserId
  AND u.Id = b.UserId
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND p.Score >= ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND ph.PostHistoryTypeId = ###
  AND b.Date >= &&& :: timestamp
  AND u.Views >= ###
  AND u.Views <= ###;