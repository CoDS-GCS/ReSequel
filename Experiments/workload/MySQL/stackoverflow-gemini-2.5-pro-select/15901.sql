WITH TopPosts AS
  (SELECT Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Title,
       u.DisplayName AS OWNER,
       tp.CreationDate,
       tp.Score,
       tp.ViewCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;