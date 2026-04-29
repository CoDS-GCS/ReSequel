
SELECT p.Id,
       p.Title,
       u.DisplayName,
       p.CreationDate
FROM
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10) AS top_posts
JOIN Posts p ON p.Id = top_posts.Id
JOIN Users u ON p.OwnerUserId = u.Id;