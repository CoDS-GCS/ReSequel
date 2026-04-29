WITH FilteredPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          p.OwnerUserId
   FROM Posts AS p
   WHERE p.PostTypeId = 1),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments AS c
   JOIN FilteredPosts AS fp ON c.PostId = fp.Id
   GROUP BY c.PostId)
SELECT fp.Id AS PostId,
       fp.Title,
       fp.CreationDate,
       u.DisplayName AS Author,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts AS fp
JOIN Users AS u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts AS cc ON fp.Id = cc.PostId
ORDER BY fp.CreationDate DESC
LIMIT 10;