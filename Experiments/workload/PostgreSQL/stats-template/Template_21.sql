SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u
WHERE ph.PostId = p.Id
  AND p.OwnerUserId = u.Id
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###;