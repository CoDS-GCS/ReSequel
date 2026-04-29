WITH PostUsers AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          u.DisplayName
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1)
SELECT pu.Title,
       pu.CreationDate,
       pu.DisplayName,
       COALESCE(c.CommentCount, 0) AS CommentCount
FROM PostUsers pu
LEFT JOIN
  (SELECT PostId,
          COUNT(Id) AS CommentCount
   FROM Comments
   GROUP BY PostId) c ON pu.Id = c.PostId
ORDER BY pu.CreationDate DESC
LIMIT 10;