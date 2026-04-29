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
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM LatestPosts)
   GROUP BY PostId),
     VoteCounts AS
  (SELECT PostId,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 2) AS UpVotes,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 3) AS DownVotes
   FROM Votes
   WHERE PostId IN
       (SELECT Id
        FROM LatestPosts)
     AND VoteTypeId IN (2,
                        3)
   GROUP BY PostId)
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