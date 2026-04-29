WITH FilteredPosts AS
  (SELECT Title,
          CreationDate,
          OwnerUserId,
          ViewCount,
          Score
   FROM Posts
   WHERE PostTypeId = 1)
SELECT fp.Title,
       fp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       fp.ViewCount,
       fp.Score
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
ORDER BY fp.CreationDate DESC
LIMIT 10;