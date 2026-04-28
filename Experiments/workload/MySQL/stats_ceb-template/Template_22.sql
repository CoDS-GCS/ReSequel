SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postHistory AS ph,
     votes AS v,
     badges AS b,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND p.Id = c.PostId
  AND p.Id = ph.PostId
  AND p.Id = v.PostId
  AND p.PostTypeId = ###
  AND p.CommentCount >= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND v.BountyAmount <= ###;