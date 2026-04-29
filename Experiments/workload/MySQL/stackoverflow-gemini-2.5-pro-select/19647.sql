
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM Posts p
LEFT JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
  AND u.Id IS NOT NULL
ORDER BY p.Score DESC
LIMIT 10;