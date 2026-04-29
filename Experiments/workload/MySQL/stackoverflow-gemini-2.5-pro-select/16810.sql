
SELECT U.DisplayName,
       P.Title,
       P.CreationDate,
       P.ViewCount,
       P.Score
FROM
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          ViewCount,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS P
JOIN Users U ON P.OwnerUserId = U.Id;