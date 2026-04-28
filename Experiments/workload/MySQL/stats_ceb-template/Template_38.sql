SELECT COUNT(*)
FROM votes AS v,
     posts AS p,
     badges AS b,
     users AS u
WHERE p.Id = v.PostId
  AND u.Id = p.OwnerUserId
  AND u.Id = b.UserId
  AND v.CreationDate <= &&&
  AND p.PostTypeId = ###
  AND p.Score >= ###
  AND p.FavoriteCount >= ###
  AND p.FavoriteCount <= ###
  AND b.Date >= &&&
  AND b.Date <= &&&
  AND u.DownVotes <= ###
  AND u.UpVotes >= ###
  AND u.CreationDate >= &&&;