
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.Score,
       p.ViewCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
  AND EXISTS
    (SELECT 1
     FROM Users u_check
     WHERE u_check.Id = p.OwnerUserId)
ORDER BY p.CreationDate DESC
LIMIT 10;