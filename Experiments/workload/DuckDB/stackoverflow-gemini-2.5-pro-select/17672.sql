WITH UpVotes AS
  (SELECT PostId,
          COUNT(*) AS Cnt
   FROM Votes
   WHERE VoteTypeId = 2
   GROUP BY PostId),
     DownVotes AS
  (SELECT PostId,
          COUNT(*) AS Cnt
   FROM Votes
   WHERE VoteTypeId = 3
   GROUP BY PostId),
     CommentCounts AS
  (SELECT PostId,
          COUNT(*) AS Cnt
   FROM Comments
   GROUP BY PostId)
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(uv.Cnt, 0) AS UpVotes,
       COALESCE(dv.Cnt, 0) AS DownVotes
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
LEFT JOIN UpVotes uv ON p.Id = uv.PostId
LEFT JOIN DownVotes dv ON p.Id = dv.PostId
WHERE p.PostTypeId = 1
ORDER BY p.CreationDate DESC
LIMIT 10;