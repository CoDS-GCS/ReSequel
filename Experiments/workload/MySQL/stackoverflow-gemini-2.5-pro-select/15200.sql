
SELECT U.DisplayName,
       P.Title,
       P.CreationDate,
       P.Score,
       P.ViewCount
FROM
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS LimitedPostIds
JOIN Posts P ON LimitedPostIds.Id = P.Id
JOIN Users U ON P.OwnerUserId = U.Id;