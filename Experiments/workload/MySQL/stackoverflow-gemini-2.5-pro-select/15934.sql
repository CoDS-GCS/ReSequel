WITH TopPosts AS
  (SELECT p.Id,
          p.OwnerUserId,
          p.CreationDate
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.Score,
       p.ViewCount,
       p.AnswerCount,
       p.CommentCount
FROM Posts p
JOIN TopPosts tp ON p.Id = tp.Id
JOIN Users u ON tp.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;