WITH TopPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          p.OwnerUserId
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   JOIN TopPosts tp ON c.PostId = tp.Id
   GROUP BY c.PostId),
     VoteCounts AS
  (SELECT v.PostId,
          SUM(v.VoteTypeId = 2) AS UpVotes,
          SUM(v.VoteTypeId = 3) AS DownVotes
   FROM Votes v
   JOIN TopPosts tp ON v.PostId = tp.Id
   WHERE v.VoteTypeId IN (2,
                          3)
   GROUP BY v.PostId)
SELECT tp.Title,
       tp.CreationDate,
       u.DisplayName AS Author,
       IFNULL(cc.Cnt, 0) AS CommentCount,
       IFNULL(vc.UpVotes, 0) AS UpVotes,
       IFNULL(vc.DownVotes, 0) AS DownVotes
FROM TopPosts tp
JOIN Users u ON tp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON tp.Id = cc.PostId
LEFT JOIN VoteCounts vc ON tp.Id = vc.PostId
ORDER BY tp.CreationDate DESC;