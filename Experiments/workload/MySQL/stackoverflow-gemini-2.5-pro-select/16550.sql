
SELECT p.Id AS PostId,
       p.Title,
       u.DisplayName AS Author,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM Posts p
LEFT JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;