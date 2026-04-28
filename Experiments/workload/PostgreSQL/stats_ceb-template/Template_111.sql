SELECT COUNT(*)
FROM postHistory AS ph,
     votes AS v,
     users AS u,
     badges AS b
WHERE u.Id = ph.UserId
  AND u.Id = v.UserId
  AND u.Id = b.UserId
  AND ph.PostHistoryTypeId = ###
  AND u.Views = ###
  AND u.DownVotes >= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate <= &&& :: timestamp
  AND b.Date >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp;