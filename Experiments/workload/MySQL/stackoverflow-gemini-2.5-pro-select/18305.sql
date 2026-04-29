
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
  AND EXISTS
    (SELECT 1
     FROM Users u2
     WHERE u2.Id = p.OwnerUserId)
ORDER BY p.Score DESC
LIMIT 10;