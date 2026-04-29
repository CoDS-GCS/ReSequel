
SELECT p.Id AS PostId,
       p.Title,
       u.DisplayName AS OwnerDisplayName,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS TopPostIds
JOIN Posts p ON p.Id = TopPostIds.Id
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;