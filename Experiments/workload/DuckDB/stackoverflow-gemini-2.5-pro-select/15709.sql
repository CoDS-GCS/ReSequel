WITH PostUser AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          p.Score,
          u.DisplayName
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
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM PostUser pu
LEFT JOIN CommentCounts cc ON pu.Id = cc.PostId
ORDER BY pu.CreationDate DESC
LIMIT 10;