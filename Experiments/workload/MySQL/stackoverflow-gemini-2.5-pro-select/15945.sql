WITH FilteredPosts AS
  (SELECT p.Id,
          p.Title,
          p.OwnerUserId,
          p.CreationDate,
          p.ViewCount,
          p.Score
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   JOIN FilteredPosts fp ON c.PostId = fp.Id
   GROUP BY c.PostId)
SELECT fp.Id AS PostId,
       fp.Title,
       u.DisplayName AS OwnerDisplayName,
       fp.CreationDate,
       fp.ViewCount,
       fp.Score,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON fp.Id = cc.PostId
ORDER BY fp.CreationDate DESC;