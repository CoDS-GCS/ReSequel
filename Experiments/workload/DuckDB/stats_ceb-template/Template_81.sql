SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     users AS u
WHERE u.Id = c.UserId
  AND c.UserId = ph.UserId
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;