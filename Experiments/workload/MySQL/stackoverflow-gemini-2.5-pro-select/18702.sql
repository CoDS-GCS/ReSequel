WITH LimitedPosts AS
  (SELECT p.Id,
          p.Title,
          p.OwnerUserId,
          p.CreationDate,
          p.ViewCount,
          p.Score
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT lp.Id AS PostId,
       lp.Title,
       u.DisplayName AS OwnerDisplayName,
       lp.CreationDate,
       lp.ViewCount,
       lp.Score
FROM LimitedPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id;