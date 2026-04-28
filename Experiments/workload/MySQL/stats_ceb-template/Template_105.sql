SELECT COUNT(*)
FROM posts AS p,
     postLinks AS pl,
     users AS u
WHERE p.Id = pl.PostId
  AND p.OwnerUserId = u.Id
  AND p.CommentCount <= ###
  AND u.CreationDate <= &&&;