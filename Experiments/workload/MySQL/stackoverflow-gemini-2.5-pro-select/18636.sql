WITH TopPosts AS
  (SELECT Id,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT U.DisplayName,
       P.Title,
       P.CreationDate,
       P.ViewCount,
       P.Score
FROM Posts P
JOIN TopPosts ON P.Id = TopPosts.Id
JOIN Users U ON TopPosts.OwnerUserId = U.Id;