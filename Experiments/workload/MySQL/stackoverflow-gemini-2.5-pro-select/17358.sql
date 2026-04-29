
SELECT p.Id,
       p.Title,

  (SELECT u.DisplayName
   FROM Users u
   WHERE u.Id = p.OwnerUserId) AS DisplayName,
       p.CreationDate,
       p.Score
FROM Posts p
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;