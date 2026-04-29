WITH LimitedPosts AS
  (SELECT p.Id,
          p.Title,
          p.OwnerUserId,
          p.CreationDate,
          p.Score,
          p.ViewCount
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   JOIN LimitedPosts lp ON c.PostId = lp.Id
   GROUP BY c.PostId)
SELECT lp.Id AS PostId,
       lp.Title,
       u.DisplayName AS OwnerDisplayName,
       lp.CreationDate,
       lp.Score,
       lp.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON lp.Id = cc.PostId
ORDER BY lp.CreationDate DESC;