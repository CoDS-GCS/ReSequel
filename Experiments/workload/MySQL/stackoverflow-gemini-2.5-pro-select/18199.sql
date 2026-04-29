WITH FilteredPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT fp.Id AS PostId,
       fp.Title,
       u.DisplayName AS OwnerName,
       fp.CreationDate,
       fp.Score,
       fp.ViewCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
ORDER BY fp.CreationDate DESC;