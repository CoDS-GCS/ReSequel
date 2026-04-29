WITH FilteredPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1)
SELECT u.DisplayName,
       fp.Title,
       fp.CreationDate,
       fp.Score,
       fp.ViewCount
FROM Users u
JOIN FilteredPosts fp ON u.Id = fp.OwnerUserId
ORDER BY fp.CreationDate DESC
LIMIT 10;