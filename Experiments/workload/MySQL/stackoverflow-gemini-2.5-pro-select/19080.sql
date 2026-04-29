WITH TopPostIds AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score
FROM Posts p
JOIN TopPostIds tpi ON p.Id = tpi.Id
JOIN Users u ON p.OwnerUserId = u.Id;