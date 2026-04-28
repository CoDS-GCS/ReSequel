SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = ph.UserId
  AND u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = c.UserId
  AND c.Score = ###
  AND p.Score >= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND ph.CreationDate <= &&& :: timestamp
  AND u.Views = ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###;