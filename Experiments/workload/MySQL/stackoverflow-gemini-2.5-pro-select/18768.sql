
SELECT PostId,
       Title,
       OwnerDisplayName,
       CreationDate,
       ViewCount,
       Score
FROM
  (SELECT p.Id AS PostId,
          p.Title,
          u.DisplayName AS OwnerDisplayName,
          p.CreationDate,
          p.ViewCount,
          p.Score
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1) AS SubQuery
ORDER BY CreationDate DESC
LIMIT 10;