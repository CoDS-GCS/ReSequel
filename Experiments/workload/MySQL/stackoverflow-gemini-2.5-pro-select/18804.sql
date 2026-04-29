
SELECT p.Title,
       u.DisplayName AS OwnerDisplayName,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM
  (SELECT Title,
          CreationDate,
          Score,
          ViewCount,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p
JOIN Users u ON p.OwnerUserId = u.Id;