WITH LimitedPosts AS
  (SELECT Id,
          Title,
          OwnerUserId,
          CreationDate,
          Score
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT lp.Id,
       lp.Title,
       u.DisplayName,
       lp.CreationDate,
       lp.Score
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id;