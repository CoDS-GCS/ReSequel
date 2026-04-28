SELECT COUNT(*)
FROM comments AS c,
     posts AS p,
     postLinks AS pl,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE u.Id = p.OwnerUserId
  AND p.Id = v.PostId
  AND p.Id = c.PostId
  AND p.Id = pl.PostId
  AND p.Id = ph.PostId
  AND c.CreationDate >= &&&
  AND p.Score >= ###
  AND p.CommentCount <= ###
  AND p.CreationDate >= &&&
  AND p.CreationDate <= &&&
  AND pl.CreationDate <= &&&
  AND ph.CreationDate >= &&&
  AND u.DownVotes >= ###
  AND u.UpVotes >= ###;