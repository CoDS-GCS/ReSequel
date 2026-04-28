SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE u.Id = v.UserId
  AND v.UserId = ph.UserId
  AND ph.UserId = c.UserId
  AND v.BountyAmount >= ###
  AND v.CreationDate >= &&& :: timestamp
  AND v.CreationDate <= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.Views >= ###
  AND u.Views <= ###
  AND u.UpVotes = ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;