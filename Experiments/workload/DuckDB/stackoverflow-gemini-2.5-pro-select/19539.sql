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
SELECT TP.Title,
       TP.CreationDate,
       U.DisplayName AS OwnerDisplayName,
       TP.Score,
       TP.ViewCount
FROM TopPosts TP
JOIN Users U ON TP.OwnerUserId = U.Id
ORDER BY TP.CreationDate DESC;