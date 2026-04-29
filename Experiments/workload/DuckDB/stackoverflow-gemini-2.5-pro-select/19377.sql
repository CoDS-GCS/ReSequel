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

  (SELECT COUNT(c.Id)
   FROM Comments c
   WHERE c.PostId = p.Id) AS CommentCount,

  (SELECT COUNT(*)
   FROM Votes v
   WHERE v.PostId = p.Id
     AND v.VoteTypeId = 2) AS UpVotes,

  (SELECT COUNT(*)
   FROM Votes v
   WHERE v.PostId = p.Id
     AND v.VoteTypeId = 3) AS DownVotes
FROM TopPosts p
JOIN Users u ON p.OwnerUserId = u.Id
ORDER BY p.CreationDate DESC;