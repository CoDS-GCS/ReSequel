WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT tp.Id,
       tp.Title,
       tp.CreationDate,
       u.DisplayName,

  (SELECT COUNT(*)
   FROM Comments c
   WHERE c.PostId = tp.Id) AS CommentCount
FROM TopPosts AS tp
JOIN Users AS u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;