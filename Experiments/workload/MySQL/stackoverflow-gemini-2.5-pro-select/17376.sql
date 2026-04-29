
SELECT p.Id,
       p.Title,
       p.CreationDate,
       u.DisplayName,
       p.Score
FROM Posts p
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p_ids ON p.Id = p_ids.Id
JOIN Users u ON p.OwnerUserId = u.Id;