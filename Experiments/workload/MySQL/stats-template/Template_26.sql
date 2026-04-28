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
  AND c.Score = ###
  AND c.CreationDate >= &&&
  AND c.CreationDate <= &&&
  AND p.PostTypeId = ###
  AND p.Score = ###
  AND p.ViewCount <= ###
  AND pl.CreationDate >= &&&
  AND ph.PostHistoryTypeId = ###
  AND u.Reputation <= ###
  AND u.Views >= ###
  AND u.Views <= ###
  AND u.DownVotes >= ###;