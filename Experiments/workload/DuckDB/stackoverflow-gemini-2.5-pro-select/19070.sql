WITH AllJoined AS
  (SELECT U.DisplayName,
          P.Title,
          P.CreationDate,
          P.Score,
          C.Text AS CommentText,
          P.PostTypeId
   FROM Posts P
   JOIN Users U ON P.OwnerUserId = U.Id
   LEFT JOIN Comments C ON P.Id = C.PostId)
SELECT DisplayName,
       Title,
       CreationDate,
       Score,
       CommentText
FROM AllJoined
WHERE PostTypeId = 1
ORDER BY CreationDate DESC
LIMIT 10;