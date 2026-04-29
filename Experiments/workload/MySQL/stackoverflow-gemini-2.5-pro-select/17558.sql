WITH TopPostsAndUsers AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          u.DisplayName
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT tpu.Id,
       tpu.Title,
       tpu.CreationDate,
       tpu.DisplayName,
       COUNT(c.Id) AS CommentCount
FROM TopPostsAndUsers tpu
LEFT JOIN Comments c ON tpu.Id = c.PostId
GROUP BY tpu.Id,
         tpu.Title,
         tpu.CreationDate,
         tpu.DisplayName
ORDER BY tpu.CreationDate DESC;