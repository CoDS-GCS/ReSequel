WITH TopPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          p.OwnerUserId
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT tp.Id AS PostId,
       tp.Title,
       tp.CreationDate,
       u.DisplayName AS OwnerDisplayName,

  (SELECT COUNT(*)
   FROM Comments c
   WHERE c.PostId = tp.Id) AS CommentCount,

  (SELECT COUNT(*)
   FROM Votes v
   WHERE v.PostId = tp.Id
     AND v.VoteTypeId = 2) AS UpVotes,

  (SELECT COUNT(*)
   FROM Votes v
   WHERE v.PostId = tp.Id
     AND v.VoteTypeId = 3) AS DownVotes
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
ORDER BY tp.CreationDate DESC;