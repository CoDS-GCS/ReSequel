WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OWNER,
       COUNT(c.Id) AS CommentCount
FROM TopPosts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN Comments c ON p.Id = c.PostId
GROUP BY p.Id,
         p.Title,
         p.CreationDate,
         u.DisplayName
ORDER BY p.CreationDate DESC;