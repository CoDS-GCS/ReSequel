WITH TopPosts AS
  (SELECT Title,
          CreationDate,
          OwnerUserId,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT T.Title,
       T.CreationDate,
       U.DisplayName AS OwnerDisplayName,
       T.Score,
       T.ViewCount
FROM TopPosts T
JOIN Users U ON T.OwnerUserId = U.Id
ORDER BY T.CreationDate DESC;