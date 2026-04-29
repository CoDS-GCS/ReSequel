WITH TopPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Title,
       u.DisplayName,
       tp.CreationDate,
       tp.Score
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;