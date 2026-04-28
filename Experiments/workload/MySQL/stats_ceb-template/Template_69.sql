SELECT COUNT(*)
FROM postLinks AS pl,
     posts AS p,
     users AS u,
     badges AS b
WHERE p.Id = pl.RelatedPostId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND pl.CreationDate <= &&&
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.AnswerCount <= ###
  AND p.CommentCount = ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND u.Views <= ###
  AND u.DownVotes >= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&
  AND b.Date <= &&&;