SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     badges AS b,
     users AS u
WHERE u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = v.UserId
  AND p.PostTypeId = ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND u.Reputation >= ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###;