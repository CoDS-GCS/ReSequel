SELECT COUNT(*)
FROM comments AS c,
     postHistory AS ph
WHERE c.UserId = ph.UserId
  AND c.Score = ###
  AND ph.PostHistoryTypeId = ###;