WITH TopPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY Score DESC
   LIMIT 10)
SELECT u.DisplayName,
       tp.Title,
       tp.CreationDate,
       tp.Score
FROM Users u
JOIN TopPosts tp ON u.Id = tp.OwnerUserId
ORDER BY tp.Score DESC;