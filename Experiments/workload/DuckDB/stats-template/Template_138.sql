SELECT COUNT(*)
FROM postHistory AS ph,
     posts AS p,
     votes AS v,
     users AS u
WHERE p.Id = ph.PostId
  AND u.Id = p.OwnerUserId
  AND p.Id = v.PostId
  AND p.PostTypeId = ###
  AND p.Score >= ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###;