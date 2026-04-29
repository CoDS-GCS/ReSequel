
SELECT p.Title,
       u.DisplayName,
       p.CreationDate,
       p.Score
FROM
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p_ids
JOIN Posts p ON p.Id = p_ids.Id
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;