
SELECT U.DisplayName,
       P_Sorted.Title,
       P_Sorted.CreationDate,
       P_Sorted.ViewCount,
       P_Sorted.Score
FROM
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          ViewCount,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS P_Sorted
JOIN Users U ON P_Sorted.OwnerUserId = U.Id;