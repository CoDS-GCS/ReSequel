WITH LatestPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          Score,
          ViewCount,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT lp.Title,
       lp.CreationDate,
       u.DisplayName,
       lp.Score,
       lp.ViewCount,
       cc.CommentCount
FROM LatestPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
CROSS JOIN LATERAL
  (SELECT COUNT(c.Id) AS CommentCount
   FROM Comments c
   WHERE c.PostId = lp.Id) AS cc
ORDER BY lp.CreationDate DESC;