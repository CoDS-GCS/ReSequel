SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE v.UserId = u.Id
  AND c.UserId = u.Id
  AND ph.UserId = u.Id
  AND c.CreationDate <= &&& :: timestamp
  AND ph.PostHistoryTypeId = ###
  AND u.Reputation >= ###
  AND u.Views >= ###
  AND u.DownVotes >= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;