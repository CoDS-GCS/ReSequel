WITH LimitedPostInfo AS
  (SELECT Id,
          OwnerUserId,
          CreationDate
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.Score,
       p.ViewCount
FROM Posts p
JOIN LimitedPostInfo lpi ON p.Id = lpi.Id
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;