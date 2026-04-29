WITH LimitedPostIds AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT P.Id AS PostId,
       P.Title,
       U.DisplayName AS OwnerDisplayName,
       P.CreationDate,
       P.Score,
       P.ViewCount
FROM Posts P
JOIN LimitedPostIds LPI ON P.Id = LPI.Id
JOIN Users U ON P.OwnerUserId = U.Id
ORDER BY P.CreationDate DESC;