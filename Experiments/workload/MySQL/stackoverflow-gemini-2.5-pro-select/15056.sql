
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       p.Score,
       u.DisplayName AS OwnerDisplayName,
       COUNT(c.Id) AS CommentCount
FROM Posts p
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS top_p ON p.Id = top_p.Id
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN Comments c ON p.Id = c.PostId
GROUP BY p.Id,
         u.DisplayName
ORDER BY p.CreationDate DESC;