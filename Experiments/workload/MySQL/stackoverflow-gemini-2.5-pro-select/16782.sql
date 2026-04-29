
SELECT P.Title,
       P.CreationDate,
       U.DisplayName AS OwnerDisplayName,
       P.Score,
       P.ViewCount
FROM Posts AS P
JOIN
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS TopPosts ON P.Id = TopPosts.Id
JOIN Users AS U ON P.OwnerUserId = U.Id
ORDER BY P.CreationDate DESC;