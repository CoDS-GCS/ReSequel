SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u
WHERE p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND ph.CreationDate >= &&& :: timestamp
  AND p.Score >= ###
  AND u.Reputation >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&& :: timestamp;