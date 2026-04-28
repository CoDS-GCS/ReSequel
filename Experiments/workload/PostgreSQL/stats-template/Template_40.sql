SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = c.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = ph.UserId
  AND u.Id = b.UserId
  AND p.PostTypeId = ###
  AND p.Score <= ###
  AND p.AnswerCount = ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND b.Date >= &&& :: timestamp
  AND b.Date <= &&& :: timestamp
  AND u.Views <= ###
  AND u.DownVotes <= ###
  AND u.CreationDate >= &&& :: timestamp
  AND u.CreationDate <= &&& :: timestamp;