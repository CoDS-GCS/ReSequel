
SELECT P.Title,
       P.CreationDate,
       U.DisplayName AS OwnerDisplayName,
       P.Score,
       P.ViewCount
FROM Posts P,
     Users U
WHERE P.OwnerUserId = U.Id
  AND P.PostTypeId = 1
ORDER BY P.CreationDate DESC
LIMIT 10;