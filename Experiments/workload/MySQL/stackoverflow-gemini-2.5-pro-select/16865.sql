WITH TopPostIds AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT p.Id,
       p.Title,
       u.DisplayName,
       p.CreationDate
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
JOIN TopPostIds tpi ON p.Id = tpi.Id
ORDER BY p.CreationDate DESC;