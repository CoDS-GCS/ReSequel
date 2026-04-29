WITH PostUsers AS
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
          COUNT(Id) AS Cnt
   FROM Comments
   GROUP BY PostId)
SELECT pu.Id AS PostId,
       pu.Title,
       pu.DisplayName AS OwnerDisplayName,
       pu.CreationDate,
       pu.Score,
       pu.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM PostUsers pu
LEFT JOIN CommentCounts cc ON pu.Id = cc.PostId
ORDER BY pu.CreationDate DESC
LIMIT 10;