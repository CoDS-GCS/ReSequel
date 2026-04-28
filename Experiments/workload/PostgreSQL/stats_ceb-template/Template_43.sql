SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     users AS u
WHERE c.UserId = u.Id
  AND ph.UserId = u.Id
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.Views <= ###
  AND u.DownVotes >= ###
  AND u.CreationDate <= &&& :: timestamp;