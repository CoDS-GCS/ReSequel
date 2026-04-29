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
SELECT tp.Title,
       tp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       tp.Score,
       tp.ViewCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id;