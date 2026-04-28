SELECT COUNT(*)
FROM posts AS p,
     tags AS t,
     votes AS v
WHERE p.Id = t.ExcerptPostId
  AND p.OwnerUserId = v.UserId
  AND p.CreationDate >= &&&;