SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND p.Id = v.PostId
  AND p.Id = c.PostId
  AND u.Id = b.UserId
  AND p.Id = ph.PostId
  AND p.AnswerCount >= ###
  AND p.CommentCount >= ###
  AND b.Date <= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.DownVotes >= ###;