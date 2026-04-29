
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
  AND p.OwnerUserId IN
    (SELECT Id
     FROM Users)
ORDER BY p.Score DESC
LIMIT 10;