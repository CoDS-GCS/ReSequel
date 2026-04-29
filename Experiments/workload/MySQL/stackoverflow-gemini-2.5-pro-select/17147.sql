WITH LimitedPosts AS
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
       COUNT(c.Id) AS CommentCount
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
LEFT JOIN Comments c ON lp.Id = c.PostId
GROUP BY lp.Id,
         u.DisplayName
ORDER BY lp.CreationDate DESC;