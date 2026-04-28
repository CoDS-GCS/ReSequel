SELECT COUNT(*)
FROM postLinks AS pl,
     posts AS p,
     users AS u,
     badges AS b
WHERE p.Id = pl.RelatedPostId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND pl.LinkTypeId = ###
  AND p.Score >= ###
  AND p.CommentCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND u.Views <= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;