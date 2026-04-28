SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     users AS u,
     badges AS b
WHERE u.Id = p.OwnerUserId
  AND p.OwnerUserId = ph.UserId
  AND ph.UserId = b.UserId
  AND ph.CreationDate >= &&&
  AND ph.CreationDate <= &&&
  AND p.Score >= ###
  AND p.ViewCount >= ###
  AND p.ViewCount <= ###
  AND p.AnswerCount >= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND u.Views >= ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###;