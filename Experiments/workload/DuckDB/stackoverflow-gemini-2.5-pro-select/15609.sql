WITH FilteredPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   WHERE c.PostId IN
       (SELECT Id
        FROM FilteredPosts)
   GROUP BY c.PostId)
SELECT fp.Id AS PostId,
       fp.Title,
       u.DisplayName AS OwnerDisplayName,
       fp.CreationDate,
       fp.Score,
       fp.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON fp.Id = cc.PostId
ORDER BY fp.CreationDate DESC
LIMIT 10;