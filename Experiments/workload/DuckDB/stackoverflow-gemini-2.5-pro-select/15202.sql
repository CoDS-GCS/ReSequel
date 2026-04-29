WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          Score,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Id AS PostId,
       tp.Title,
       tp.CreationDate,
       tp.Score,
       u.DisplayName AS OwnerDisplayName,

  (SELECT COUNT(*)
   FROM Comments c
   WHERE c.PostId = tp.Id) AS CommentCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;