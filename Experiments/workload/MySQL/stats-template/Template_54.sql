SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u
WHERE ph.PostId = p.Id
  AND p.OwnerUserId = u.Id
  AND ph.CreationDate <= &&&
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.Views >= ###;