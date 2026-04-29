
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.ViewCount,
       p.Score
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS limited_posts ON p.Id = limited_posts.Id
ORDER BY p.CreationDate DESC;