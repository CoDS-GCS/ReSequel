
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(c_agg.CommentCount, 0) AS CommentCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN
  (SELECT PostId,
          COUNT(Id) AS CommentCount
   FROM Comments
   GROUP BY PostId) AS c_agg ON p.Id = c_agg.PostId
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;