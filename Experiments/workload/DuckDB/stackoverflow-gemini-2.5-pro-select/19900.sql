WITH LatestPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c SEMI
   JOIN LatestPosts lp ON c.PostId = lp.Id
   GROUP BY c.PostId),
     VoteCounts AS
  (SELECT v.PostId,
          COUNT(*) FILTER (
                           WHERE v.VoteTypeId = 2) AS UpVotes,
          COUNT(*) FILTER (
                           WHERE v.VoteTypeId = 3) AS DownVotes
   FROM Votes v SEMI
   JOIN LatestPosts lp ON v.PostId = lp.Id
   WHERE v.VoteTypeId IN (2,
                          3)
   GROUP BY v.PostId)
SELECT lp.Title,
       lp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.UpVotes, 0) AS UpVoteCount,
       COALESCE(vc.DownVotes, 0) AS DownVoteCount
FROM LatestPosts lp
JOIN Users u ON lp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON lp.Id = cc.PostId
LEFT JOIN VoteCounts vc ON lp.Id = vc.PostId
ORDER BY lp.CreationDate DESC;