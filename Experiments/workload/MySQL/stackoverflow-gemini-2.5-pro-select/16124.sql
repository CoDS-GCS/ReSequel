WITH FilteredPosts AS
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
SELECT fp.Id AS PostId,
       fp.Title,
       u.DisplayName AS Author,
       fp.CreationDate,
       fp.Score,
       fp.ViewCount,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN
  (SELECT c.PostId,
          COUNT(*) AS Cnt
   FROM Comments c
   WHERE c.PostId IN
       (SELECT Id
        FROM FilteredPosts)
   GROUP BY c.PostId) AS cc ON fp.Id = cc.PostId
ORDER BY fp.CreationDate DESC;