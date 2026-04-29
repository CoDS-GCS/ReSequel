WITH TopPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT p.Id AS PostId,
          COUNT(c.Id) AS Cnt
   FROM TopPosts p
   JOIN Comments c ON p.Id = c.PostId
   GROUP BY p.Id),
     VoteCounts AS
  (SELECT p.Id AS PostId,
          COUNT(*) FILTER (
                           WHERE v.VoteTypeId = 2) AS Up,
          COUNT(*) FILTER (
                           WHERE v.VoteTypeId = 3) AS Down
   FROM TopPosts p
   JOIN Votes v ON p.Id = v.PostId
   GROUP BY p.Id)
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OWNER,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.Up, 0) AS UpVotes,
       COALESCE(vc.Down, 0) AS DownVotes
FROM TopPosts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
LEFT JOIN VoteCounts vc ON p.Id = vc.PostId
ORDER BY p.CreationDate DESC;