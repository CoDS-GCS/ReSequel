SELECT p.Title,
       u.DisplayName,
       p.CreationDate,
       p.Score
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE p.PostTypeId = ###
ORDER BY p.CreationDate DESC
LIMIT ###;