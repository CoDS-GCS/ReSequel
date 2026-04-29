WITH FilteredPostIds AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT p.Id AS PostId,
       p.Title,
       u.DisplayName AS OwnerDisplayName,
       p.CreationDate,
       p.Score,
       COALESCE(cc.Cnt, 0) AS CommentCount
FROM Posts p
JOIN FilteredPostIds fpi ON p.Id = fpi.Id
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM FilteredPostIds)
   GROUP BY PostId) cc ON p.Id = cc.PostId
ORDER BY p.CreationDate DESC;