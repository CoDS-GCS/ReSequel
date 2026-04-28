SELECT u.DisplayName,
       p.Title,
       p.CreationDate,
       COUNT(c.Id) AS CommentCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN Comments c ON p.Id = c.PostId
WHERE p.PostTypeId = ###
GROUP BY u.DisplayName,
         p.Title,
         p.CreationDate
ORDER BY p.CreationDate DESC
LIMIT ###;