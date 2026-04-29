WITH LimitedPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT U.DisplayName,
       LP.Title,
       LP.CreationDate,
       LP.Score
FROM LimitedPosts LP
JOIN Users U ON LP.OwnerUserId = U.Id
ORDER BY LP.CreationDate DESC;