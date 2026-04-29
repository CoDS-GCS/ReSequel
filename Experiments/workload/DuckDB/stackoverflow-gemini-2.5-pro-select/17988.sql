WITH LatestPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          u.DisplayName
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10)
SELECT lp.Title,
       lp.CreationDate,
       lp.DisplayName AS OwnerDisplayName,

  (SELECT COUNT(*)
   FROM Comments c
   WHERE c.PostId = lp.Id) AS CommentCount,

  (SELECT COUNT(*)
   FROM Votes v
   WHERE v.PostId = lp.Id) AS VoteCount
FROM LatestPosts lp
ORDER BY lp.CreationDate DESC;