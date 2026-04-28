SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph
WHERE c.UserId = ph.UserId
  AND ph.PostHistoryTypeId = ###
  AND ph.CreationDate >= &&&;