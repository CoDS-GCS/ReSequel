
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score
FROM Posts p
STRAIGHT_JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;