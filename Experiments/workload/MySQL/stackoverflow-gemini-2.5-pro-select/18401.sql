
SELECT p.Id AS PostId,
       p.Title,
       u.DisplayName AS OwnerName,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS lp
JOIN Posts p ON lp.Id = p.Id
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;