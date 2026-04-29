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
          COUNT(Id) AS Cnt
   FROM Comments
   WHERE PostId IN
       (SELECT Id
        FROM FilteredPosts)
   GROUP BY PostId),
     VoteCounts AS
  (SELECT PostId,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 2) AS Up,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 3) AS Down
   FROM Votes
   WHERE PostId IN
       (SELECT Id
        FROM FilteredPosts)
   GROUP BY PostId)
SELECT fp.Title,
       fp.CreationDate,
       u.DisplayName AS Author,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.Up, 0) AS UpVotes,
       COALESCE(vc.Down, 0) AS DownVotes
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON fp.Id = cc.PostId
LEFT JOIN VoteCounts vc ON fp.Id = vc.PostId
ORDER BY fp.CreationDate DESC;