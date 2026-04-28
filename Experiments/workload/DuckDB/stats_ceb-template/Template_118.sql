SELECT COUNT(*)
FROM postHistory AS ph,
     votes AS v,
     users AS u,
     badges AS b
WHERE u.Id = b.UserId
  AND u.Id = ph.UserId
  AND u.Id = v.UserId
  AND v.CreationDate <= &&& :: timestamp
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND b.Date >= &&& :: timestamp;