WITH TopPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM TopPosts)
   GROUP BY PostId)
SELECT p.Id AS PostId,
       p.Title,
       u.DisplayName AS OwnerDisplayName,
       p.CreationDate,
       p.Score,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM TopPosts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
ORDER BY p.CreationDate DESC;