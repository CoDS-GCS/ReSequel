SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph
WHERE p.Id = c.PostId
  AND p.Id = ph.PostId
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###;