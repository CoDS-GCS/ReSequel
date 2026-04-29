
SELECT U.DisplayName,
       P.Title,
       P.CreationDate,
       P.Score,
       P.ViewCount
FROM Posts P
CROSS JOIN Users U
WHERE P.OwnerUserId = U.Id
  AND P.PostTypeId = 1
ORDER BY P.CreationDate DESC
LIMIT 10;