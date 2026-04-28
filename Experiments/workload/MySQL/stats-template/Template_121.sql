SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = b.UserId
  AND u.Id = ph.UserId
  AND u.Id = c.UserId
  AND c.Score = ###
  AND ph.CreationDate >= &&&
  AND ph.CreationDate <= &&&
  AND u.Reputation >= ###
  AND u.Reputation <= ###
  AND u.Views >= ###;