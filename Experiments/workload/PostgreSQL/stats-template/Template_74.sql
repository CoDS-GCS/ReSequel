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
  AND c.CreationDate >= &&& :: timestamp
  AND p.Score >= ###
  AND p.CommentCount <= ###
  AND p.CreationDate >= &&& :: timestamp
  AND p.CreationDate <= &&& :: timestamp
  AND pl.CreationDate <= &&& :: timestamp
  AND ph.CreationDate >= &&& :: timestamp
  AND u.DownVotes >= ###
  AND u.UpVotes >= ###;