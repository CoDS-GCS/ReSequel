WITH TopPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          u.DisplayName
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT tp.Id AS PostId,
       tp.Title,
       tp.CreationDate,
       tp.DisplayName AS OwnerDisplayName,

  (SELECT COUNT(c.Id)
   FROM Comments c
   WHERE c.PostId = tp.Id) AS CommentCount,

  (SELECT COUNT(v.Id)
   FROM Votes v
   WHERE v.PostId = tp.Id) AS VoteCount
FROM TopPosts tp
ORDER BY tp.CreationDate DESC;