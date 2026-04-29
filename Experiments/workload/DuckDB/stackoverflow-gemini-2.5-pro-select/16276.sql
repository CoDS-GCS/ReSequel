WITH TopPosts AS
  (SELECT OwnerUserId,
          CreationDate,
          Title,
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
FROM Users U
JOIN TopPosts T ON U.Id = T.OwnerUserId
ORDER BY T.CreationDate DESC;