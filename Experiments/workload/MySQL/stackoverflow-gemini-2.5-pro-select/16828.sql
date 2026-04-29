WITH FilteredPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          ViewCount,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT u.DisplayName,
       fp.Title,
       fp.CreationDate,
       fp.ViewCount,
       fp.Score
FROM FilteredPosts AS fp
JOIN Users AS u ON fp.OwnerUserId = u.Id;