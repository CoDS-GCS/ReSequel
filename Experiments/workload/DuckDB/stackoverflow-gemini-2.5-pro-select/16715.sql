WITH PostOwners AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          u.DisplayName
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1),
     CommentCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   GROUP BY PostId)
SELECT po.Title,
       po.CreationDate,
       po.DisplayName AS OwnerDisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM PostOwners po
LEFT JOIN CommentCounts cc ON po.Id = cc.PostId
ORDER BY po.CreationDate DESC
LIMIT 10;