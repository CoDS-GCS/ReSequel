WITH TopPostIds AS
  (SELECT Id,
          CreationDate
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT p.Title,
       u.DisplayName,
       tpi.CreationDate,
       p.Score
FROM Posts p
JOIN TopPostIds tpi ON p.Id = tpi.Id
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY tpi.CreationDate DESC;