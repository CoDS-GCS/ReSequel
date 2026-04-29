WITH TopPosts AS
  (SELECT Title,
          OwnerUserId,
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
FROM TopPosts AS tp
JOIN Users AS u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;