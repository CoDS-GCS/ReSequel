WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Id,
       tp.Title,
       tp.CreationDate,
       u.DisplayName,
       tp.Score
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;