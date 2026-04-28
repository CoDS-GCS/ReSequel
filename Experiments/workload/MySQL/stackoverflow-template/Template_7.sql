SELECT p.Id AS PostId,
       p.Title,
       u.DisplayName AS OwnerName,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = ###
ORDER BY p.CreationDate DESC
LIMIT ###;