SELECT P.Id AS PostId,
       P.Title,
       U.DisplayName AS OwnerDisplayName,
       P.CreationDate,
       P.Score,
       P.ViewCount
FROM Posts P
JOIN Users U ON P.OwnerUserId = U.Id
WHERE P.PostTypeId = ###
ORDER BY P.CreationDate DESC
LIMIT ###;