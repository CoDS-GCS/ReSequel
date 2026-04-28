SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u
WHERE ph.PostId = p.Id
  AND p.OwnerUserId = u.Id
  AND ph.CreationDate <= &&& :: timestamp
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.Views >= ###;