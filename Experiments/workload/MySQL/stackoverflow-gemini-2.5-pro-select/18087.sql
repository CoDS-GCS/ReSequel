WITH TopPosts AS
  (SELECT Title,
          CreationDate,
          ViewCount,
          Score,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Title,
       tp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       tp.ViewCount,
       tp.Score
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id;