WITH comment_counts AS
  (SELECT PostId,
          COUNT(Id) AS CommentCount
   FROM Comments
   GROUP BY PostId),
     vote_counts AS
  (SELECT PostId,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 2) AS UpVotes,
          COUNT(*) FILTER (
                           WHERE VoteTypeId = 3) AS DownVotes
   FROM Votes
   GROUP BY PostId)
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS Author,
       COALESCE(cc.CommentCount, 0) AS CommentCount,
       COALESCE(vc.UpVotes, 0) AS UpVotes,
       COALESCE(vc.DownVotes, 0) AS DownVotes
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN comment_counts cc ON p.Id = cc.PostId
LEFT JOIN vote_counts vc ON p.Id = vc.PostId
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;