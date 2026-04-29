
SELECT p.Title,
       u.DisplayName,
       p.CreationDate,
       p.Score
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
WHERE EXISTS
    (SELECT 1
     FROM
       (SELECT Id
        FROM Posts
        WHERE PostTypeId = 1
        ORDER BY CreationDate DESC
        LIMIT 10) AS top_posts
     WHERE top_posts.Id = p.Id)
ORDER BY p.CreationDate DESC;