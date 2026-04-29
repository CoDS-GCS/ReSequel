
SELECT p.Id AS PostId,
       ANY_VALUE(p.Title) AS Title,
       ANY_VALUE(p.CreationDate) AS CreationDate,
       ANY_VALUE(u.DisplayName) AS OwnerDisplayName,
       COUNT(DISTINCT c.Id) AS CommentCount,
       COUNT(DISTINCT v.Id) AS VoteCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN Comments c ON p.Id = c.PostId
LEFT JOIN Votes v ON p.Id = v.PostId
WHERE p.PostTypeId = 1
GROUP BY p.Id
ORDER BY ANY_VALUE(p.CreationDate) DESC
LIMIT 10;