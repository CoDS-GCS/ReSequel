
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score
FROM Posts p,
     Users u
WHERE p.OwnerUserId = u.Id
  AND p.PostTypeId = 1
ORDER BY p.Score DESC
LIMIT 10;