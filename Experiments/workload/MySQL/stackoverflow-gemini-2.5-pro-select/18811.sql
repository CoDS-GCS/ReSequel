
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.Score,
       p.ViewCount
FROM
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) p
JOIN Users u ON p.OwnerUserId = u.Id;