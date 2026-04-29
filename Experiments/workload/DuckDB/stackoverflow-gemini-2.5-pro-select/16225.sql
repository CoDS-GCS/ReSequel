WITH LatestPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10)
SELECT lp.Title,
       lp.CreationDate,
       u.DisplayName AS OwnerDisplayName,

  (SELECT COUNT(*)
   FROM Comments c
   WHERE c.PostId = lp.Id) AS CommentCount,

  (SELECT COUNT(*)
   FROM Votes v
   WHERE v.PostId = lp.Id
     AND v.VoteTypeId = 2) AS UpVoteCount,

  (SELECT COUNT(*)
   FROM Votes v
   WHERE v.PostId = lp.Id
     AND v.VoteTypeId = 3) AS DownVoteCount
FROM LatestPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
ORDER BY lp.CreationDate DESC;