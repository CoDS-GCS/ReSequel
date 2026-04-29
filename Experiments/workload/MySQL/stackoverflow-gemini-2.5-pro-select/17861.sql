WITH FilteredPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1)
SELECT FP.Id AS PostId,
       FP.Title,
       U.DisplayName AS OwnerDisplayName,
       FP.CreationDate,
       FP.Score,
       FP.ViewCount
FROM FilteredPosts FP
JOIN Users U ON FP.OwnerUserId = U.Id
ORDER BY FP.CreationDate DESC
LIMIT 10;