SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.ViewCount,
       p.Score
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = ###
ORDER BY p.CreationDate DESC
LIMIT ###;