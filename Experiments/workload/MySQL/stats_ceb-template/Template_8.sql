SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u,
     badges AS b
WHERE u.Id = p.OwnerUserId
  AND p.OwnerUserId = ph.UserId
  AND ph.UserId = b.UserId
  AND ph.PostHistoryTypeId = ###
  AND p.Score >= ###
  AND u.Reputation >= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###;