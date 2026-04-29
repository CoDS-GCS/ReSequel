WITH FilteredPosts AS
  (SELECT Id,
          OwnerUserId,
          Title,
          CreationDate
   FROM Posts
   WHERE PostTypeId = 1),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   JOIN FilteredPosts fp ON c.PostId = fp.Id
   GROUP BY c.PostId)
SELECT fp.Id AS PostId,
       fp.Title,
       fp.CreationDate,
       u.DisplayName AS Author,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON fp.Id = cc.PostId
ORDER BY fp.CreationDate DESC
LIMIT 10;