
SELECT U.DisplayName,
       P.Title,
       P.CreationDate,
       P.ViewCount,
       P.Score
FROM Posts P
JOIN Users U ON P.OwnerUserId = U.Id
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS LimitedP ON P.Id = LimitedP.Id;