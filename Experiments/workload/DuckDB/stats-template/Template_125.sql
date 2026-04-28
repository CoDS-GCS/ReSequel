SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = ph.UserId
  AND u.Id = b.UserId
  AND c.Score = ###
  AND c.CreationDate >= &&& :: timestamp
  AND ph.PostHistoryTypeId = ###
  AND ph.CreationDate >= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.DownVotes <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;