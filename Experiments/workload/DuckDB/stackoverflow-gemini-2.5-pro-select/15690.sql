
SELECT P_Limited.Title,
       P_Limited.CreationDate,
       U.DisplayName AS OwnerDisplayName,
       P_Limited.Score,
       P_Limited.ViewCount
FROM
  (SELECT Title,
          CreationDate,
          OwnerUserId,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS P_Limited
JOIN Users U ON P_Limited.OwnerUserId = U.Id
ORDER BY P_Limited.CreationDate DESC;