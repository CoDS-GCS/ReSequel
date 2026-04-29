WITH PostIDs AS
  (SELECT Id
   FROM Posts
   WHERE PostTypeId = 1
   ORDER BY CreationDate DESC
   LIMIT 10),
     CommentCounts AS
  (SELECT c.PostId,
          COUNT(c.Id) AS Cnt
   FROM Comments c
   JOIN PostIDs p ON c.PostId = p.Id
   GROUP BY c.PostId),
     VoteCounts AS
  (SELECT v.PostId,
          SUM(IF(v.VoteTypeId = 2, 1, 0)) AS UpVotes,
          SUM(IF(v.VoteTypeId = 3, 1, 0)) AS DownVotes
   FROM Votes v
   JOIN PostIDs p ON v.PostId = p.Id
   WHERE v.VoteTypeId IN (2,
                          3)
   GROUP BY v.PostId)
SELECT p.Id AS PostId,
       p.Title,
       p.CreationDate,
       u.DisplayName AS OwnerDisplayName,
       IFNULL(cc.Cnt, 0) AS CommentCount,
       IFNULL(vc.UpVotes, 0) AS UpVotes,
       IFNULL(vc.DownVotes, 0) AS DownVotes
FROM Posts p
JOIN Users u ON p.OwnerUserId = u.Id
JOIN PostIDs pi ON p.Id = pi.Id
LEFT JOIN CommentCounts cc ON p.Id = cc.PostId
LEFT JOIN VoteCounts vc ON p.Id = vc.PostId
ORDER BY p.CreationDate DESC;