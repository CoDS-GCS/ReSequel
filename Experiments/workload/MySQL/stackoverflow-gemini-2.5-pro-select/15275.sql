WITH FilteredPosts AS
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
          COUNT(Id) AS CommentCount
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM FilteredPosts)
   GROUP BY PostId),
     VoteCounts AS
  (SELECT PostId,
          SUM(VoteTypeId = 2) AS UpVotes,
          SUM(VoteTypeId = 3) AS DownVotes
   FROM Votes
   WHERE PostId IN
       (SELECT Id
        FROM FilteredPosts)
   GROUP BY PostId)
SELECT fp.Id AS PostId,
       fp.Title,
       fp.CreationDate,
       u.DisplayName AS Author,
       COALESCE(cc.CommentCount, 0) AS CommentCount,
       COALESCE(vc.UpVotes, 0) AS UpVotes,
       COALESCE(vc.DownVotes, 0) AS DownVotes
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON fp.Id = cc.PostId
LEFT JOIN VoteCounts vc ON fp.Id = vc.PostId
ORDER BY fp.CreationDate DESC;