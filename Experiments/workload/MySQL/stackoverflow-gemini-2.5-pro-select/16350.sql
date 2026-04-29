WITH TopPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Id,
       tp.Title,
       u.DisplayName,
       tp.CreationDate,
       tp.Score
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id;