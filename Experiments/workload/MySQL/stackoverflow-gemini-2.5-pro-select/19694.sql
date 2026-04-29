
SELECT u.DisplayName,
       p_filtered.Title,
       p_filtered.CreationDate,
       p_filtered.Score
FROM
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p_filtered
JOIN Users u ON p_filtered.OwnerUserId = u.Id;