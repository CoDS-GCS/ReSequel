WITH LimitedPosts AS
  (SELECT OwnerUserId,
          Title,
          CreationDate
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT u.DisplayName,
       lp.Title,
       lp.CreationDate
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id;