SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u
WHERE p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND ph.CreationDate >= &&&
  AND p.FavoriteCount <= ###
  AND u.Views >= ###
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;