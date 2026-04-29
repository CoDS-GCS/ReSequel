WITH TopPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          ViewCount,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT U.DisplayName,
       TP.Title,
       TP.CreationDate,
       TP.ViewCount,
       TP.Score
FROM TopPosts TP
JOIN Users U ON TP.OwnerUserId = U.Id
ORDER BY TP.CreationDate DESC;