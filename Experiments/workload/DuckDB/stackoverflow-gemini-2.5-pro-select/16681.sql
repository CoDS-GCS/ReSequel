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
SELECT T.Title,
       u.DisplayName AS OWNER,
       T.CreationDate,
       T.Score,
       T.ViewCount
FROM TopPosts T
JOIN Users u ON T.OwnerUserId = u.Id
ORDER BY T.CreationDate DESC;