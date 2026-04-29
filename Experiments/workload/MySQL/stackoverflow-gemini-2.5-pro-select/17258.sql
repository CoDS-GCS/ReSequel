WITH LimitedPostIds AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT p.Id AS PostId,
       p.Title,
       u.DisplayName AS OwnerName,
       p.CreationDate,
       p.Score,
       p.ViewCount
FROM Posts p
JOIN LimitedPostIds lpi ON p.Id = lpi.Id
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;