SELECT COUNT(*)
FROM tags AS t,
     posts AS p,
     users AS u,
     votes AS v,
     badges AS b
WHERE u.Id = b.UserId
  AND u.Id = p.OwnerUserId
  AND u.Id = v.UserId
  AND p.Id = t.ExcerptPostId
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND u.Reputation >= ###
  AND b.Date <= &&& :: timestamp;