SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u,
     badges AS b
WHERE b.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND ph.CreationDate >= &&&
  AND p.Score >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;