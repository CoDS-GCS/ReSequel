SELECT COUNT(*)
FROM posts AS p,
     postLinks AS pl,
     postHistory AS ph
WHERE p.Id = pl.PostId
  AND pl.PostId = ph.PostId
  AND p.CreationDate >= &&&
  AND ph.CreationDate >= &&&;