WITH LimitedPosts AS
  (SELECT *
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT lp.Title,
       u.DisplayName AS OWNER,
       lp.CreationDate,
       lp.Score,
       lp.ViewCount
FROM LimitedPosts lp
INNER JOIN Users u ON lp.OwnerUserId = u.Id
ORDER BY lp.CreationDate DESC;