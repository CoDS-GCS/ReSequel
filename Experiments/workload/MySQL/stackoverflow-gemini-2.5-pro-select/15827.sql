WITH LimitedPosts AS
  (SELECT Id,
          OwnerUserId
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
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
JOIN Posts p ON lp.Id = p.Id
ORDER BY p.CreationDate DESC;