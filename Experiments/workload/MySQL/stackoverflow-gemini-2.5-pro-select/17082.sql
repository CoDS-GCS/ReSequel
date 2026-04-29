WITH LimitedPosts AS
  (SELECT *
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
        FROM LimitedPosts)
   GROUP BY PostId),
     VoteCounts AS
  (SELECT PostId,
          SUM(VoteTypeId = 2) AS UpVotes,
          SUM(VoteTypeId = 3) AS DownVotes
   FROM Votes
   WHERE VoteTypeId IN (2,
                        3)
     AND PostId IN
       (SELECT Id
        FROM LimitedPosts)
   GROUP BY PostId)
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OWNER,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.UpVotes, 0) AS UpVotes,
       COALESCE(vc.DownVotes, 0) AS DownVotes
FROM LimitedPosts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
LEFT JOIN VoteCounts vc ON p.Id = vc.PostId
ORDER BY p.CreationDate DESC;