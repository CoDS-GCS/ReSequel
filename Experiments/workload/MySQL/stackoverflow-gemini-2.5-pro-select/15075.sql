
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.ViewCount,
       p.Score
FROM Posts p,
     Users u
WHERE p.OwnerUserId = u.Id
  AND p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;