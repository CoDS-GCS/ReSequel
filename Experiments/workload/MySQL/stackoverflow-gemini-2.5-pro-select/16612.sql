
SELECT p.Id,
       p.Title,
       u.DisplayName,
       p.CreationDate
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE EXISTS
    (SELECT 1
     FROM
       (SELECT Id
        FROM Posts
        WHERE PostTypeId = 1
        ORDER BY CreationDate DESC
        LIMIT 10) AS TopPosts
     WHERE TopPosts.Id = p.Id)
ORDER BY p.CreationDate DESC;