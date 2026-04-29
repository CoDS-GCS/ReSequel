
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.ViewCount,
       p.Score
FROM
  (SELECT Title,
          CreationDate,
          OwnerUserId,
          ViewCount,
          Score,
          PostTypeId
   FROM Posts) p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;