
SELECT p.Id,
       p.Title,
       u.DisplayName,
       p.CreationDate
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS TopPosts ON p.Id = TopPosts.Id
ORDER BY p.CreationDate DESC;