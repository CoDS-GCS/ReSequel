WITH UserPosts AS
  (SELECT u.DisplayName,
          p.Title,
          p.CreationDate,
          p.Score,
          p.ViewCount
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1)
SELECT DisplayName,
       Title,
       CreationDate,
       Score,
       ViewCount
FROM UserPosts
ORDER BY Score DESC
LIMIT 10;