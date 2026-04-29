WITH LatestPostIds AS
  (SELECT Id
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
        FROM LatestPostIds)
   GROUP BY PostId),
     VoteCounts AS
  (SELECT PostId,
          COUNT(Id) AS Cnt
   FROM Votes
   WHERE PostId IN
       (SELECT Id
        FROM LatestPostIds)
   GROUP BY PostId)
SELECT p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.Cnt, 0) AS VoteCount
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
LEFT JOIN VoteCounts vc ON p.Id = vc.PostId
WHERE p.Id IN
    (SELECT Id
     FROM LatestPostIds)
ORDER BY p.CreationDate DESC;