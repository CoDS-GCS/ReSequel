
SELECT P.Title,
       P.CreationDate,
       U.DisplayName AS OwnerDisplayName,
       P.Score,
       P.ViewCount
FROM
  (SELECT Title,
          CreationDate,
          OwnerUserId,
          Score,
          ViewCount
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS P
JOIN Users U ON P.OwnerUserId = U.Id
ORDER BY P.CreationDate DESC;