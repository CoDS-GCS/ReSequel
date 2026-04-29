
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.ViewCount,
       p.Score
FROM Posts p
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS top_p ON p.Id = top_p.Id
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;