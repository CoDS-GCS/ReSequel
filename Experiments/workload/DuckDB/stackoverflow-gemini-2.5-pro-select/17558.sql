WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments AS c SEMI
   JOIN TopPosts AS tp ON c.PostId = tp.Id
   GROUP BY c.PostId)
SELECT tp.Id,
       tp.Title,
       tp.CreationDate,
       u.DisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM TopPosts AS tp
JOIN Users AS u ON tp.OwnerUserId = u.Id
LEFT JOIN CommentCounts AS cc ON tp.Id = cc.PostId
ORDER BY tp.CreationDate DESC;