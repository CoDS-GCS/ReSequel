SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND p.Id = c.PostId
  AND p.Id = ph.PostId
  AND p.Id = v.PostId
  AND c.Score = ###
  AND c.CreationDate <= &&&
  AND p.Score >= ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.CreationDate >= &&&
  AND u.Reputation <= ###
  AND u.DownVotes <= ###;