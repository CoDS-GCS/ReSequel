SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     badges AS b,
     users AS u
WHERE u.Id = b.UserId
  AND u.Id = ph.UserId
  AND u.Id = c.UserId
  AND ph.PostHistoryTypeId = ###
  AND ph.CreationDate <= &&&
  AND b.Date <= &&&
  AND u.Views >= ###
  AND u.DownVotes >= ###
  AND u.UpVotes >= ###
  AND u.UpVotes <= ###
  AND u.CreationDate >= &&&
  AND u.CreationDate <= &&&;