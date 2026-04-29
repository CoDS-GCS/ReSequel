WITH FilteredPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          p.OwnerUserId
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT fp.Title,
       fp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COUNT(DISTINCT c.Id) AS CommentCount,
       COUNT(DISTINCT v.Id) AS VoteCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN Comments c ON fp.Id = c.PostId
LEFT JOIN Votes v ON fp.Id = v.PostId
GROUP BY fp.Id,
         fp.Title,
         fp.CreationDate,
         u.DisplayName
ORDER BY fp.CreationDate DESC;