WITH TopPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          p.OwnerUserId
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   WHERE c.PostId IN
       (SELECT Id
        FROM TopPosts)
   GROUP BY c.PostId)
SELECT tp.Id,
       tp.Title,
       tp.CreationDate,
       u.DisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON tp.Id = cc.PostId
ORDER BY tp.CreationDate DESC;