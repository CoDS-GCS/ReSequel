WITH PostActivity AS
  (SELECT PostId,
          'comment' AS TYPE,
          0 AS vote_type
   FROM Comments
   UNION ALL SELECT PostId,
                    'vote' AS TYPE,
                    VoteTypeId AS vote_type
   FROM Votes
   WHERE VoteTypeId IN (2,
                        3)),
     Aggregates AS
  (SELECT PostId,
          COUNT(*) FILTER (
                           WHERE TYPE = 'comment') AS CommentCount,
          COUNT(*) FILTER (
                           WHERE TYPE = 'vote'
                             AND vote_type = 2) AS UpVotes,
          COUNT(*) FILTER (
                           WHERE TYPE = 'vote'
                             AND vote_type = 3) AS DownVotes
   FROM PostActivity
   GROUP BY PostId)
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(a.CommentCount, 0),
       COALESCE(a.UpVotes, 0),
       COALESCE(a.DownVotes, 0)
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN Aggregates a ON p.Id = a.PostId
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;