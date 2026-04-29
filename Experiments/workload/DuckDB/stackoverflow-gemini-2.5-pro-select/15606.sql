WITH PostDetails AS
  (SELECT p.Id,
          p.Title,
          u.DisplayName,
          p.CreationDate,
          p.Score,
          p.ViewCount
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1),
     CommentCounts AS
  (SELECT PostId,
          COUNT(*) AS Cnt
   FROM Comments
   GROUP BY PostId)
SELECT pd.Id AS PostId,
       pd.Title,
       pd.DisplayName AS Author,
       pd.CreationDate,
       pd.Score,
       pd.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM PostDetails pd
LEFT JOIN CommentCounts cc ON pd.Id = cc.PostId
ORDER BY pd.CreationDate DESC
LIMIT 10;