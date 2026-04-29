
SELECT p_main.Title,
       p_main.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p_main.Score,
       p_main.ViewCount
FROM Posts p_main
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p_filtered ON p_main.Id = p_filtered.Id
JOIN Users u ON p_main.OwnerUserId = u.Id
ORDER BY p_main.CreationDate DESC;