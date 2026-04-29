
SELECT P.Title,
       P.CreationDate,

  (SELECT U.DisplayName
   FROM Users U
   WHERE U.Id = P.OwnerUserId) AS OwnerDisplayName,
       P.Score,
       P.ViewCount
FROM Posts P
WHERE P.PostTypeId = 1
ORDER BY P.CreationDate DESC
LIMIT 10;