WITH PostAuthors AS
  (SELECT Id,
          DisplayName
   FROM Users)
SELECT pa.DisplayName,
       p.Title,
       p.CreationDate,
       p.Score
FROM Posts p
JOIN PostAuthors pa ON p.OwnerUserId = pa.Id
WHERE p.PostTypeId = 1
ORDER BY p.Score DESC
LIMIT 10;