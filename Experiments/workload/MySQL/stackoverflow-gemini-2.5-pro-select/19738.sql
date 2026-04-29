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
SELECT tp.Title,
       tp.CreationDate,
       tp.DisplayName AS OwnerDisplayName,
       COUNT(DISTINCT c.Id) AS CommentCount,
       SUM(CASE
               WHEN v.VoteTypeId = 2 THEN 1
               ELSE 0
           END) AS UpVoteCount,
       SUM(CASE
               WHEN v.VoteTypeId = 3 THEN 1
               ELSE 0
           END) AS DownVoteCount
FROM TopPosts tp
LEFT JOIN Comments c ON tp.Id = c.PostId
LEFT JOIN Votes v ON tp.Id = v.PostId
GROUP BY tp.Id,
         tp.Title,
         tp.CreationDate,
         tp.DisplayName
ORDER BY tp.CreationDate DESC;