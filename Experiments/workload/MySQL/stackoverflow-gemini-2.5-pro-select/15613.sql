WITH FilteredPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT fp.Id AS PostId,
       fp.Title,
       u.DisplayName AS OwnerDisplayName,
       fp.CreationDate,
       fp.Score,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM FilteredPosts)
   GROUP BY PostId) cc ON fp.Id = cc.PostId
ORDER BY fp.CreationDate DESC;