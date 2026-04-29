WITH FilteredPosts AS
  (SELECT Id,
          Title,
          CreationDate,
          OwnerUserId
   FROM Posts
   WHERE PostTypeId = 1),
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
SELECT fp.Title,
       fp.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(c.Cnt, 0) AS CommentCount,
       COALESCE(v.UpVotes, 0) AS UpVotes,
       COALESCE(v.DownVotes, 0) AS DownVotes
FROM FilteredPosts fp
JOIN Users u ON fp.OwnerUserId = u.Id
LEFT JOIN CommentCounts c ON fp.Id = c.PostId
LEFT JOIN VoteCounts v ON fp.Id = v.PostId
ORDER BY fp.CreationDate DESC
LIMIT 10;