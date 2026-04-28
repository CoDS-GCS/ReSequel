SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE u.Id = v.UserId
  AND v.UserId = ph.UserId
  AND ph.UserId = c.UserId
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND ph.CreationDate >= &&& :: timestamp
  AND ph.CreationDate <= &&& :: timestamp
  AND v.CreationDate >= &&& :: timestamp
  AND v.CreationDate <= &&& :: timestamp
  AND u.Views >= ###
  AND u.Views <= ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###
  AND u.UpVotes <= ###;