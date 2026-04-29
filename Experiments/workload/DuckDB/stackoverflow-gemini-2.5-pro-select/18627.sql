WITH FilteredPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score,
          CommentCount
   FROM Posts
   WHERE PostTypeId = 1)
SELECT u.DisplayName,
       fp.Title,
       fp.CreationDate,
       fp.Score,
       fp.CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
ORDER BY fp.Score DESC
LIMIT 10;