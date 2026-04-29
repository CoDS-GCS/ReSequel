WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   JOIN TopPosts tp ON c.PostId = tp.Id
   GROUP BY c.PostId)
SELECT tp.Id AS PostId,
       tp.Title,
       tp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       tp.Score,
       tp.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON tp.Id = cc.PostId
ORDER BY tp.CreationDate DESC;