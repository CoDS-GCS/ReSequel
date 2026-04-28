SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u,
     badges AS b
WHERE b.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND ph.PostHistoryTypeId = ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND b.Date >= &&&;