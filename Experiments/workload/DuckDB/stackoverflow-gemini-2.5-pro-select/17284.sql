WITH FilteredPosts AS
  (SELECT Id,
          OwnerUserId,
          Title,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1)
SELECT U.DisplayName,
       FP.Title,
       FP.CreationDate,
       FP.Score,
       C.Text AS CommentText
FROM FilteredPosts FP
JOIN Users U ON FP.OwnerUserId = U.Id
LEFT JOIN Comments C ON FP.Id = C.PostId
ORDER BY FP.CreationDate DESC
LIMIT 10;