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
SELECT U.DisplayName,
       LP.Title,
       LP.CreationDate,
       LP.Score,
       LP.ViewCount
FROM LimitedPosts LP
INNER JOIN Users U ON LP.OwnerUserId = U.Id;