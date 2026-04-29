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
SELECT
STRAIGHT_JOIN U.DisplayName,
              FP.Title,
              FP.CreationDate,
              FP.ViewCount,
              FP.Score
FROM FilteredPosts FP
JOIN Users U ON FP.OwnerUserId = U.Id;