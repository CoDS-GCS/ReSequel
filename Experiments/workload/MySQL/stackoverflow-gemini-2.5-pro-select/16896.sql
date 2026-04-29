WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Id AS PostId,
       tp.Title,
       tp.CreationDate,
       u.DisplayName AS OWNER,
       COUNT(c.Id) AS CommentCount
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
LEFT JOIN Comments c ON c.PostId = tp.Id
GROUP BY tp.Id,
         tp.Title,
         tp.CreationDate,
         u.DisplayName
ORDER BY tp.CreationDate DESC;