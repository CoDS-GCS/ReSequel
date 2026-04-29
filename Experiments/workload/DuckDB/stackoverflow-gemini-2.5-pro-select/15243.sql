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
SELECT tpu.Id AS PostId,
       tpu.Title,
       tpu.CreationDate,
       tpu.DisplayName AS OwnerDisplayName,

  (SELECT COUNT(*)
   FROM Comments c
   WHERE c.PostId = tpu.Id) AS CommentCount
FROM TopPostsAndUsers tpu
ORDER BY tpu.CreationDate DESC;