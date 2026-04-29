
SELECT p.Id,
       p.Title,
       p.CreationDate,
       u.DisplayName,
       p.Score
FROM Users u
JOIN Posts p ON u.Id = p.OwnerUserId
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;