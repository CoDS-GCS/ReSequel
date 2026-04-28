SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     users AS u
WHERE v.UserId = u.Id
  AND p.OwnerUserId = u.Id
  AND p.PostTypeId = ###
  AND p.CreationDate <= &&& :: timestamp
  AND u.Views >= ###;