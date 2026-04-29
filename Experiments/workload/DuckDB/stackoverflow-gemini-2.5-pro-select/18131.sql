WITH TopPosts AS
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
       T.Title,
       T.CreationDate,
       T.Score,
       T.ViewCount
FROM TopPosts T
JOIN Users U ON T.OwnerUserId = U.Id
ORDER BY T.CreationDate DESC;