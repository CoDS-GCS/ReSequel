WITH FilteredPosts AS
  (SELECT Id,
          OwnerUserId,
          Title,
          CreationDate
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
        FROM FilteredPosts)
   GROUP BY PostId)
SELECT u.DisplayName,
       fp.Title,
       fp.CreationDate,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON fp.Id = cc.PostId
ORDER BY fp.CreationDate DESC;