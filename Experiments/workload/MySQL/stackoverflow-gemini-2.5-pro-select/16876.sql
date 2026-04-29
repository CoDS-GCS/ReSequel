
SELECT
  (SELECT DisplayName
   FROM Users
   WHERE Id = P.OwnerUserId), P.Title,
                              P.CreationDate,
                              P.Score
FROM Posts P
WHERE P.PostTypeId = 1
ORDER BY P.CreationDate DESC
LIMIT 10;