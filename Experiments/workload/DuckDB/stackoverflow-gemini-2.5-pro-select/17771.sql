WITH TopPosts AS
  (SELECT p.Id,
          u.DisplayName,
          p.Title,
          p.CreationDate,
          p.Score
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1
   ORDER BY p.Score DESC
   LIMIT 10)
SELECT tp.DisplayName,
       tp.Title,
       tp.CreationDate,
       tp.Score,
       COUNT(c.Id) AS CommentCount
FROM TopPosts tp
LEFT JOIN Comments c ON tp.Id = c.PostId
GROUP BY tp.DisplayName,
         tp.Title,
         tp.CreationDate,
         tp.Score,
         tp.Id
ORDER BY tp.Score DESC;