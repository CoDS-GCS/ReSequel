SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     users AS u
WHERE c.UserId = u.Id
  AND u.Id = p.OwnerUserId
  AND c.Score = ###
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount <= ###
  AND u.DownVotes <= ###
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;