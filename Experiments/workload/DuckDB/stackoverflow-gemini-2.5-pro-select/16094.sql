WITH PostDetails AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          u.DisplayName
   FROM Posts p
   JOIN Users u ON p.OwnerUserId = u.Id
   WHERE p.PostTypeId = 1),
     CommentCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Comments
   GROUP BY PostId),
     VoteCounts AS
  (SELECT PostId,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 2) AS UpVotes,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 3) AS DownVotes
   FROM Votes
   GROUP BY PostId)
SELECT pd.Title,
       pd.CreationDate,
       pd.DisplayName AS OwnerDisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.UpVotes, 0) AS UpVotes,
       COALESCE(vc.DownVotes, 0) AS DownVotes
FROM PostDetails pd
LEFT JOIN CommentCounts cc ON pd.Id = cc.PostId
LEFT JOIN VoteCounts vc ON pd.Id = vc.PostId
ORDER BY pd.CreationDate DESC
LIMIT 10;