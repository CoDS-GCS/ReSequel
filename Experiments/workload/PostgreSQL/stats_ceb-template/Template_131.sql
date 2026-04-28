SELECT COUNT(*)
FROM postHistory AS ph,
     votes AS v,
     users AS u,
     badges AS b
WHERE u.Id = b.UserId
  AND u.Id = ph.UserId
  AND u.Id = v.UserId
  AND ph.PostHistoryTypeId = ###
  AND v.CreationDate <= &&& :: timestamp
  AND u.Reputation <= ###
  AND u.Views <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp
  AND b.Date <= &&& :: timestamp;