WITH TopPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT TP.Id AS PostId,
       TP.Title,
       U.DisplayName AS OwnerDisplayName,
       TP.CreationDate,
       TP.Score,
       TP.ViewCount
FROM TopPosts TP
JOIN Users U ON TP.OwnerUserId = U.Id
ORDER BY TP.CreationDate DESC;