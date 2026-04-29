
SELECT P_Limited.Id AS PostId,
       P_Limited.Title,
       U.DisplayName AS OwnerDisplayName,
       P_Limited.CreationDate,
       P_Limited.Score,
       P_Limited.ViewCount
FROM
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS P_Limited
JOIN Users U ON P_Limited.OwnerUserId = U.Id;