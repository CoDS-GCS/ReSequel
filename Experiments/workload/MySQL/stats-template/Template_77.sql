SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE p.Id = pl.PostId
  AND p.Id = ph.PostId
  AND p.Id = c.PostId
  AND u.Id = c.UserId
  AND u.Id = v.UserId
  AND c.CreationDate >= &&&
  AND c.CreationDate <= &&&
  AND p.Score >= ###
  AND p.Score <= ###
  AND p.CommentCount <= ###
  AND ph.PostHistoryTypeId = ###
  AND ph.CreationDate <= &&&
  AND v.BountyAmount <= ###
  AND v.CreationDate >= &&&
  AND v.CreationDate <= &&&
  AND u.Views >= ###
  AND u.CreationDate <= &&&;