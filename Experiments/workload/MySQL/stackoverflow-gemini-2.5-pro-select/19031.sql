
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM Posts p
STRAIGHT_JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
ORDER BY p.Score DESC
LIMIT 10;