WITH LimitedPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT u.DisplayName,
       lp.Title,
       lp.CreationDate,
       lp.Score,
       lp.ViewCount
FROM LimitedPosts lp
JOIN Users u ON u.Id = lp.OwnerUserId;