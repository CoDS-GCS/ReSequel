WITH PostUser AS
  (SELECT p.Id,
          p.Title,
          u.DisplayName,
          p.CreationDate,
          p.Score,
          p.ViewCount
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT pu.Id AS PostId,
       pu.Title,
       pu.DisplayName AS Author,
       pu.CreationDate,
       pu.Score,
       pu.ViewCount,
       COUNT(c.Id) AS CommentCount
FROM PostUser pu
LEFT JOIN Comments c ON pu.Id = c.PostId
GROUP BY pu.Id,
         pu.Title,
         pu.DisplayName,
         pu.CreationDate,
         pu.Score,
         pu.ViewCount
ORDER BY pu.CreationDate DESC;