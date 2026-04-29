
SELECT p.Id,
       p.Title,

  (SELECT DisplayName
   FROM Users u
   WHERE u.Id = p.OwnerUserId) AS DisplayName,
       p.CreationDate
FROM Posts p
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;