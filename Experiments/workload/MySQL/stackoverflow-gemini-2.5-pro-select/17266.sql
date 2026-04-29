
SELECT u.DisplayName,
       p_limited.Title,
       p_limited.CreationDate
FROM
  (SELECT OwnerUserId,
          Title,
          CreationDate
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p_limited
JOIN Users u ON p_limited.OwnerUserId = u.Id;