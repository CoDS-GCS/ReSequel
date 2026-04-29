
SELECT p_filtered.Id AS PostId,
       p_filtered.Title,
       u.DisplayName AS OwnerDisplayName,
       p_filtered.CreationDate,
       p_filtered.Score
FROM
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p_filtered
JOIN Users u ON p_filtered.OwnerUserId = u.Id;