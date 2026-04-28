SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE v.UserId = u.Id
  AND c.UserId = u.Id
  AND ph.UserId = u.Id
  AND c.Score = ###
  AND c.CreationDate >= &&&
  AND c.CreationDate <= &&&
  AND u.Views <= ###
  AND u.DownVotes >= ###
  AND u.CreationDate <= &&&;