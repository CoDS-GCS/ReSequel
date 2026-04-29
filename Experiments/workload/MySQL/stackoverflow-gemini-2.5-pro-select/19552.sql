WITH InitialPosts AS
  (SELECT p.Id,
          p.Title,
          p.CreationDate,
          p.OwnerUserId
   FROM Posts p
   WHERE p.PostTypeId = 1
   ORDER BY p.CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   JOIN InitialPosts ip ON c.PostId = ip.Id
   GROUP BY c.PostId),
     VoteCounts AS
  (SELECT v.PostId,
          COUNT(v.Id) AS Cnt
   FROM Votes v
   JOIN InitialPosts ip ON v.PostId = ip.Id
   GROUP BY v.PostId)
SELECT ip.Title,
       ip.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       COALESCE(cc.Cnt, 0) AS CommentCount,
       COALESCE(vc.Cnt, 0) AS VoteCount
FROM InitialPosts ip
JOIN Users u ON ip.OwnerUserId = u.Id
LEFT JOIN CommentCounts cc ON ip.Id = cc.PostId
LEFT JOIN VoteCounts vc ON ip.Id = vc.PostId
ORDER BY ip.CreationDate DESC;