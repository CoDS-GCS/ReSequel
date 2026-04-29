WITH TopPosts AS
  (SELECT Id,
          OwnerUserId,
          Title,
          CreationDate
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM TopPosts)
   GROUP BY PostId)
SELECT tp.Id AS PostId,
       tp.Title,
       tp.CreationDate,
       u.DisplayName AS OwnerName,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON tp.Id = cc.PostId
ORDER BY tp.CreationDate DESC;