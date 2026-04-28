SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph,
     badges AS b,
     votes AS v,
     users AS u
WHERE u.Id = b.UserId
  AND b.UserId = ph.UserId
  AND ph.UserId = v.UserId
  AND v.UserId = c.UserId
  AND c.CreationDate >= &&&
  AND ph.PostHistoryTypeId = ###
  AND u.UpVotes = ###;