SELECT COUNT(*)
FROM comments AS c,
     votes AS v,
     users AS u,
     posts AS p
WHERE c.PostId = p.Id
  AND u.Id = c.UserId
  AND v.PostId = p.Id
  AND c.Score = ###
  AND u.Views >= ###
  AND u.Views <= ###;