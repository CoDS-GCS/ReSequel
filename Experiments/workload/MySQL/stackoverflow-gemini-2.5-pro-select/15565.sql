
SELECT U.DisplayName,
       P.Title,
       P.CreationDate,
       P.Score,
       P.ViewCount
FROM Users U
INNER JOIN Posts P ON U.Id = P.OwnerUserId
WHERE P.PostTypeId = 1
ORDER BY P.CreationDate DESC
LIMIT 10;