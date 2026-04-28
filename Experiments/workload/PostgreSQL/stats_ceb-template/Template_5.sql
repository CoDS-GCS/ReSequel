SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u
WHERE p.OwnerUserId = u.Id
  AND ph.UserId = u.Id
  AND p.Score >= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND u.DownVotes = ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###;