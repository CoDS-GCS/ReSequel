
SELECT T.DisplayName,
       T.Title,
       T.CreationDate,
       T.Score,
       T.ViewCount
FROM
  (SELECT U.DisplayName,
          P.Title,
          P.CreationDate,
          P.Score,
          P.ViewCount
   FROM Posts P
   JOIN Users U ON P.OwnerUserId = U.Id
   WHERE P.PostTypeId = 1) AS T
ORDER BY T.CreationDate DESC
LIMIT 10;