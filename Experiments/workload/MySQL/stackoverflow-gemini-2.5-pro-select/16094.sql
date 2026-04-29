WITH TopPostIds AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT PostId,
          COUNT(*) AS CommentCount
   FROM Comments
   JOIN TopPostIds ON Comments.PostId = TopPostIds.Id
   GROUP BY PostId),
     VoteCounts AS
  (SELECT PostId,
          COUNT(CASE
                    WHEN VoteTypeId = 2 THEN 1
                END) AS UpVotes,
          COUNT(CASE
                    WHEN VoteTypeId = 3 THEN 1
                END) AS DownVotes
   FROM Votes
   JOIN TopPostIds ON Votes.PostId = TopPostIds.Id
   GROUP BY PostId)
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(cc.CommentCount, 0) AS CommentCount,
       COALESCE(vc.UpVotes, 0) AS UpVotes,
       COALESCE(vc.DownVotes, 0) AS DownVotes
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
JOIN TopPostIds tpi ON p.Id = tpi.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
LEFT JOIN VoteCounts vc ON p.Id = vc.PostId
ORDER BY p.CreationDate DESC;