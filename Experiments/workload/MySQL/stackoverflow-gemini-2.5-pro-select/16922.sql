WITH LimitedPosts AS
  (SELECT Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT lp.Title,
       u.DisplayName AS OwnerDisplayName,
       lp.CreationDate,
       lp.Score,
       lp.ViewCount
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
ORDER BY lp.CreationDate DESC;