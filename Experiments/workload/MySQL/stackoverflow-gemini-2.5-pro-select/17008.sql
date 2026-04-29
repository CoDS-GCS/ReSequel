WITH LimitedPosts AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT p.Id,
       p.Title,
       p.CreationDate,
       u.DisplayName,
       p.Score
FROM Posts p
JOIN LimitedPosts lp ON p.Id = lp.Id
JOIN Users u ON p.OwnerUserId = u.Id;