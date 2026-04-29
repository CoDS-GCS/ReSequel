WITH FilteredPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT fp.Title,
       fp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COUNT(c.Id) AS CommentCount
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN Comments c ON fp.Id = c.PostId
GROUP BY fp.Title,
         fp.CreationDate,
         u.DisplayName
ORDER BY fp.CreationDate DESC;