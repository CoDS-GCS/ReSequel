SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE u.Id = v.UserId
  AND v.UserId = ph.UserId
  AND ph.UserId = c.UserId
  AND c.CreationDate >= &&&
  AND c.CreationDate <= &&&
  AND ph.CreationDate >= &&&
  AND ph.CreationDate <= &&&
  AND v.CreationDate >= &&&
  AND v.CreationDate <= &&&
  AND u.Views >= ###
  AND u.Views <= ###
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###
  AND u.UpVotes <= ###;