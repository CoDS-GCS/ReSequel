WITH LimitedPosts AS
  (SELECT Title,
          CreationDate,
          Score,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT lp.Title,
       u.DisplayName,
       lp.CreationDate,
       lp.Score
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
ORDER BY lp.CreationDate DESC;