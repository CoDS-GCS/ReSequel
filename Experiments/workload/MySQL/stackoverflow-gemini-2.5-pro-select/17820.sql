WITH LimitedPosts AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.ViewCount,
       p.Score
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
JOIN LimitedPosts lp ON p.Id = lp.Id
ORDER BY p.CreationDate DESC;