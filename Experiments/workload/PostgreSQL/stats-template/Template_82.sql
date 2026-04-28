SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     users AS u
WHERE c.UserId = u.Id
  AND ph.UserId = u.Id
  AND c.CreationDate >= &&& :: timestamp
  AND c.CreationDate <= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.Views <= ###
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&& :: timestamp;