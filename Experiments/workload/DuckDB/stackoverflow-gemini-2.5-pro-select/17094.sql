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
       u.DisplayName AS OwnerDisplayName,
       lp.Score,
       lp.ViewCount,

  (SELECT COUNT(*)
   FROM Comments c
   WHERE c.PostId = lp.Id) AS CommentCount
FROM LatestPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
ORDER BY lp.CreationDate DESC;