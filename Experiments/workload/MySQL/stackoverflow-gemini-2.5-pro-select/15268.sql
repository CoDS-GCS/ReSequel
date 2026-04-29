
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,

  (SELECT u.DisplayName
   FROM Users u
   WHERE u.Id = p.OwnerUserId) AS OwnerDisplayName,
       p.Score,
       p.ViewCount
FROM Posts p
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;