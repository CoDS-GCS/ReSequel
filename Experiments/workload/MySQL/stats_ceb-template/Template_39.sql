SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     badges AS b,
     votes AS v,
     users AS u
WHERE ph.UserId = u.Id
  AND v.UserId = u.Id
  AND c.UserId = u.Id
  AND b.UserId = u.Id
  AND b.Date >= &&&
  AND v.BountyAmount >= ###
  AND v.CreationDate >= &&&
  AND v.CreationDate <= &&&
  AND u.DownVotes >= ###
  AND u.DownVotes <= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate <= &&&;