
SELECT p.Title,
       u.DisplayName AS OwnerDisplayName,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
  AND EXISTS
    (SELECT 1
     FROM Users u_exists
     WHERE u_exists.Id = p.OwnerUserId)
ORDER BY p.CreationDate DESC
LIMIT 10;