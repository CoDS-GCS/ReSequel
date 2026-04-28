SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     votes AS v,
     users AS u
WHERE u.Id = v.UserId
  AND v.UserId = ph.UserId
  AND ph.UserId = c.UserId
  AND v.BountyAmount >= ###
  AND v.CreationDate >= &&&
  AND v.CreationDate <= &&&
  AND u.Reputation >= ###
  AND u.Views >= ###
  AND u.Views <= ###
  AND u.UpVotes = ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;