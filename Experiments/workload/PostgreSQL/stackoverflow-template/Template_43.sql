SELECT P.Title,
       P.CreationDate,
       U.DisplayName AS OwnerDisplayName,
       P.Score,
       P.ViewCount
FROM Posts P
JOIN Users U ON P.OwnerUserId = U.Id
WHERE P.PostTypeId = ###
ORDER BY P.CreationDate DESC
LIMIT ###;