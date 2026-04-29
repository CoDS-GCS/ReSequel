
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score
FROM
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY Score DESC
   LIMIT 10) AS p
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.Score DESC;