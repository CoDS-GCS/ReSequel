WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          ViewCount,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Id AS PostId,
       tp.Title,
       tp.CreationDate,
       tp.ViewCount,
       u.DisplayName AS OwnerDisplayName,

  (SELECT COUNT(c.Id)
   FROM Comments c
   WHERE c.PostId = tp.Id) AS CommentCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;