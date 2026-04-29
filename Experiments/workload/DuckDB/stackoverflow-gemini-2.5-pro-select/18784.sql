WITH PostUsers AS
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
          COUNT(Id) AS Cnt
   FROM Votes
   GROUP BY PostId)
SELECT pu.Title,
       pu.CreationDate,
       pu.DisplayName AS OwnerDisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.Cnt, 0) AS VoteCount
FROM PostUsers pu
LEFT JOIN CommentCounts cc ON pu.Id = cc.PostId
LEFT JOIN VoteCounts vc ON pu.Id = vc.PostId
ORDER BY pu.CreationDate DESC
LIMIT 10;