WITH FilteredPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1),
     RelevantCommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c SEMI
   JOIN FilteredPosts fp ON c.PostId = fp.Id
   GROUP BY c.PostId)
SELECT fp.Id AS PostId,
       fp.Title,
       u.DisplayName AS OwnerDisplayName,
       fp.CreationDate,
       fp.Score,
       fp.ViewCount,
       COALESCE(rcc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN RelevantCommentCounts rcc ON fp.Id = rcc.PostId
ORDER BY fp.CreationDate DESC
LIMIT 10;