WITH LimitedPosts AS
  (SELECT p.Id,
          p.OwnerUserId,
          p.Title,
          p.CreationDate,
          p.Score,
          p.ViewCount
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT lp.Id AS PostId,
       lp.Title,
       u.DisplayName AS OwnerDisplayName,
       lp.CreationDate,
       lp.Score,
       lp.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
LEFT JOIN
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM LimitedPosts)
   GROUP BY PostId) AS cc ON lp.Id = cc.PostId
ORDER BY lp.CreationDate DESC;