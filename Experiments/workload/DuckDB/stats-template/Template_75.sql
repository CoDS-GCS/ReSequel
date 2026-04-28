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
  AND c.CreationDate <= &&& :: timestamp
  AND p.PostTypeId = ###
  AND p.Score = ###
  AND p.FavoriteCount <= ###
  AND pl.CreationDate >= &&& :: timestamp
  AND pl.CreationDate <= &&& :: timestamp
  AND ph.CreationDate >= &&& :: timestamp
  AND ph.CreationDate <= &&& :: timestamp
  AND v.CreationDate >= &&& :: timestamp
  AND u.Reputation >= ###
  AND u.DownVotes >= ###;