
SELECT U.DisplayName,
       P.Title,
       P.CreationDate,
       P.Score,
       P.ViewCount
FROM Posts P
JOIN Users U ON P.OwnerUserId = U.Id
WHERE P.Id IN
    (SELECT Id
     FROM Posts
     WHERE PostTypeId = 1
     ORDER BY CreationDate DESC
     LIMIT 10)
ORDER BY P.CreationDate DESC;