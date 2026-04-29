WITH LimitedPostDetails AS
  (SELECT Id,
          OwnerUserId,
          CreationDate
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT P.Id AS PostId,
       P.Title,
       U.DisplayName AS OwnerDisplayName,
       LPD.CreationDate,
       P.Score,
       P.ViewCount
FROM Posts P
JOIN LimitedPostDetails LPD ON P.Id = LPD.Id
JOIN Users U ON LPD.OwnerUserId = U.Id
ORDER BY LPD.CreationDate DESC;