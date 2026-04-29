
SELECT p.Id,
       p.Title,
       u.DisplayName,
       p.CreationDate
FROM Posts p,
     Users u
WHERE p.OwnerUserId = u.Id
  AND p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;