
SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       p.ViewCount,
       p.Score
FROM
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          ViewCount,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS p
JOIN Users AS u ON p.OwnerUserId = u.Id;