WITH PostCTE AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId,
          Score,
          ViewCount
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
        FROM PostCTE)
   GROUP BY PostId)
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       p.Score,
       p.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM PostCTE p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
ORDER BY p.CreationDate DESC;