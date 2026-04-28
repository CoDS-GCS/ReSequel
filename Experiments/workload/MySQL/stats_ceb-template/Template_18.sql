SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     votes AS v,
     badges AS b,
     users AS u
WHERE p.Id = c.PostId
  AND p.Id = pl.RelatedPostId
  AND p.Id = v.PostId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND c.Score = ###
  AND p.ViewCount <= ###
  AND p.CommentCount <= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND p.CreationDate >= &&&
  AND u.UpVotes >= ###;