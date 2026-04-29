WITH CommentCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   GROUP BY PostId),
     FilteredPosts AS
  (SELECT Id,
          OwnerUserId,
          Title,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1)
SELECT u.DisplayName,
       fp.Title,
       fp.CreationDate,
       fp.Score,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON fp.Id = cc.PostId
ORDER BY fp.Score DESC
LIMIT 10;